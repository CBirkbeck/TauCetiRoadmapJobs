# Review of IntegralLattices (pull request #617 at e919c36)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/IntegralLattices/`, which changed by 161 lines since `d8192ae`. Of the previous review's eight findings, six are repaired and two are not: the gate failure and the unstated order against #1411 and #1797. Those two are raised again as R01 and R06. There are four new findings, all P3. Two concern the precision of the new B3 genus route. One is a dependency row that omits inputs its own route names (5B). One is a supplier row that names a consumer which does not consume it (B7). There is no P1 or P2 finding. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, unchanged since the previous review.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` change in this pull request

**Location.** `git diff --stat origin/main...HEAD` lists `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}` and `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.

**Claim.** The only folders named as this pull request's own are IntegralLattices, ClassFieldTheory and QuadraticFormInvariants. The `Completed/` changes lie outside all three, so the gate fails, and while it fails this folder cannot be accepted.

**Witness.** The worker's gate at `e919c36` prints `outside-folder=4 … build=0 FAIL`, with every other scanner at 0. My run prints `outside-folder=9`: the four `Completed/` files plus five files of the two named sibling folders.

**Repair.** Do one of the following, then rerun the gate until `outside-folder` lists only files of named folders:
- name `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, so that each gets its own review; or
- move those changes to a separate pull request. The title and description are about LocalFieldsRamification.

## R02 (P3) — B3: the genus characters at 2 are not specified, and the literal reading fails at `Δ = −8`

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:1342–1343`: "and at `2` the characters `δ(m) = (−1)^{(m−1)/2}` and `ε(m) = (−1)^{(m²−1)/8}` where `Δ` calls for them".

**Claim.** Steps 1–3 depend on the list of assigned characters:
- `Φ` is defined through them;
- `μ` counts them;
- step 2 asserts that they are independent and well defined on classes.

The sentence lists only `δ` and `ε`. But when `Δ/4 ≡ 6 (mod 8)` the character at 2 is the product `δε`, and neither factor is a genus character. Read literally, with `δ` and `ε` both assigned, `μ = 2` at `Δ = −8`. Then step 2 claims `2^{μ−1} = 2` genera, against one class.

**Witness.** At `Δ = −8` the one class `x² + 2y²` represents 1 and 3: `δ` and `ε` each take both signs; `δε` is `+`. At `Δ = −24`, `δ` is not constant on `x² + 6y²` (values 1, 7).

**Repair.**
1. Replace "the characters δ and ε where Δ calls for them" by the rule:
   - no character at 2 when `Δ ≡ 1 (mod 4)` or `Δ/4 ≡ 1 (mod 4)`;
   - `δ` when `Δ/4 ≡ 3 (mod 4)` or `Δ/4 ≡ 4 (mod 8)`;
   - `ε` when `Δ/4 ≡ 2 (mod 8)`;
   - the single character `δε` when `Δ/4 ≡ 6 (mod 8)`;
   - both `δ` and `ε` when `8 ∣ Δ/4`.
2. Add a Check: at `Δ = −8`, `x² + 2y²` represents 1 and 3, so only `δε` is constant; `μ = 1` and `2^{μ−1} = 1 = h`.

I tested the rule by brute force on the values of every reduced form:
- `Δ = −8`: `δε`;
- `Δ = −16` and `−4`: `δ`;
- `Δ = −24`: `ε`, with `χ₃`;
- `Δ = −32`: `δ` and `ε`, with tuples `(+,+)` and `(−,−)` on the two classes;
- `Δ = −12`: none;
- `Δ = 24`: `δε`;
- `Δ = 8`: `ε`;
- `Δ = 12`: `δ`.

## R03 (P3) — B3 step 3: the count `#C[2] = 2^{μ−1}` has no locator and no route for `Δ > 0`, and B4 does not supply it

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:1360–1361`: "`#C[2]` is the number of ambiguous classes (B4), which the count of ambiguous forms gives as `2^{μ−1}`".

