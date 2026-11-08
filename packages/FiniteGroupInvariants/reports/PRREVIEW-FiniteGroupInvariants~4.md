# Review of FiniteGroupInvariants (pull request #1708 at d60497d)

**Verdict:** needs changes

## R01 (P2) — 6.4–6.5 restate ArithmeticGaloisRepresentations §5.5–§5.6 without citing it

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/README.md` 6.4, line 910: "Define `schurIndex F χ` … the least `[E : F(χ)]`"; 6.5, line 941: "decompose `V ⊗ ℂ`; its constituents form a Galois-stable set, hence full orbits, each with the same multiplicity, which is the Schur index". Neither the scope section (lines 25–75) nor the supplier contracts mention ArithmeticGaloisRepresentations.

**Claim:** this roadmap owns two things: the Schur index of an irreducible character, and the correspondence between irreducible rational representations and Galois orbits, with the Schur index as multiplicity.

**Witness:** ArithmeticGaloisRepresentations is at merge-order line 57; this roadmap is at line 115.
- Its §5.5 defines the Schur index `s(ρ)` (Tau Ceti `Algebra.index`) and proves `s(ρ) ∣ n`.
- Its §5.6 proves that simple `k[Γ]`-modules over a perfect `k` correspond to Galois orbits, with multiplicity `s`.
- Its Q₈ Check gives `s = 2` over ℚ, the same value as 6.4's Check.

**Repair:**
- Cite ArithmeticGaloisRepresentations §5.5 (the image algebra and `s(ρ)`, `s(ρ) ∣ n`, realisability over `k'` iff `k'` splits `B(ρ)`) and §5.6 (simple modules over a perfect field) in the scope section and under a new "From ArithmeticGaloisRepresentations" contract.
- In 6.4, add an API bullet: `schurIndex F χ` is the index of the image algebra of a realisation of `χ` over `F(χ)`. Then `schurIndex_dvd_degree` is §5.5's `s(ρ) ∣ n`.
- In 6.5, make both halves the case `Γ = G` finite, `k = ℚ` of §5.6, and list §5.6 in *Needs:*. Keep here only the translation to Galois orbits of `TauCeti.irreducibleCharacters` and to `rationalCharacter`.
- Brauer–Speiser, the statements over `ℝ` and `ℂ`, and Galois invariance of the Schur index stay here. The Lean statements can stay, since they are phrased with this roadmap's `schurIndex` and `rationalCharacter`.
- Add the ArithmeticGaloisRepresentations pull request to the description's depends-on list.

Tested on two instances, where both roadmaps give the same value:
- Q₈: 2.
- C₃ with `χ(g) = ω`: 1. §5.5's image algebra over `ℚ(ζ₃)` has dimension 1, and 6.5's rotation representation on `ℚ²` has character `1 · (χ + χ̄)`.

## R02 (P3) — Library names that do not resolve at the pins

**Location:**
- README lines 154–155 (From Tau Ceti) and 7.4 (lines 1113–1126) cite:
  - `Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure`;
  - `Ideal.ramificationIdx_mul_inertiaDeg_under_smul_eq_relIndex_of_isIntegralClosure`;
  - `Ideal.ramificationIdx_under_smul_eq_relIndex_inertia_of_isIntegralClosure`;
  - `NumberField.Chebotarev.map_inertiaDeg_eq_fullCycleType_of_mem_frobeniusPrimeSet`;
  - the files `…/DoubleCoset/IntegralClosure.lean` and `…/Density/SplittingType.lean`.
- 0.6, line 320, cites `lowerCentralSeries`.

**Claim:** these are declarations of the pinned Tau Ceti and Mathlib.

**Witness:**
- This branch's `lake-manifest.json` pins Tau Ceti 358314d. Neither file and none of the four names exists there.
- Main's manifest pins 2fd255d, which has them (`IntegralClosure.lean:101`, `:173`, `:205`; `SplittingType.lean:51`).
- At Mathlib f6090c7, `lowerCentralSeries` is a deprecated alias of `Subgroup.lowerCentralSeries`.

**Repair:** either of these fixes the Tau Ceti names:
- Rebase the branch on main, so that its manifest pins Tau Ceti 2fd255d. The README then needs no change.
- Or cite the 358314d declarations in the table and in 7.4's *Needs:*:
  - `Ideal.doubleCosetQuotientEquivPrimesOver` (`TauCeti/NumberTheory/RamificationInertia/DoubleCoset/Basic.lean:152`);
  - `Ideal.ramificationIdx_mul_inertiaDeg_under_fixedField_smul_eq_relIndex` (`…/DoubleCoset/Invariants.lean:73`);
  - `Ideal.ramificationIdx_under_fixedField_smul_eq_relIndex` (`…/Invariants.lean:84`);
  - for splitting types, `Ideal.map_card_orbit_stabilizer_eq_map_ramificationIdx_mul_inertiaDeg` (`…/DoubleCoset/DecompositionOrbits.lean:164`). It says the orbit sizes of the decomposition group on `G ⧸ H` are the products `e·f`. At an unramified prime `e = 1`, and the orbits of `⟨σ⟩` are the cycles of `σ`.

Separately, write `Subgroup.lowerCentralSeries` in 0.6.

Every other library name the README cites resolves at the pins (list under Verified sound).

## R03 (P3) — `FinGrp` restates Mathlib's `FiniteGrp`

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:70–80`, "`structure FinGrp where carrier : Type` … `def IsoClass : Type 1 := Quotient …`"; README Conventions, lines 100–102.

