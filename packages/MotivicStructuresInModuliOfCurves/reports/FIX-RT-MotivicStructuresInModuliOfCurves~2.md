# FIX-RT-MotivicStructuresInModuliOfCurves~2

Repair of red-team round 2 (passes a and b) on `packages/MotivicStructuresInModuliOfCurves`. Fourteen findings: twelve applied (two of them merged into one section each, one applied differently), one disputed. Files changed: `README.md`, `sources.toml` (one new key), `design/plan.json` (the `needs` sentence of the existing gap `equivariant-grr` only). `Suggested.lean` and `metadata.toml` are unchanged.

## RT-MotivicStructuresInModuliOfCurves~2a/F01, RT-MotivicStructuresInModuliOfCurves~2a/F05, RT-MotivicStructuresInModuliOfCurves~2b/F05 (P2) — applied

Verified: MappingClassGroupsAndCanonicalRepresentations §2.3 (head of its open pull request) proves contractibility, the proper action and `M_{g,n}^an = [T(g,n)/PMod(g,n)]`, and no cohomology statement.

- §3.4 route: "by §2.3 of MappingClassGroupsAndCanonicalRepresentations" → "by the comparison of §2.1".
- §2.1: the stack's Betti cohomology is now defined as sheaf cohomology of `ℚ` (gap:dm-stack-mixed-hodge), with a route through the Čech nerve `T × Γ^•` of the `Γ`-torsor atlas and cohomological descent to the Borel construction; *Needs* gains gap:dm-stack-mixed-hodge; first Check gains the nerve of `ℍ → [ℍ/SL₂(ℤ)]`.
- §2.3 *Needs*: + WeilConjectures, WC.1 (stack Artin comparison).
- Layer 2 Dependencies: + WC.1.

Same pattern elsewhere: no other place attributes a cohomology comparison to the supplier.

## RT-MotivicStructuresInModuliOfCurves~2a/F02 (P2) — applied

Verified. Canning–Larson genus seven, Remark 2.3 (`canning-larson-genus-seven` lines 257–268) calls the space of covers of a fixed line a "scheme". A bielliptic genus-seven curve has gonality four: Castelnuovo–Severi gives `g ≤ 3` for a second degree-two map and `g ≤ 4` for a degree-three map. Its involution over the elliptic curve is a deck transformation over `ℙ¹`.

- §6.3: new framed presentation `X_{g,n}` (covers of the fixed line with a basis of `H⁰(E)`, `h⁰(E) = g + 6`, `G = SL₂ × GL_{g+6}`), with a route (frame bundle over the smooth stack of covers; Hilbert scheme of `ℙ¹ × ℙ^{g+5}`, SchemeAndStackFoundations §4.14 on main). Also a new API bullet and the bielliptic Check.
- The gap clause (README line 71), §6.5 *Needs*, the plan.json `needs` sentence and Layer 6 Dependencies now name the framed presentation.
- New Corrections entry for Remark 2.3.

## RT-MotivicStructuresInModuliOfCurves~2a/F03 (P2) — applied

Verified:
- Petersen, abelian surfaces, Theorem 2.1 (`petersen-abelian-surfaces` lines 145–178) holds for all `(a, b)`. §11.1 uses it at `a + b = 14`: degree-15 terms `H^{15−q}(A₂, A_q)` with `q ≤ 14`.
- Petersen, genus two, Theorem 3.8 (`petersen-genus-two` line 407) concerns `M̄_{2,n}` and is used in §4.3.

Changes:
- Scope: the genus-two family now lists Theorem 2.1 with both uses (`a + b ≤ 12` in §3.6, `a + b ≤ 14` in §11.1) and Petersen genus two, Theorems 2.1 and 3.8 (§§4.3, 11.1).
- §11.1 *Needs*: + §3.6, PELModuli §M5.2. Added the weight-fourteen Check.
- §4.3 *Needs*: + §3.6, PELModuli §M5.2.
- Dependencies of Layers 4 and 11: + PELModuli §M5.2.
- §4.2 is not added to §11.1: its route goes through the compact type.

## RT-MotivicStructuresInModuliOfCurves~2a/F04 (P2) — applied