**Claim.**
- B4 proves only that ambiguous classes are the classes of order at most 2. It does not count them.
- The count is the hardest input of step 3. Steps 1 and 2 give only `[C : C²] ≥ 2^{μ−1}`, so the upper bound must come from the count.
- For `Δ < 0` the count is covered only by the blanket Cox citation.
- For nonfundamental `Δ > 0`, which the README says "are proved here along the three steps", the count has no locator and no route.
- The *Needs* line (1372–1377) and the B3 row (1684) cite B4 for it.

**Witness.** The native `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` (`TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean:239`) assumes squarefree `d`, so it covers the maximal order only. The B4 declarations (row at README.md:1685) are index criteria only.

**Repair.**
- State the count as its own step, with hypotheses: for every nonsquare `Δ`, `#C[2] = 2^{μ−1}`, where `C` is `Pic 𝒪_Δ` (positive definite classes) for `Δ < 0` and `NarrowPic 𝒪_Δ` for `Δ > 0`.
- Give the count either a route (classes of order at most 2 contain ambiguous forms, counted up to proper equivalence) or a source whose locator covers nonfundamental positive discriminants.
- List it on the *Needs* line and in the B3 row instead of B4.

The count is true on the instances I computed by reduction cycles:

| `Δ` | `h⁺` | `2^{μ−1}` |
| --- | --- | --- |
| 12 | 2 | 2 |
| 24 | 2 | 2 |
| 32 | 2 | 2 |
| 45 | 2 | 2 |
| 20 | 1 | 1 |

## R04 (P3) — 5B: the dependency row omits inputs the route names, and the global realization theorem is not in the supplier contracts

**Location.**
- `TauCetiRoadmap/IntegralLattices/README.md:2353`: "| 5B | L 1G, 1H, 3C, 3D, 5A |".
- 5B (2157–2236) has no *Needs:* line.

**Claim.** The 5B route (2125–2132) uses several inputs:
- Milgram 1I for necessity;
- "the realization theorem of Global Quadratic Forms";
- `hilbertSymbol_productFormula`;
- "the adelic reconstruction of N0".

The README itself lists 5B as a consumer of these, at lines 506, 507 and 535 and at 3392–3394. The row omits all of them. The Global Quadratic Forms row (535) names only the Hasse–Minkowski theorems, so the realization theorem is not in any supplier contract.

**Witness.** Global Quadratic Forms §7.3 (its README.md:848) is the realization theorem `exists_globalForm_of_isAdmissible`, at its `Suggested.lean:516` on main. `exists_of_realization` (`TauCeti/NumberTheory/LocalField/QuadraticForm/Realization.lean:113`) is only the local version.

**Repair.**
- Replace the 5B row by "L 1G, 1H, 1I, 3C, 3D, 5A, N0; T `exists_of_realization`, `hilbertSymbol_productFormula`; R Global Quadratic Forms §7.3 `exists_globalForm_of_isAdmissible`".
- Add the same list as a *Needs:* line at the end of 5B.
- Add `exists_globalForm_of_isAdmissible` to the Global Quadratic Forms row of §*From other roadmaps*.