**Claim:** isomorphism classes of finite groups need a new bundled carrier.

**Witness:** `Mathlib/Algebra/Category/Grp/FiniteGrp.lean:28` bundles a group with `[Finite]` as `FiniteGrp`, universe-polymorphic, with `FiniteGrp.of`. `CategoryTheory.isIsomorphicSetoid` gives its isomorphism classes.

**Repair:**
- Delete `FinGrp` and define `IsoClass := Quotient (CategoryTheory.isIsomorphicSetoid FiniteGrp.{0})`.
- Define `IsoClass.mk H := Quotient.mk _ (@FiniteGrp.of (Fin (Nat.card H)) (Finite.equivFin H).symm.group _)`.
- Cite `FiniteGrp` in the Conventions and in the Mathlib table.

Tested in a scratch file: both definitions elaborate, and a `MulEquiv` between two `FiniteGrp.{0}` gives a categorical isomorphism, so the classes are unchanged. 0.2's Check `IsoClass.mk C₄ ≠ IsoClass.mk (C₂ × C₂)` still applies.

## R04 (P3) — IG.4.3 is cited with Lean names it does not have, and the supersolvability remark sits on the wrong class

**Location:**
- README lines 30–33, 161–164 and 349–351: "`fitting` … Fitting's theorem `isNilpotent_sup_of_normal`; `fitting_characteristic`, `le_fitting`, and `fitting_nilpotent`".
- Lines 66–68: "including quasisimple groups (InverseGaloisAndArithmeticFundamentalGroups states its Grunwald theorem with its own supersolvability hypothesis …)".

**Claim:** IG.4.3 supplies these declarations, and InverseGaloisAndArithmeticFundamentalGroups has no supersolvability object.

**Witness:**
- At its open head, IG.4.3's target *The Fitting subgroup* (its README lines 4227–4252) states this API in prose, with no names. Its `Suggested.lean` declares no `fitting`.
- `roadmaps grep` finds the five names only in this README.
- Its `Suggested.lean:271` does declare `IsSupersolvable`.

**Repair:**
- Cite the Fitting subgroup in prose: IG.4.3, target *The Fitting subgroup*: Fitting's theorem; `F(G)` is characteristic; every nilpotent normal subgroup lies in `F(G)`; `F(G)` is nilpotent for finite `G`.
- In 0.8, state `F(G) ≤ R(G)` with no backticked supplier names.
- Move the parenthetical to follow "supersolvable".
- Add a 1.1 API bullet saying that InverseGaloisAndArithmeticFundamentalGroups' `IsSupersolvable` ("each step adjoins one element") agrees with this definition.

Check:
- `S₃`, through `⊥ < A₃ = ⊥ ⊔ ⟨(123)⟩ < S₃`, satisfies both definitions, and `A₄` neither.
- `F(S₄) = V₄ ≤ R(S₄) = S₄`.

## R05 (P3) — Sampled targets still without locators (continues r3's R10, partly repaired)

**Location:**
- No locator at all: 0.7, 0.8, 1.3, 1.4, 3.4, 3.6, 3.7, 4.2, 6.3, 7.3.
- Citations of a whole work:
  - 1.1: "huppert-1954;" (line 403);
  - 4.3–4.4: "hall-1940, isoclinism and stem groups" (line 771);
  - 5.1–5.2: "hall-1936, Eulerian formula" (lines 799, 811);
  - 5.4: "johnson-1971, main theorem";
  - 6.8: "gaschutz, main theorem";
  - 4.1: "(guralnick-1982)";
  - 9.1: "reiner-maximal-orders, §26";
  - 10.2–10.4: "bbnwz, class counts".

**Claim:** every target carries an exact locator.

**Witness:** the GDZ article scans in the source cache locate two of them:
- Huppert's criterion is Satz 9, printed p. 416 (huppert-1954 article scan, lines 347–348).
- The existence of stem groups, and their characterisation as the groups of least order, are on printed p. 135 (hall-1940 article scan, lines 278–300).

**Repair:**
- Write "huppert-1954, Satz 9, p. 416" and "hall-1940, p. 135 (isoclinism defined pp. 132–133)".
- Give a theorem or section number and a page for each of:
  - hall-1936;
  - johnson-1971;
  - gaschutz;
  - guralnick-1982;
  - reiner-maximal-orders (the Jordan–Zassenhaus theorem itself, not just the section);
  - bbnwz (its table of counts).
- Give a textbook theorem and page for the standard facts of 0.7, 0.8, 1.3, 1.4, 3.6, 3.7 and 6.3.
- For the elementary lemmas of 3.4, 4.2 and 7.3, give a locator or a one-clause note that the stated route is the proof.

## R06 (P3) — The 10.3–10.4 route claims one sandwich `|G|·L₀ ⊆ L ⊆ L₀` reaches every `ℤ`-class

**Location:**
- README 10.3, lines 1444–1445: "inside a `ℚ`-class the `ℤ`-classes are the `G`-stable lattices `L` with `|G| · L₀ ⊆ L ⊆ L₀` up to the normalizer".
- 10.4, lines 1458–1459.