Verified against `canning-larson`:
- genus zero and one: §5.1, Theorem 5.1, §5.2;
- hyperelliptic loci: Theorem 6.1;
- plane curves: Lemmas 7.1–7.4, Corollary 7.5;
- trigonal: Lemmas 9.1–9.9, 9.11, 8.1;
- tetragonal: Lemmas 10.9–10.14.

Changes:
- §5.4: vague route → genus-by-genus route with these locators; adds hyperelliptic (`n ≤ 2g + 6`) and trigonal (`g ≥ 4`, `n ≤ g + 7`) clauses, *Needs* §§6.3, 6.5, EIT §3.3, CanonicalModelsAndGonality §§3.4, 9.1, two Checks.
- §6.2: route via §5.4's trigonal clause at `g = 7`.
- Scope: fifth owned family (Faber–Pandharipande, Faber classes).

Where this differs from the suggested repair:
- Theorem 6.2 and Lemma 6.3 concern partial compactifications and are not cited.
- §8.1 is replaced by EquivariantIntersectionTheory §3.3, which suffices in characteristic zero and avoids a Layer-8 edge.

## RT-MotivicStructuresInModuliOfCurves~2a/F06 (P3) — disputed

The witness confuses two cycles.
- Graber–Pandharipande's class is `[Z]`, the closure of the bielliptic genus-two curves with ten conjugate pairs of markings. The paper states that `Z` has codimension 11 in `M̄_{2,20}` (`graber-pandharipande` line 97, arXiv:math/0104057v2) and that `[Z] ∉ RH^*` (Theorem 2, line 101).
- Dimension count: `2 + 10 = 12`, so the codimension is `23 − 12 = 11` and the degree is 22, as CLP line 114 and the README print.
- `Z` meets the divisor `M̄_{1,11} × M̄_{1,11}` (dimension 22) in the diagonal, of codimension 11 there.
- The reviewer's degree 24 belongs to the pushforward of that diagonal, which is a different class. The README's "`11 + 11 + 2 = 24`" (§12.10) concerns that pushforward.

Not applied. To pin the degree, the §4.3 Check now carries this dimension count and the GP locator. `graber-pandharipande` is recorded in `sources.toml` (certified) and in References.

## RT-MotivicStructuresInModuliOfCurves~2a/F07, RT-MotivicStructuresInModuliOfCurves~2b/F07 (P3) — applied

Merged.
- Conventions, **Point counts**: defines an `S_n`-equivariant polynomial count as polynomials `P_σ` giving the twisted masses at every prime power. Coefficients are rational class functions, written by Frobenius characteristic; integrality is not required, consistent with §1.5's second Check. This is pass a's reading, which equals pass b's over `ℚ`.
- Witnesses: `M̄_{0,4}` gives `s_{(4)}T + s_{(4)}`; `M_{0,4}` gives `s_{(4)}T − s_{(2,2)}`.

## RT-MotivicStructuresInModuliOfCurves~2b/F01 (P2) — applied

Verified. CLP line 315 deduces Corollary 2.7 by applying Lemma 2.1 to `RH^*`. Hypothesis (2.2) fails at `(1, 11, 11)`:
- in the printed form at `(2, 20, 14)`: `11 ≤ 12` and `11 ≤ 32`;
- in the corrected form of §4.5 already at `(2, 12, 12)`.

Changes to §4.3:
- Route: Petersen for `n < 20`; for `n ≥ 20`, §4.2 plus a parity lift by §0.4. Odd Künneth pairs would need degree `≥ 22 > 18`.
- *Needs*: drops §4.5, adds §0.1.
- New Check at `(2, 20)` with `r = 6`.

Corrections section:
- new entry for CLP before Corollary 2.7;
- the Lemma 2.1 entry no longer says "its other applications remain valid".

§§10.2 and 10.6 also apply §4.5 to `RH^*`. Their odd triples have `k′ ≤ 5`, where `W_{k′}H^{k′} = 0`, so they are unaffected.

## RT-MotivicStructuresInModuliOfCurves~2b/F02 (P2) — applied