## R05 (P3) — The Orthogonal and Spin Groups supplier row lists B7, which consumes nothing from it

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:537`: "| 4B, 4C, 4F, B7 | Orthogonal and Spin Groups | 0C, 2C, 2F; `orthogonalBaseChangeReal`, `spinorNorm_reflection` |".

**Claim.** B7 cites no Orthogonal and Spin Groups item:
- B7's new *Needs* line (1618–1620) names B3–B6, the Restricted Products natives and `MeasureTheory.Measure.haar`;
- its row (1688) names the same;
- its text reads `T_L(ℝ)` off B6's `A_Δ ⊗ ℝ`.

So the consumer column contradicts B7's own prerequisites.

**Witness.** `grep -n 'orthogonalBaseChangeReal\|spinorNorm_reflection\b' README.md` matches only line 537. Lines 1566–1620 contain no citation of Orthogonal and Spin Groups.

**Repair.** Delete B7 from the consumer column of line 537. If B7 is meant to read `T_L(ℝ)` through `orthogonalBaseChangeReal`, add that item to B7's *Needs* line and row instead.

## R06 (P3) — Two open pull requests rewrite this folder differently, and no merge order is stated

**Location.** The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** #1411 and #1797 also change both IntegralLattices files, and their heads conflict with this one. Nothing says which is rebased onto which.

**Witness.** `roadmaps overlaps IntegralLattices` (index of 2026-11-09T17:01:41Z) reports "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`", and the same for #1797. #1187 also changes the folder, but its head merges.

**Repair.** State in the description which of #617, #1411 and #1797 merges first, and that the others rebase onto it. Do not restate in one what another already changes.

## Previous findings