**Claim:** for a `G`-stable `L₀`, every `ℤ`-class in the `ℚ`-class has a representative between `|G| L₀` and `L₀`.

**Witness:** let `G = C₂₃` act on `ℤ[ζ₂₃] ≅ ℤ²²` through `ζ`.
- The `G`-lattices are the fractional ideals. Between `23·ℤ[ζ]` and `ℤ[ζ]` lie only the ideals `(1 − ζ)^k`, all principal.
- The normalizer acts by `x ↦ a σ(x)`, which preserves principality.
- But `h(ℚ(ζ₂₃)) = 3`, so the non-principal classes are missed.

**Repair:** state the route as follows. The `ℤ`-classes are the `G`-stable `L` with `|G|·N ⊆ L ⊆ N`, modulo the normalizer of `G`, where:
- `N` runs over representatives of the isomorphism classes of `Λ'`-lattices in `V`;
- `Λ'` is a maximal order containing the image of `ℤ[G]` (9.1).

This is correct because `L ⊆ Λ'L ⊆ |G|⁻¹L` by 9.1's bound, and `Λ'L = φN` for some `φ ∈ End_G(V)ˣ`. On the witness, `N` runs over `ℤ[ζ]`, `𝔞` and `𝔞²`, and every class appears. The four class counts are not affected.

## R07 (P3) — One *Needs:* line for the five theorems of 10.5, listing 6.8 and omitting the Jordan route's inputs

**Location:** README line 1496: "*Needs:* 6.8; Mathlib `Matrix.ProjGenLinGroup.mk`, `IsAlgClosed`; Tau Ceti `TauCeti.ClassificationStatement`". It covers everything from `jordan_exists_abelian_normal_index_le` to `jordanBound_eq_factorial_of_classification`.

**Claim:** these inputs cover each of the five theorems.

**Witness:**
- None of the five statements (`Suggested.lean:713–744`) or their routes uses `irrDegreeC` (6.8).
- The Jordan route's first step, "the entries generate a finitely generated subfield, which embeds in `ℂ`" (line 1475), names no declaration. Neither do its averaging and packing steps.

**Repair:**
- Give each theorem its own *Needs:* line, and drop 6.8.
- For Jordan's theorem, reduce to `ℂ` through the character instead:
  - a finite `H ≤ GL_n(F)`, with `F` of characteristic zero, gives an `F̄`-representation determined by its character (Tau Ceti `Representation.nonempty_equiv_of_character_eq`);
  - that representation is realised over `ℚ(ζ_e) ⊂ ℂ` (CharacterTheory §4.5), and it is faithful because the kernel is read off the character;
  - curtis-reiner-1962 §36 is the source for the averaging and packing count.
- The finite-modulo-scalars corollary needs Jordan's theorem and an algebraic closure. `finrank_le_jordanBound` needs that corollary and `IsAlgClosed`. Collins' theorem needs `TauCeti.ClassificationStatement`.

Tested on `Q₈ ≤ GL₂(ℚ(i)(t))`: the character `(2, −2, 0, 0, 0)` is realised over `ℚ(i) ⊂ ℂ`, faithfully, without choosing an embedding of `ℚ(i)(t)`.

## Verified sound

### Repair status of the previous review (r3, at a25c898)

| r3 | Passage at this head | Status |
|---|---|---|
| R01 index-0 vacuity | `Suggested.lean:722` "`A.FiniteIndex ∧ A.index ≤ jordanBound n`"; README 10.5 Check `B = ℚˣ`, `A = ⊥` | repaired |
| R02 Jordan–Zassenhaus route unowned | 9.1 `jordan_zassenhaus_order` for `ℤ`-orders in semisimple `ℚ`-algebras; ClassicalArithmeticCompletion §7.4, §7.10, §7.21, §7.49, §7.56 cited; "a maximal order"; bound `|Γ|` derived from the regular trace | repaired; all five sections resolved on main (its README lines 14393, 14550, 14867, 15568, 15757) |
| R03 LocalFiniteGroupTheory | 0 mentions; Fitting subgroup from IG.4.3; quasisimple (1.5) and Hall's theorem (2.1, Wielandt route) owned here; components, `E(G)`, `F*(G)` dropped | repaired; the new citation invents names (R04) |
| R04 four statable headlines | `exists_herbrand_units`, `unitIndex_dvd_four`, `normalClosure_eq_of_dedekindZeta_eq`, `exists_isIrreducible_character_eq_schurIndex_mul` stated, plus Kubota's `infinite_setOf_unitType_eq` | repaired |
| R05 counting stand-in | `divisionSetoid_iff_exists_smul` | repaired |
| R06 inverse-transpose | 7.2 fixed-space argument `dim ker(gᵀ − 1) = dim ker(g − 1)`; Check that the automorphism swaps the order-7 classes | repaired |
| R07 "generating set of size k" | 5.2 "generated by at most `k` elements"; `C₂` Check at `k = 0, 1, 5` | repaired |
| R08 statement hygiene | `factors_add`, `existsUnique_invariantFactors`, `∑ᶠ`; gate `statement-hygiene=0` | repaired |
| R09 unused `IsMetacyclic` | deleted; 1.2 in prose | repaired |
| R10 locators | milne-gt (0.2, 0.5, 1.6), serre-bounds §1.3.1 (10.1), Hauptsatz 9.5 (1.1), desmit-perlis lines (7.5) added | partly; R05 |
| R11 supplier names | `NumberField.Units.unitLattice_rank`; NumberFieldArithmetic 1.5; Chebotarev declarations; `FiniteIndexNormalSubgroup` in Conventions (its `Lattice` instance at line 104, no `⊥`, confirmed) | repaired; four new Tau Ceti names miss the pin (R02) |
| R12 PolynomialGaloisGroups §4.1 | no longer cited; 7.4 owns both directions of Perlis' theorem | resolved by removal |
| R13 style | "corrected" gone; `d_ind`; `IsCompleteGroup`; section title aligned; 3.4–3.5 exact | repaired |

### Gate, build, signatures, probes

- **Gate, rerun with the brief's command:** every check `0`, `OK`. The worker's record agrees, with `build=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`, and nothing outside the folder changed.
- **Elaboration** (`lake env lean`, Mathlib f6090c7, Tau Ceti 358314d): 53 `sorry` warnings, one per theorem, and nothing else.
- **Signatures:** `#check @` of all 96 declarations elaborated, and each was compared with its README statement.
  - `[Finite G]` is in every theorem that needs it; `[Fintype G]` only where a sum is written (`IsMonomial` and its three theorems).
  - `[CharZero F]`, `[IsAlgClosed F]`, `[IsSemisimpleRing A]`, `[Module.Finite ℤ Λ]`, `[NeZero p]` and `[N.FiniteIndex]` appear exactly where the README states them.
  - `characterField`, `schurIndex`, `irrDegreeC`, `mobiusSub`, `mobiusQuo` and `eulerian` keep `[Finite G]`.
  - No binder was lost, and nothing needed changing.