Verified: DeligneWeightsAndPurity §8.24 (head of #929) begins "Let `X₀` be a smooth proper scheme … over `𝔽_q`".
- Conventions, **Cohomology**: the `G_ℚ`-realization weight filtration is defined by the `j_!` boundary resolution (§10.7); `E₂`-degeneration comes via WC.1's stack Artin comparison with gap:dm-stack-mixed-hodge, and purity via smooth proper transport to §8.24 mod `p`. Witnesses added.
- Scope line 17, the WC.1 and DWP contracts, §§0.4, 1.2, 9.7, 10.7 (text and *Needs*) and the Dependencies of Layers 0, 10 are adjusted to say "over finite fields" plus WC.1.

## RT-MotivicStructuresInModuliOfCurves~2b/F03 (P3) — applied

Verified against `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` on main:
- Layers 0–3: partitions, `M^λ`/tabloids, symmetrizers, Specht modules (consumed from Tau Ceti);
- Layer 5: hook-length dimensions;
- Layer 7: symmetric functions and Pieri.

Changes: the Scope line, the contract, *Needs* of §§3.1, 3.2, 4.2, 4.7, 11.8 and the Dependencies of Layers 3, 4, 11 now cite the right layers. §4.2's "§9.7" is qualified as SchurWeyl §9.7. Citations of Layer 7 for Frobenius characteristics (§§1.2, 1.3, 9.1) and of Layer 9 are kept.

## RT-MotivicStructuresInModuliOfCurves~2b/F04 (P3) — applied

Verified: WeilConjectures §1.8 (head of #1208) includes the descent of the crystalline and de Rham comparison to smooth proper DM stacks over a `p`-adic trait, as input to the polynomial-count theorem over `Spec ℤ`.
- WC contract and §9.7: "need local `p`-adic inputs that no supplier states" → "rest on the `p`-adic comparison of WC.1, which this roadmap does not consume".
- §9.9's wording makes no supplier claim and is unchanged.
- PadicHodgeTheory is not named, to avoid an unconsumed edge.

## RT-MotivicStructuresInModuliOfCurves~2b/F06 (P3) — applied differently

The finding is right: products of two members on one vertex are missing. The suggested replacement still asserts a decorated-graph normal form. For a general family that form is not established: by the excess-intersection formula, a product of two graph pushforwards brings in clutching pullbacks of members, and an STE need not be closed under those (§4.4). The bullet now says:
- generated classes come from finitely many operations;
- for motivic families, degree `k` is spanned by images of `L^j ⊗ G₁ ⊗ ⋯ ⊗ G_r` with `Σk_i + 2j = k`;
- the graph normal form holds for `S_ω` (§4.8).

Pattern: §4.11's route, the only consumer, now uses this. The `f_A^*ω · f_B^*ω` Check was added.

## Checks run

- **Elaboration.** `lake env lean packages/MotivicStructuresInModuliOfCurves/Suggested.lean` from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, the module docstring, an empty namespace.
- **`#check` comparison.** `Suggested.lean` declares nothing, so there is no `#check @name` to compare. The worker's signature lead `and` is a word of the docstring.
- **Dependency check:**

```text
depcheck: 244 roadmaps, 2282 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- **Citation resolver:** "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1 descent | `M_{1,1}`; `T = pt`, `Γ = C₂`; trivial `Γ` | nerve `ℍ × SL₂(ℤ)^•` realizes `ℍ ×_Γ EΓ`; `H¹ = Hom(SL₂(ℤ), ℚ) = 0` (abelianization `ℤ/12`), `H^{≥2} = 0` (vcd 1); `BC₂`: `ℚ` in degree 0 `= H^*(C₂, ℚ)`; `pt`: `ℚ` | holds | Check extended |
| Conventions, `G_ℚ` weights | `M_{0,4}`; `𝔸¹ ⊂ ℙ¹`; empty boundary; `M_{1,11}` | `C⁰_0 = ℚ → C¹_0 = ℚ³` diagonal, `Gr^W_0H_c¹ = ℚ²`; `Gr^W_0H_c⁰(𝔸¹) = 0`, `W₀H⁰(𝔸¹) = ℚ`; empty boundary gives `W_kH^k = H^k`; `W₁₁H¹¹ = S₁₂`, rank 2 | holds | added |
| Point counts, `S_n` | `M̄_{0,4}`; `M_{0,4}` by class; `n = 0` | `T + 1` for all `σ`; `χ_{(2,2)}` = `2, 0, 2, −1, 0` on id, (12), (12)(34), (123), (1234), giving `T − 2, T, T − 2, T + 1, T`; `n = 0` is the plain count | holds | added |
| §4.3 parity lift | `r = 6, 10`; `n = 20, 21` | odd pair needs `i + j ≥ 22 > 2r − 2 ≤ 18`; `r = 10`: `(i, j) = (11, 7)` has `H⁷ = 0`; genus-two factor `b ≤ n − 1` | closes | route replaced |
| §4.5 call of `(1, 11, 11)` | `(2, 20, 12)`, `(2, 12, 12)`, `(2, 8, 12)` | `11 ≤ 34`, `11 ≤ 12`; `24 − 12 = 12 ≥ 5`; `n = 8 < 9`, not called | condition `n ≥ 9, r ≥ 6, 2n − 2r ≥ 5` exact | Check added |
| CLP Cor. 2.7, printed (2.2) | `(2, 20, 14)` | `11 ≤ 12`, `11 ≤ 46 − 14 = 32` | fails | Correction added |
| GP class | `Z ⊂ M̄_{2,20}` | `dim Z = 2 + 10 = 12`, codim `11`, degree `22`; diagonal of `M̄_{1,11}²` codim `11` in a 22-dimensional divisor; its pushforward codim `12`, degree `24` | README right | Check pinned |
| §4.4 API | `f_A^*ω · f_B^*ω`, `M̄_{1,22}`; `ξ_*(ω ⊗ 1)` into `M̄_{1,13}`; empty family; `k = 0` | `11 + 11 = 22`, `r = 2, j = 0`; `11 + 2 = 13`, `j = 1`; `r = 0` gives `L^j`; `ℚ` | holds | bullet replaced |
| §4.11 route | `k = 13` | seeds of positive degree, `r ≤ 13`, finitely many products | finite | route replaced |
| §5.4 bounds | `g = 2,…,7` | `2g + 6 = 10`; `3d − 1 = 11`; `g + 7 = 11`; `17 − 2g = 7, 5`; trigonal at `g = 7`: `14`; hyperelliptic `12, 14 ≥ 11`; plane quintics `14 ≥ 5` | match `c(g)` and §6.2 | Checks added |
| §6.3 framed `h⁰(E)` | `g = 7`; `g = 2`; types `(3,3,4)`, `(2,4,4)`, `(2,3,5)` | `10 + 3 = 13`; `5 + 3 = 8 = g + 6`; all summands `≥ 1` | holds | added |
| §6.3 bielliptic | `g = 7` | C–S: `2 + 0 + 1 = 3`, `2 + 0 + 2 = 4`; `E^∨ = O(−2) ⊕ β_*L^{−1}`, `deg β_*L^{−1} = −10 + 2 = −8`; `ι = −1` on rank 2 | stabilizer `ι` unframed, none framed | Check added |
| §11.1, `a + b = 14` | degree 15, `q = 14` | `H¹(A₂, V)` dual to `H⁵_c`; `5 ∉ {2,3,4}`; degree 13: even `q ≤ 12` | vanishes | Check added |
| 2b/F04 wording | WC §1.8 | p-adic comparison stated | holds | text |

## Notes for the maintainer

- **Edges.** New supplier edge: SchemeAndStackFoundations §4.14 (on main). Other cited sections were already cited. New internal edge §5.4 → §§6.3, 6.5. It is acyclic, since §§6.3 and 6.5 need nothing from Layer 5; "How to read the build" and the Layer 5 Dependencies say so.
- **Ids.** No README id was renumbered or removed. `Suggested.lean` is unchanged, so no Lean name changed.
- **Ownership against open work.** Searched the board, main and the open heads through `roadmaps grep`:
  - Petersen's `A₂` computations: no owner. SiegelModularForms (open) mentions them but is not in the merge order.
  - Faber–Pandharipande Hurwitz loci: no match anywhere.
  - Framed degree-four Hurwitz presentation: InverseGaloisAndArithmeticFundamentalGroups owns Hurwitz stacks of `G`-Galois covers with branch data, a different object, so §6.3 stays the owner.
  - These are recorded as owned inputs in Scope.
- **Sources.** One key added: `graber-pandharipande` (arXiv:math/0104057v2, certified). No `needs-references.toml` was written.
- **Untrusted text.** Nothing suspicious was found in the reviews.