| Previous | Status | What this head has |
| --- | --- | --- |
| R01 (gate `outside-folder`) | not repaired | The four `Completed/` files still change; see R01 above. |
| R02 (order against #1411, #1797) | not repaired | The description still reads "…which merge first: #1410"; see R06 above. |
| R03 (B3 locator and existence input) | repaired | README.md:1348–1362 is the three-step route. Line 1364 reads "For `Δ < 0` this is Cox, …, §3.B, Theorem 3.15 (uncertified)". The *Needs* line (1373–1374) adds `jacobiSym.quadratic_reciprocity` and `Nat.forall_exists_prime_gt_and_eq_mod`, and the B3 row (1684) matches. There are Checks at `Δ = −20` and `Δ = −36`. Two residual precision issues are new findings R02 and R03. |
| R04 (unowned determinant `−1` element) | repaired | N0 now owns it (1734–1746): "Choose `v ∈ L_p` whose norm `β(v, v)` generates the norm ideal `𝔫(L_p)`". Four Checks follow (1761–1771). 4B (1886–1887), the 7C bullet (2770), the N0 row (2100) and the docstring at `Suggested.lean:280–282` all cite N0. |
| R05 (two genus-symbol Checks) | repaired | The fusion Check is now "`⟨7⟩ ⊕ ⟨2⟩ ≅ ⟨1⟩ ⊕ ⟨14⟩`" (972–978). The clause Check (1019–1026) uses the legal symbols `1_5^{−1} 3^{+1}` and `1_7^{+1} 3^{−1}`. |
| R06 (B7 kinds and *Needs*) | repaired | The B7 row (1688) reads "T `RestrictedProductGroup`, …"; the *Needs* line is at 1618–1620. A residual inconsistency in the supplier row is new finding R05. |
| R07 (three Lean names) | repaired | README.md:2201 reads "those whose prime `NikulinGenerator.prime` is `p`". README.md:2907 names `Archimedean.SO` and `Archimedean.O` as abbreviations of the Mathlib groups. |
| R08 ("nonsquare class … ambiguous") | repaired | README.md:1482–1485: "A proper class whose form is properly equivalent to its opposite `f⁻` … is called ambiguous, in both branches; … the principal class among them". |

## Verified sound

**Gate, dependencies and build.**
- Gate (worker's run at `e919c36`): every scanner is 0 except `outside-folder=4` (R01); `build=0`.
- Dependency check, `gate --depcheck … --movable`: `depcheck: 236 roadmaps, 2287 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 in 3.2 s. The only diagnostics are 15 `declaration uses sorry` warnings, at lines 265, 284, 308, 325, 371, 378, 399, 412, 426, 441, 453, 472, 485, 547 and 574.
- `Suggested.lean` changed only in the docstring at lines 280–283. It has one `import Mathlib` and 21 `TauCeti.*` imports, all resolved by the build, and no `set_option`, `lemma`, `#eval` or sorry'd data.

**Padding probe.** On a scratch copy, each of the 15 `sorry`s was replaced by `first | rfl | infer_instance | simp | trivial | decide | aesop`. All 15 fail:
- 10 with unsolved goals;
- 5 with "aesop made no progress".

No theorem closes in one tactic, and none restates a definition, mirrors a Check or computes a small value.

**Signatures.** I elaborated `#check @` for all 36 declarations in one scratch file (0 errors) and compared each against its README statement. Nothing changed: no binder is lost, and the README's generality matches. For example, the second 4B theorem keeps `[FiniteDimensional ℚ V]` and `[L.IsNondegenerate]`. `signatures.md` agrees: 0 of 36 with a dropped section binder.

**Headline theorems.** The README's principal results, and where they stand:
- **Indefinite unimodular classification (6A):** stated, as two theorems.
- **Conway–Sloane symbols (3E/3G):** not statable; the docstring (lines 111–113) names the missing carrier.
- **Adelic class dictionary (4B):** stated, two theorems.
- **Spinor-genus dictionary (4C):** not statable; the docstring (lines 114–118) explains why.
- **Nikulin existence:** stated: 5A, 5B (three statements), 5G (two) and 5J.
- **Also stated:** 6E (two theorems) and 7E (two).
- **5I:** declared a README target.

No statable headline is missing and none goes through a stand-in.

**Library declarations opened this round (at the pins).**
- Tau Ceti:
  - `reflectionOrthogonal_mem_integralOrthogonalSubgroup` (`TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean:145`). Hypotheses: `hpolar`, `[Invertible (Q v)]`, `hv`, `‖Q v‖ = 1`. No `p ≠ 2`.
  - `isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` (`TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/PrincipalGenus.lean:150`). Hypotheses: `d` squarefree, and `s` the prime-discriminant factorization of the fundamental discriminant; so the maximal order only, as the README says at 485.
  - `mem_range_genusCharFunElementaryTwoQuotientFamilyLinearMap_iff` (same file, line 79).
  - `exists_genusCharFunElementaryTwoQuotientFamilyLinearMap_eq` (`…/GenusCharacter/Independence.lean:97`).
  - `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` (`…/Quadratic/TwoRank.lean:239`).
  - `exists_of_realization` (`TauCeti/NumberTheory/LocalField/QuadraticForm/Realization.lean:113`), the local realization.
- Mathlib:
  - `jacobiSym.quadratic_reciprocity` (`Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:423`, in namespace `jacobiSym`, line 401);
  - `Nat.forall_exists_prime_gt_and_eq_mod` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`).

**Cross-roadmap citations resolved on main (`1bea835`).**
- Global Quadratic Forms:
  - `hasseMinkowski_equivalent` (its `Suggested.lean:439`);
  - `equivalent_of_locallyEquivalent` (544);
  - §7.3 `exists_globalForm_of_isAdmissible` (516; README.md:848).
- Orthogonal and Spin Groups:
  - 0C (README.md:368), 2C (684) and 2F (717);
  - `spinorNorm_reflection` (`Suggested.lean:420`) and `orthogonalBaseChangeReal` (1025).
- DifferentialGeometry 12.1 and 12.4 (README.md:915, 923).
- Root Systems §3.1 (README.md:687).
- Rank-24 lattice constructions, Layers 3 and 6 (README.md:223, 312).
- `citations.md` lists 13 leads. All 13 are this roadmap's own `Suggested.lean` declarations, at lines 176–573. None is unresolved.

**Overlaps and ownership.**
- `overlaps.md` reports:
  - no id cited here that an open pull request drops;
  - no id that only an open revision defines;
  - no dropped id of this roadmap.
  The conflicts are R06.
- The closest open roadmaps:
  - OrthogonalTamagawaAndLatticeMass (rev 1222) cites this roadmap (its README.md:50, 189, 421) and does not own B3, N0 or 4B.
  - LatticePackingsAndPerfectForms (rev 1723) cites 0F and 4A.
  - MultiquadraticPartII (#1420) only consumes the native principal genus theorem.
  - GeometryOfNumbersAndQuadraticArithmetic (#851) is discussed below.
- GeometryOfNumbersAndQuadraticArithmetic 2.4.6 (its README line 619 at #851) proves the determinant `−1` reflection over any discrete valuation ring. It consumes this roadmap (its lines 138–140 and 1060). This roadmap is on main and that one is open, so N0 rightly owns the `ℤ_p` case on the native carrier. Pointing 2.4.6 at N0 for that case is a matter for #851's review, not a defect here.

**Sources sampled.**
- `allcock-gal-mark2016`:
  - §5 "Jordan symbols" starts at line 679 (p. 15);
  - Theorem 5.1 is at line 686 (p. 16), and the legal rank-one terms `q^{+1}_{±1}`, `q^{−1}_{±3}` at line 711 (p. 16). This confirms 3G's "§5, p. 16, after Theorem 5.1".
  - Theorems 6.2 and 6.3 are at lines 849 and 864 (p. 20), and Corollary 6.4 at 917 (p. 21), as 3E states;
  - compartment fusion is at lines 749–765.
- `boya-sudarshan-tilma2003`: §6 starts at line 638 (p. 16), equations (6.1)–(6.5) are on pp. 16–17, and (6.9) is at line 684 (p. 17), as 7E states.
- `voight2023`: Definition 3.10 (line 230), Lemma 3.12 (245) and Proposition 3.13(iii) (261), under the standing hypothesis `p ∤ disc` (line 229), as 4G states.

The sampled B-layer locators are recorded below; those into Cox, Cohen and Cassels are *Not verifiable*. B1 and B4 are native. B7 and B8 are proved here (B8 cites Conway–Sloane (1) and §6, waived).

**Remark (no change asked).** N0 says the native lemma's unit-norm hypothesis fails for `⟨1⟩` at 2. That is true in the README's fixed normalization `Q = B/2` (README.md:1708). Applied with `Q := B`, however (polar `2B` integral, `Q(e) = 1` a unit), the native lemma does cover `⟨1⟩` at 2. Only `⟨3⟩` at 3 and `⟨4⟩` at 2 genuinely need N0's argument, and the README lists both.

**Adversarial table.** Values marked *bf* were computed this round by brute force: reduced forms, values prime to `2Δ`, integral automorphisms with entries up to 13, and reduction cycles. The other rows are hand computations from this round. Rows marked *r25* are carried from earlier reviews for Lean statements whose text is unchanged; their values were re-read.

| Statement | Instances | Left / right values | Result | Change |
| --- | --- | --- | --- | --- |
| B1 `disc N_L = −4 det L`, content, `Δ` | `A₂`; `U`; `!![3,1;1,4]` | `4−16=−12=−4·3`, `c=2`, `Δ=−3`; `4=−4·(−1)`, `c=2`, `Δ=1`; `4−48=−44=−4·11`, `c=1`, `Δ=−44` | holds | none |
| B1 content under sublattices | `⟨2e₁,e₂⟩`, `⟨e₁+e₂,e₁−e₂⟩ ≤ ℤ²` | index 2 and 2; contents 1 (`4x²+y²`) and 2 (`2x²+2y²`) | holds | none |
| B2 oriented sign clause | `Δ=12`: `x²−3y²`, `−x²+3y²` | both ideals `𝒪₁₂`; the rotation gives `3x²−y²`, ideal `√3𝒪`, `N(√3)=−3`; `h⁺(12)=2` (bf), `h=1` | holds | none |
| B2 positive-definite restriction | `±(x²+y²)` | 2 proper classes against `#Pic ℤ[i]=1` | holds | none |
| B3 genus, `Δ=−20` (bf) | `(1,0,5)`, `(2,2,3)` | `(χ₅,δ)=(+,+)`, `(−,−)`; `h=2`, `2^{μ−1}=2`; second-genus primes `q ≡ 3, 7 (mod 20)` | holds | none |
| B3 Kronecker relation, `Δ=−36` (bf) | `(1,0,9)`, `(2,2,5)` | `(χ₃,δ)=(+,+)`, `(−,+)`; Kronecker `=δ` on both sides; `ker Φ=1=C²` | holds | none |
| B3 characters at 2 (bf) | `Δ=−8`, `−16`, `−24`, `−32`, `−12` | `x²+2y²`: `δ∈{±1}`, `ε∈{±1}`, `δε=+`; `−16`: `δ`; `−24`: `ε`; `−32`: `δ,ε`; `−12`: none | definition incomplete | R02 |
| B3 step 3 count, `Δ>0` (bf) | `Δ = 12, 24, 32, 45, 20` | `h⁺ = 2,2,2,2,1`; `2^{μ−1} = 2,2,2,2,1` | holds; no locator | R03 |
| B3 step 2 form | `Δ=−20`, `q=3`, `b=2` | `b²−Δ=24=4·3·2`, form `(3,2,2)` of disc `4−24=−20`, represents 3 with tuple `(−,−)` | holds | none |
| B3 ring class field (bf) | `Δ=−23` | reduced `(1,1,6)`, `(2,±1,3)`: 3 `= [H:K]` | holds | none |
| B3 split branch | `Δ=25`; `Δ=64` | genera `{1,4}`, `{2,3}`, torus order 2; 4 genera, torus trivial | holds | none |
| B4 `[O:SO]` (bf) | `!![2,1;1,12]`; `!![4,1;1,6]`; `A₂`; `⟨1⟩²`; `U`; `!![3,1;1,4]` | `|O|/|SO|`: 4/2; 2/2; 12/6; 8/4; 4/2; 2/2 | holds | none |
| B4 "ambiguous" (new wording) | principal class of `Δ=−23`; class of `(2,1,3)` | `1=1²`, index 2: ambiguous; order 3, index 1: not ambiguous | holds | none |
| B5 class counts (bf) | `Δ=−23`, `−44`, `25` | 3; `(1,0,11)`, `(3,±2,4)`: 3; `φ(5)=4` | holds | none |
| B6 integral points | `Δ=−4`, `12`, `U` | `{±1,±i}`; `N(2+√3)=1`, infinite; `{±1}` | holds | none |
| B7 volumes | `Δ=−4`; `Δ=12`; `U` | `2π/4=π/2`; `log(2+√3)=1.31696`; modulus kernel `ℤ̂ˣ`, volume 1 | holds | none |
| B7 prerequisites | *Needs* 1618 vs row 537 | O&S cited by row 537, absent from *Needs* and row 1688 | inconsistent | R05 |
| B8 masses (bf) | `A₂`; genus of `!![4,1;1,6]` | `m⁺=1/6`, `m=1/12`; `m=1/4+1/2=3/4=h⁺/(2w)` against `h/(2w)=1/2` | holds | none |
| N0 determinant `−1` (bf) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3; rank 0 | `s_e=−1`; `s_{e−f}: e↦f, f↦e`; `s_{e₁+e₂}(e₁)=(1/3,−2/3)∉L₃`; index 1 | holds | none |
| N0 native-lemma coverage | `⟨1⟩`@2, `⟨3⟩`@3, `⟨4⟩`@2 | `Q=B`: `Q(e)=1` unit; `Q=B/2`: `1/2`; `3/2` and `2`, non-units in both | holds in stated normalization | remark |
| 3E oddity fusion (bf) | `⟨7⟩⊕⟨2⟩`, basis `e₁+e₂`, `2e₁−7e₂` | `PᵀGP=diag(9,126)`, `det P=−9`; compartment oddity `7+1=1+7≡0` | holds | none |
| 3G clause independence | `1_5^{−1}3^{+1}`; `1_7^{+1}3^{−1}` | `1+2=3≢5`, signs as forced; `1+(2+4)=7`, signs opposite at 2 and 3 | holds | none |
| 4B classes (Lean) | `⟨1⟩`; genus of `!![4,1;1,6]`; `V=0` | 1 = 1; 2 = 2; singleton = singleton | holds | none (r25) |
| 4B proper classes (Lean) | genus of `!![4,1;1,6]`; `⟨1⟩` | 3 = 3 (`h⁺`); 1 = 1, with `K_p ∋ −1` | holds | none |
| 5A `sameGenus_iff_of_isEven` | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | `(16,0,0)`, trivial `q` on both: true/true; `q`-values `{1/4,3/4,0}` against `{0,0,1/2}`: false/false | holds | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩`@3; `⟨2⟩`,`⟨10⟩`@2 | `q(e/3)=1/3=2θ/3`, `θ=2`, `realizationDet=6=gramDet`; excluded by `hp` | holds | none |
| 5B `exists_evenLattice_iff` | `(1,0,q₁^{(3)}(3))`; `(0,2,·)`; `(0,0,0)` | `sign=6≠1`, no `⟨2a⟩` with `2|a|=3`: false/false; `A₂(−1)`: true/true; zero lattice: true/true | holds | none |
| 5B `exists_evenLattice_of_lt` | `(1,1,0)`; `(2,1,q₁^{(2)}(2))` | `U`; `⟨2⟩⊕U`, `2−1=1=sign`, `1<3` | holds | none (r25) |
| 5B prerequisites | route 2125–2132 vs row 2353 | route: 1I, N0, GQF §7.3, `hilbertSymbol_productFormula`; row: L 1G,1H,3C,3D,5A | inconsistent | R04 |
| 5G 1.12.2, 1.12.4 (Lean) | `S=0`; `⟨2a⟩ ↪ U`; `(1,0,1,1)` | `8 ∣ l₊−l₋` both sides; `e+af` of norm `2a`, primitive; `0≡0`, `2≤2`: true/true | holds | none |
| 5J sufficiency (Lean) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`; condition 4 fails (`8∤4`) | agrees | none |
| 6A even/odd (Lean) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` = `(9,0,9)`; parity hypotheses differ | holds | none |
| 6E (Lean) | `D₁₆E₈`/`E₈³`; Leech | roots 720 = 720, multisets differ; norm-2 shell empty against nonempty | holds | none |
| 7E (Lean) | `n = 0, 1, 2, 3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1)=2`; Frobenius control `2π√2` | holds | none |
| 7C stabilizer index | `⟨a⟩`; rank 0 | `K_p={±1}`, index 2; index 1 | holds | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.** Theorems 2.8 and 2.13 (B5), 3.9 (B4), §3.B Theorem 3.15 (B3, new) and 7.7 (B2) could not be checked. `sources fetch "Cox, Primes of the form x^2 + ny^2, 1989"` returned "no legal source found", and the roadmap's `sources.toml` has no Cox entry. The README marks all of these uncertified. The Tau Ceti file `PrincipalGenus.lean` cites the same §3.B, Theorem 3.15, which corroborates the locator but does not verify it.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5, B7): uncertified in the manifest; not read.
- **Cassels.** *Rational Quadratic Forms*, Chapter 13 (B4, B6), and *Geometry of Numbers*, Chapter VIII (2F): not in the manifest; not read.
- **Conway–Sloane, the mass formula paper** (B8, Layer 7): waived; not read.
- **Kawauchi–Kojima** (1G): uncertified; not read.
- **Other texts.** Nikulin, O'Meara, Serre, Milnor–Husemoller, Cho, Gan–Yu, SPLAG, Wall and van der Blij are not in the cache and were not read.

## Source issues

- none