- **One-tactic probe:** a copy with `first | rfl | infer_instance | (simp; done) | trivial | decide | (norm_num; done) | omega` in place of each `sorry` closed 0 of 53.
- **Scratch probes, all elaborated:**
  - the `FiniteGrp` repair of R03;
  - `minkowskiBound` for `n = 0..8` gives `1, 2, 24, 48, 5760, 11520, 2903040, 5806080, 1393459200`, exactly serre-bounds lines 113–120.
- **Dependency check:**

```text
depcheck: 229 roadmaps, 2316 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers come earlier in the merge order than this roadmap (line 115):
- InverseGaloisAndArithmeticFundamentalGroups: line 53;
- ArithmeticStatisticsPartV: line 54;
- ArithmeticGaloisRepresentations: line 57 (R01);
- InductionRestrictionPartII: line 63.

ClassicalArithmeticCompletion is on main.

### Headline inventory

The summary's end theorems and the other deep results, and how `Suggested.lean` covers them:
- **Stated:**
  - Jordan–Hölder for chief and for composition series, with additivity;
  - minimal normal subgroups; the socle; invariant factors;
  - Huppert's criterion; almost simple groups; Hölder's theorem;
  - Hall's theorem and its converse;
  - divisions as orbits;
  - Guralnick's theorem; Hall's stem theorem;
  - Hall's Eulerian formula; faithful characters by Möbius inversion; Johnson's formula;
  - Brauer's permutation count; the rational character basis; the Schur index dividing the degree; Brauer–Speiser; both halves of 6.5; the rational-group criterion;
  - Taketa, supersolvable ⇒ monomial, Taunt;
  - Gaschütz;
  - Gassmann equivalence in quotients; Bauer; Perlis; the invariants of 7.5;
  - the prime-power case of elusiveness; Fein–Kantor–Schacher;
  - Jordan–Zassenhaus for orders and for group rings; Diederichsen–Reiner; Herbrand;
  - Kuroda's formula, Kuroda's list and Kubota's theorem;
  - integral conjugacy; Minkowski's lemma and bound; the dimension 2, 3 and 4 counts;
  - Jordan's theorem with its two corollaries, Schur's bound and Collins' theorem.
- **Not stated:** the character form of Herbrand (the docstring says why). It is a corollary of the stated unit form `exists_herbrand_units`, so its absence is not a gap.
- **Not headlines, kept in the README:** 7.6 (the count of arithmetically equivalent fields) and the order-96 sharpness of Guralnick's theorem.
- **Every definition is used:** each of the 43 named definitions, structures and classes is used by some theorem.

### Adversarial table (values computed on each side)

`D_n` has order `2n`, `1` is the trivial group, and `μ(H) = μ(H, G)`.

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 0.1 modular law | `A₄`: `A=⟨(12)(34)⟩≤C=V₄`, `B=⟨(123)⟩` | `A⊔(B⊓C)` order 2 / `(A⊔B)⊓C` order 4 | normality needed; the Lean instance is proved |
| 0.2 `chiefFactors_eq` (sampled) | `C₆` two series; `S₄`; `1` | `{C₂,C₃}`/`{C₃,C₂}`; `{V₄,C₃,C₂}`; `∅`/`∅` | sound; milne-gt Example 6.29(a) |
| 0.3 | base of `A₅≀C₂`; `A₄` | `A₅²`, `k=2`; `V₄≅C₂²` | sound |
| 0.5 `factors_eq`, `factors_add` (sampled) | `S₄`, `N=V₄`; `C₁₂`; `A₅×C₂`; `N=⊤` | `{C₂,C₃}+{C₂,C₂}={C₂,C₂,C₂,C₃}`, `2+2=4`; 3 = Ω(12); 2 vs Ω(120)=5; `∅` + factors of `N≅G` | sound; milne-gt Theorem 6.2 |
| 0.6 derived length | `1,C₂,S₃,S₄,A₅`; `C₂≤A₅`; `D₈` | `0,1,2,3,0` (junk value); `1` vs `0`; class 3, `d=2≤⌊log₂3⌋+1=2` | solvability hypotheses needed and present |
| 0.7 `isMulCommutative_socle` | `S₄`, `Q₈`, `A₅`, `1` | `V₄`; `C₂`; `A₅` nonabelian but not solvable; `⊥` | sound |
| 0.8 radical (sampled) | `A₅×C₂`; `SL(2,5)`; `S₄,S₃,A₅` | `R=C₂`; `R=Z≅C₂`; `F=V₄<S₄`, `F=A₃<S₃`, `F=⊥=R(A₅)` | sound |
| 0.9 `existsUnique_invariantFactors` | `ZMod 6`; `C₂×C₂×C₃`; `C₂×C₄`; `1` | `[6]` (`[2,3]`, `[3,2]` fail); `[2,6]`; `[2,4]`; `[]`, product 1 | unique under `Pairwise (·∣·)` |
| 1.1 Huppert (sampled) | `S₃`; `A₄`; `1` | indices 2,3,3,3 / chain `⊥<A₃<S₃`; `C₃` index 4 / no normal `C₂`,`C₃`; no coatom / `⊥=⊤` | true/true, false/false, true/true |
| 1.4 rational (sampled) | `C₃`; `S₃`; `Q₈`; `A₄`; `1` | `g≁g²`; cycle type kept; `i∼i³`; `(123)≁(132)` in `A₄`; only `x=1` | F, T, T, F, T |
| 1.5 `isAlmostSimple_iff` | `1`; `A₅`; `S₅`; `A₅²`; `SL(2,5)` | F/F (trivial range ⊉ `Inn S`); T/T; T/T (`S₅≅Aut A₅`); F/F; F/F | sound |
| 1.6 Hölder (sampled) | `n=0,1,3`; `n=2`; `n=6` | complete; centre `C₂`; `\|Out S₆\|=2` | hypotheses exact; milne-gt Example 3.4(a) |
| 1.7 `e(G)` | `1`; `C₃`; `C₆`; `S₃` | 1 & elementary T/T; 3; 6; 1 & not elementary T/T | sound |
| 2.1 Hall, converse | `S₃`, `π={3}`; `A₅`; `S₄` | `A₃`, index 2; no subgroups of order 15 or 20 / not solvable; complements of orders 3 and 8 / solvable | sound; Wielandt route checked (`N ≤ H_j`, `G = H₁H_j`) |
| 3.4 counts (sampled) | `Q₈`; `S₃`; `1`; `C₆` | `3≤6≤6≤6`; `3≤3≤4≤6`; 1,1,1,1; 4,4,4,4 | chain sound; `n=c` iff all subgroups normal: T/T, F/F |
| 3.7 `divisionSetoid_iff_exists_smul` | `A₄`, `e=6`; `C₃`; `1` | `(123),(132)`: `n=2` / `u=5` T/T; `(123),(12)(34)`: orders 3,2 F/F; `u=2` swaps; `ZMod 1` one unit, `g⁰=1` | sound |
| 4.1 Guralnick | `C₂`; `S₃`; `Q₈` | length 0 (`⊥ ⊆ {1}`); 1; `−1=⁅i,j⁆`: 1 | sound below 96 |
| 4.2 `commutatorMap` (sampled) | `Q₈`: `(ī,j̄)`, `(ī,ī)`; abelian `G` | `ijij=k²=−1`; `1`; constant `1` | well defined (proved in the file) |
| 4.4 stem (sampled) | `Q₈∼D₄`; `D₄×C₂`; abelian | `G/Z≅C₂²`, `G'≅C₂`; `Z=C₂²⊄G'`, stem order `(G:Z)(Z∩G':1)=4·2=8=\|D₄\|`; trivial only | hall-1940 p. 135 formula agrees |
| 5.1 μ | `A₄`; `Q₈`; `C₂²` normal lattice; `S₃` chain | `μ(1)=−(1−1−4+0)=4`; 0; 2; 0 | sound |
| 5.2 Hall's formula (sampled) | `S₃`, `k=2`; `C₂²`, `k=2`; `C₂`, `k=0,1,5` | `18=36−9−12+3`; `6=16−12+2`; 0,1,31 / F,T,T | sound |
| 5.3 faithful characters | `C₂`; `C₂²`; `S₃`; `S₄` | `2−1=1`; `4−6+2=0`; `3−2+0=1`; `5−3=2` | sound |
| 5.4 Johnson (sampled) | `C₆`; `C₄×C₄`; `Q₈`; `1` | `2+3=5` (transitive 6); 8 (transitive 16); 8; 0 (`⨅∅=⊤=⊥`) | sound |
| 6.1 character field | `C₃`, `ω`; `A₅` degree 3 | `ℚ(√−3)`, conductor 3; `ℚ(√5)`, conductor 5 | sound |
| 6.2 Brauer's count | `A₄`; `SL(2,3)`; `A₅`; `C₃` | 3/3; 5/5; 4/4; 2/2 | sound |
| 6.3 rational basis | `C₃`; `A₅`; `1` | `det[[1,1],[2,−1]]=−3`; `(6,−2,0,1,1)`; `[1]` | sound |
| 6.4 Schur index | `Q₈` over `ℚ`; `D₄`; `F=ℂ` | 2 (`E=ℚ(i)`), divides 2, `≤2`; 1; `relfinrank ⊤ ⊤ = 1` | sound; owner: R01 |
| 6.5 both halves | `Q₈`; `C₃` on `ℚ²`; `1` | `(4,−4,0,0,0)=2·(2,−2,0,0,0)`; `(2,−1,−1)=1·(χ+χ̄)`; `1·1` | sound; owner: R01 |
| 6.6 | `S₃`; `C₃`; `A₄`; `Q₈` | T/T; F/F; F/F; T/T | sound |
| 6.7 Taketa, Taunt | `S₄`; `SL(2,3)`; `A₅` | monomial (induced from `D₄`); solvable, no index-2 subgroup, not monomial; no index-3 subgroup, not solvable | consistent |
| 6.8 Gaschütz | `S₄`; `C₄²`; `C_n`; `1` | socle `V₄=⟨(12)(34)⟩^G`, degree 3; socle `C₂²` is not one class / `⊤`; 1; `⊥=⟨1⟩^G` / 1 | sound; equivalent to the abelian-socle form |
| 7.1–7.2 | `C₂²` index 2; `GL₃(𝔽₂)` order 7 / transvection | 2 vs 0 fixed cosets; 0/0 and 3/3 `=2^{dim ker}−1` | sound |
| 7.3 `…_iff_map` (sampled) | `ℤ`, `H=K=2ℤ`, `N=4ℤ`; `ℤ²`, `γ=(1,0)`; `N=⊥` | T/T; 0 vs 2, both sides F; identity | sound |
| 7.4 Bauer | `ℚ(√2),ℚ(√3)`; `ℚ(⁸√−15),ℚ(⁸√−240)` | `3^{−s}` coefficient 0 vs 1 (hypothesis F), closures differ; equal zeta, closure degree 32 | sound (desmit-perlis lines 29–32) |
| 7.4 Perlis | `H=K`; two quadratic subfields | T/T; F/F | sound |
| 7.5 | the `⁸√−15` pair | degree, discriminant, signature, `hR` equal; `h/h'=2` | class number rightly excluded (desmit-perlis lines 35–36, 72–75) |
| 8.1 `b` (sampled) | `S_n`; `C₃≤S₃`; `C₂²` regular | index 1, `b=1`; 2 classes of index 2 → 1 division, `b=1`; 3 divisions of index 2, `b=3` | agrees with ArithmeticStatisticsPartV §3.9 Checks |
| 8.2 | `C₃≀C₂≤S₆`; `A₄` | index 2 from `(a,1),(1,a)`, which generate `C₃²`, `d_ind=3`; index 2 from 3-cycles and `(12)(34)`, `d_ind=6`, which generate `A₄` | sound (swap: index 3; `τ(a,1)`: index 5) |
| 8.3 (sampled) | `S₂`; `C₂²` regular; `\|α\|=1` | `(01)` order 2, fixed-point-free; all involutions free; excluded by `1<Nat.card α` | sound (fks Theorem 1) |
| 9.1 Jordan–Zassenhaus | `ℤ[C₂]` rank 1; rank 0; `ℤ[x]/(x²)` | 2 classes; 1; infinitely many (cokernel `ℤ⊕ℤ/a`) | semisimplicity needed and present |
| 9.2 Diederichsen–Reiner | `p=2,3,23` | `h=1`: 3; `h=1`: 3; `h=3`: 7 | sound (reiner-1957 lines 139–142) |
| 9.3 Herbrand | `ℚ/ℚ`; `ℚ(√2)/ℚ` | `ε=1`, index 2; `(η²,η⁻²)`, product 1, index 4, `a₁=a₂`; `(η,σ(η))` product `−1` fails | sound; equivariance convention checked against `σ•w = w.comap σ⁻¹` |
| 9.4 Kuroda | `ℚ(√2,√3)`; `ℚ(i,√2)` | `4·1=4·1`; `2·1=2·1` (`ζ₈`) | sound (lemmermeyer lines 102, 110–113) |
| 9.4 list, Kubota | type of `ℚ(√2,√3)`; orbits | `{a: a₁=0}`, order `4 ∣ 4`; 1+3+3 orbits, `q=1,2,4,2,4,4,2` | sound (kubota lines 13–21) |
| 10.1 | `⟨[[0,2],[½,0]]⟩`; `n=0` | `diag(1,2)` conjugates; identity | sound (serre-bounds lines 189–192) |
| 10.2 | `m=2`; `M(0..8)` | `−1≡1`, order 2; Lean values = Serre's table | sound |
| 10.3–10.4 (sampled) | `n=1,2` | `(2,2)`; `7+2·3=13` over 10; `710≥227` | counts consistent; route: R06 |
| 10.5 Jordan | `SL(2,5)`; `SL(2,p)` | `60≤J(2)`; `p(p²−1)/2`, unbounded | characteristic zero needed and present |
| 10.5 corollaries | `B=ℚˣ`; `B=ℂˣ` | `⊥`: index 0, not `FiniteIndex`; `A=B`: `1≤1`; irreducibles 1-dimensional `≤J(1)=1` | sound |
| 10.5 Schur, Collins | `n=1`; `n=0`; `n=71` | `1≤4√8≈11.3`; right side 0 `<J(0)=1`; `S₇₂` index `72!` | `n≥1` present |

### Library declarations opened at the pins (Mathlib f6090c7, Tau Ceti 358314d)

- **Mathlib:**
  - `Algebra/Category/Grp/FiniteGrp.lean:28`;
  - `GroupTheory/FiniteIndexNormalSubgroup.lean:25`, `:104`;
  - `NumberTheory/NumberField/Basic.lean:124` (`MulSemiringAction G (𝓞 K)`);
  - `NumberTheory/NumberField/Units/Basic.lean:145`;
  - `FieldTheory/IsAlgClosed/Classification.lean`;
  - 94 names in all by `#check` (every library name the README cites outside Tau Ceti), including `LSeries_eq_iff_of_abscissaOfAbsConv_lt_top`, `Ideal.sum_ramification_inertia_eq_finrank`, `MonoidAlgebra.Submodule.exists_isCompl`, `Matrix.rank_transpose`, `Matrix.ProjGenLinGroup.mk`, `NumberField.InfinitePlace.smul_eq_comap`, `NumberField.dedekindZeta_residue`, `IsGalois.intermediateFieldEquivSubgroup`, `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`;
  - all resolve except the deprecated `lowerCentralSeries` (R02).
- **Tau Ceti:**
  - `RepresentationTheory/CharacterTable/Table.lean:186`, `:244`;
  - `…/Kernel.lean:130` (`FDRep.mem_ker_iff_char_eq`);
  - `…/CyclotomicAction.lean:201`;
  - `…/Determined.lean:74`;
  - `…/Solvable.lean:219`;
  - `…/FrobeniusSchur/Realizability.lean:83`;
  - `GroupTheory/Elementary.lean:293`;
  - `GroupTheory/SpecificGroups/CFSG/Classification.lean`;
  - `RingTheory/KrullSchmidt/Indecomposable.lean`;
  - `ProjectiveRepresentation/SchurMultiplier.lean:148`;
  - `NumberTheory/NumberField/SplitsCompletely/GaloisClosure.lean:115`, `:162`;
  - `NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93`;
  - `…/Density/Chebotarev.lean:51`, `:74`;
  - `…/Density/SplitsCompletely.lean:93`;
  - `Algebra/CentralSimple/Index.lean:99`;
  - the `DoubleCoset` files of R02.
  - Also opened and found not to duplicate this roadmap's objects:
    - `GroupTheory/Gaschutz.lean` (the lifting lemma, not the faithfulness criterion);
    - `GroupTheory/FiniteGroupClass.lean` (classes closed under extensions);
    - `LinearAlgebra/Matrix/SmithNormalForm.lean` (an integer-matrix chain, not invariant factors of an abstract group);
    - `GroupTheory/DerivedCentralQuotient.lean`.

### Cross-roadmap citations resolved

- **ClassicalArithmeticCompletion (main):** §7.4 `IntegralOrder.IsOrder`, `.isIntegral`, `groupRing_isOrder` (its README lines 14401–14406); §7.10; §7.21 `IntegralOrder.IsMaximalOrder` (line 14875); §7.49; §7.56. They are used as stated: the regular trace of a semisimple `ℚ`-algebra is nondegenerate, so §7.49 and §7.56 apply.
- **RepresentationTheory/CharacterTheory (main):** §4.4 (line 760, `fieldOfValues_eq_map_fixedField_stabilizer` at its `Suggested.lean:171`); §4.5 (line 817); Layer 7 (line 1150).
- **RepresentationTheory/InductionRestriction (main):**
  - §2.1 (line 346), with `Gassmann.almostConjugate_iff_permutation_equiv` at its `Suggested.lean:729`. The citations tool's lead calling it missing is false.
  - §2.2 (line 433, `Gassmann.exists_S16_gassmann_pair` at `Suggested.lean:826`); Layer 5 (line 607); Layer 7 (line 721).
- **InductionRestrictionPartII (open head):** §RS.0.1 at its README line 313, with the stem corollaries.
- **ArithmeticStatisticsPartV (open head):** §3.9, subsection *Malle invariants of a permutation group* (its README lines 1075–1117).
- **InverseGaloisAndArithmeticFundamentalGroups (open head):** IG.4.3 *Shafarevich's theorem*, line 3911, contains the target *The Fitting subgroup* (lines 4227–4252). The names are invented (R04).
- **Downstream consumers:** each cites this roadmap at its head:
  - SatoTateGroups: lines 424, 1790;
  - AdelicImagesAndModularCurves: lines 70, 448;
  - QuaternionArithmetic: lines 98, 2230;
  - HyperellipticCurves: line 162;
  - PadicExtensionFamilies: line 155;
  - HypergeometricMotives: line 103;
  - ArtinRepresentations: line 247.
  - GroupActionsOnRiemannSurfaces lists this roadmap among *its* consumers (its line 1697) and cites nothing from it. That is that roadmap's matter.
- **Overlaps:** `scratch/overlaps.md` lists none; no other open pull request changes this folder.

### Ownership

Searched with `roadmaps grep` across main and all 462 open heads for each object, by name and by description: chief and composition factors, socle, solvable radical, supersolvable, quasisimple, almost simple, Hall subgroups, isoclinism, stem groups, commutator length, Eulerian functions, Schur index, Jordan–Zassenhaus, Minkowski's bound, Jordan's constant.
- Hits outside this roadmap:
  - InverseGaloisAndArithmeticFundamentalGroups' `IsSupersolvable` helper (R04);
  - ArithmeticGaloisRepresentations §5.5–§5.6 (R01);
  - AbelianVarietiesOverFiniteFields' finiteness of `ICM Λ`, which cites Reiner §26 and is later in the order (line 392);
  - OddOrderTheorem, which takes Hall subgroups from the dropped LocalFiniteGroupTheory;
  - "isoclinic" hits elsewhere concern isocrystals, and "Minkowski" hits concern lattices.
- Neither pin defines supersolvable, quasisimple, almost simple or complete groups, the socle of a group, isoclinism, Schur indices of characters, Eulerian functions or invariant factors of a finite abelian group.
- No declaration of `Suggested.lean` reuses another roadmap's fully qualified name.

### Seeded source sample

| Target | Text and locator | Outcome |
|---|---|---|
| 0.2 Jordan–Hölder for chief series | milne-gt Example 6.29(a), p. 98 (lines 3728–3735) | verified: admissible series for conjugation action |
| 0.5 Jordan–Hölder for composition series | milne-gt Theorem 6.2, p. 88 (lines 3337–3341) | verified |
| 0.8 solvable radical | none cited | statements checked; locator missing (R05) |
| 1.1 supersolvable | huppert-1954 article scan Satz 9, p. 416 (lines 347–348); Satz 3 p. 413 | verified; Satz not written (R05) |
| 1.4 rational groups | none cited | checked; locator missing (R05) |
| 1.6 complete groups | milne-gt Definition 3.3, Example 3.4(a), p. 44 (lines 1656–1661) | verified: `n ≠ 2, 6` |
| 3.4 subgroup counts | none cited | checked; locator missing (R05) |
| 4.2 commutator map | none cited | well-definedness proved in the file |
| 4.4 stem groups | hall-1940 article scan p. 135 (lines 278–300) | verified, finite groups; page not written (R05) |
| 5.2 Eulerian functions | hall-1936 (waived) | not verifiable; values computed |
| 5.4 permutation degree | johnson-1971 (waived) | not verifiable; values computed |
| 7.3 finite-index subgroups | none cited | elementary; checked |
| 8.1 `b(ℚ, G)` | ArithmeticStatisticsPartV §3.9 | supplier verified |
| 8.3 elusive groups | fks Theorem 1, printed p. 41 (fks article scan lines 109–113) | verified: transitive, `\|Ω\| > 1`, a fixed-point-free `r`-element; uses the classification |
| 10.3 dimensions 1–3 | bbnwz (waived) | not verifiable; `n = 2` count reconstructed (13/10) |

Also verified:
- lemmermeyer line 15 and lines 102–113;
- kubota lines 13–21;
- serre-bounds lines 85–148 and 187–192;
- reiner-1957 lines 117–142;
- sutherland-18785 line 122 (Theorem 24.6, for `L/K` Galois);
- desmit-perlis lines 14–36, 52–53, 72–75 and 91–95.

## Not verifiable

- **Waived** (cited by locator, text not read): robinson, aschbacher, curtis-reiner-1962 (Schur's bound, §36), reiner-maximal-orders (the Minkowski step of the Jordan–Zassenhaus route for maximal orders in simple algebras), karpilovsky, bbnwz (the counts 73/32 and 710/227, and `|W(F₄)| = 1152`, are standard but not read), gaschutz, johnson-1971, hall-1936, collins.
- **Uncertified:** huppert-eg1, isaacs (Theorems 5.12, 6.22–6.23, 6.32, Corollary 10.2), guralnick-1982, perlis-1977.
- **One lead:** desmit-perlis line 62 attributes `hR = h'R'` to its reference [3], Perlis 1978 (line 91). 7.5 cites perlis-1977, Theorem 1, which could not be checked.
- **Manifest and cache mismatch:** for huppert-1954, hall-1940 and fks, the manifest's cached file is the GDZ volume landing page. The article scans used above are separate cache entries (GDZ article PDFs, and Kantor's page for fks). This review edits no manifest.
- **Ownership:** checked against main, every open head through `roadmaps grep`, and the sibling checkouts given in the brief. Board-only packages without a head were not searched.

## Source issues

- **Misprint** in lemmermeyer at Proposition 1, printed p. 2 (line 79): the source writes the direct product of class groups with the second quadratic subfield's class group twice; it should be the product over `k₁`, `k₂`, `k₃`; affects nothing.
