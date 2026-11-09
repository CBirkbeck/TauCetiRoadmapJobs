# Review of QuadraticFormInvariants (pull request #1215 at 47ea955)

**Verdict:** needs changes

This is a full review of the folder at `47ea955`. The folder has not changed since `c00ad42` (0 changed lines). The mathematics checks out. Every statement in the sample and every headline passes the computed instances below. `Suggested.lean` elaborates with no warning. All 689 library names in the README resolve at the pin. The findings are all P3: one duplication of Tau Ceti, two citation-bookkeeping gaps, three pull-request-level items, and four locator and form items.

## R01 (P3) — Two aliases restate Tau Ceti theorems, and no Lean file consumes them

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 118–123 (`hilbertSymbol_productFormula`) and 129–137 (`hilbertSymbol_eq_cohomological`). README 27–29 gives the reason: "`hilbertSymbol_productFormula` (`IntegralLattices`, `QuaternionArithmetic`) and `hilbertSymbol_eq_cohomological` (`QuaternionArithmetic`)".

**Claim.** Both theorems are Tau Ceti's theorems under a second name. The rule is that what exists at the pin is cited, not restated. The nine other aliases were dropped with old → new lines on exactly this ground: their citations were prose only. These two are cited in prose only as well:
- on main: `TauCetiRoadmap/IntegralLattices/README.md` 898, 1027, 2229 and `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` 227, 601;
- at its head: QuaternionArithmetic README 231–232.

QuaternionArithmetic's `Suggested.lean` uses `TauCeti.hilbertSymbol` directly.

**Witness.** In a scratch copy of the file, `example : @hilbertSymbol_productFormula = @TauCeti.hilbertSymbol_productFormula := rfl` elaborates, and so does the same probe for `hilbertSymbol_eq_cohomological`. On main, the only file that imports this module is `Completed/OrthogonalSpinGroups/Suggested.lean` (line 4), and it uses neither name.

**Repair.**
- Delete both theorems, and the imports they alone need: `TauCeti.FieldTheory.GaloisCohomology.MuTwo.LocalSymbol` (line 5) and `TauCeti.NumberTheory.QuadraticForm.Global.ProductFormula` (line 13).
- Add two old → new lines: `hilbertSymbol_productFormula → TauCeti.hilbertSymbol_productFormula` and `hilbertSymbol_eq_cohomological → TauCeti.hilbertSymbol_eq_cohomological`.
- Replace the bare backticked names at README 28–29, 57–59, 94, 1615, 1721, 2660 and 2667, and in the module docstring (27–30), with the Tau Ceti names.

The `rfl` probe shows that nothing is lost.

## R02 (P3) — The old → new list misses `serreEps` and `serreOmega`, which a roadmap on main cites

**Location.** README 32–33: "Every other name that a roadmap cites from this namespace is a Tau Ceti declaration … One line per cited name or section, old → new". The list at 35–63 has no line for either name.

**Claim.** The list is complete for the names that roadmaps on main cite from this namespace.

**Witness.** Main's `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` declares `serreEps` and `serreOmega`. Main's `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` line 227 cites "the closed formula over `ℚ_2` with serreEps and serreOmega (item 10)" as this roadmap's. This head declares neither name.

**Repair.** Add `serreEps → TauCeti.serreEps` and `serreOmega → TauCeti.serreOmega`. Both resolve at the pin, and item 10 (README 1586) already names them.

## R03 (P3) — Four open pull requests change this folder and conflict with this head; no order is stated

**Location.** The pull-request description, which mentions only ClassFieldTheory. The overlap report lists #617, #1187, #1411 and #1797 as conflicting with this pull request in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

**Witness.** Read with `roadmaps show QuadraticFormInvariants --pr N`, each head differs from this one (changed lines, README / Lean):
- #617: 338 / 281;
- #1411: 354 / 260;
- #1797: 231 / 113. It still declares `discr`, `wittRing` and `toWittRing`.

In addition, #1411's `IntegralLattices/Suggested.lean` (748–753) uses `QuadraticFormInvariants.hilbertSign`, which this head drops.

**Repair.** Add a paragraph to the description that states the order. For example:
- this pull request merges first;
- #617, #1411 and #1797 drop their edits to this folder, or rebase onto this head and take its two files;
- #1411's IntegralLattices file switches to `TauCeti.hilbertSign` and `TauCeti.hilbertSymbol_productFormula`;
- #1187 rebases and re-elaborates this `Suggested.lean` at its new pin.

The README does not change.

## R04 (P3) — An edit outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD` lists `Completed/LocalGaloisGroups/Suggested.lean` (62 insertions, 50 deletions). The brief names only ClassFieldTheory, GlobalQuadraticForms and QuadraticFormInvariants as this pull request's folders.

**Witness.** The file imports `TauCetiRoadmap.ClassFieldTheory.Suggested` (line 12). The edit rewrites `ClassFieldTheory.artinMap`, `muNRep` and others to `TauCeti.ClassFieldTheory.*`. That is a consumer repair forced by the ClassFieldTheory rewrite, in an unnamed folder.

**Repair.** Name `Completed/LocalGaloisGroups` in the description as a consumer repair required by the ClassFieldTheory change, so that it is reviewed as this pull request's own. Alternatively, move it into a companion pull request that merges with this one. This folder does not change.

## R05 (P3) — Four cited works are not in the manifest

**Location.** README References:
- 2680, Lam (2005), "PRIMARY";
- 2697–2698, O'Meara (1955);
- 2714, Gille–Szamuely (2017);
- 2725, Grove (2002).

**Witness.** `packages/QuadraticFormInvariants/sources.toml` has 11 `[[source]]` tables (`kahn1984` … `ekm2008`). A case-insensitive search for `lam`, `gille`, `grove` or `1955` finds nothing. Yet Lam carries most locators of Layers 0–5 and 9.

**Repair.** Record the four works as `uncertified` entries, as `omeara1963` already is:
- `locator_scheme = "theorem"` for Lam and for Gille–Szamuely;
- `"section"` for Grove;
- `"page"` for O'Meara (1955).

No text needs to be fetched. The sources service found no legal copy of Lam or of Gille–Szamuely (see Not verifiable).

## R06 (P3) — Several sampled milestones carry no source locator

**Location.** Each of these paragraphs cites only Tau Ceti declarations:
- README 1101, "Quaternion algebras are central simple";
- 1231, "Base change and the remaining API";
- 1485–1518, "The classical construction";
- 1689, "Milestone 1";
- 1704, "Milestone 2";
- 1726, "Compatibility with the cup product".

**Claim.** Every theorem has a locator into a source.

**Witness.** For example, 1101–1109 names `TauCeti.QuaternionAlgebra.instIsCentral`, `instIsSimpleRing`, `isSimpleRing_of_j_sq_mul_discr_ne_zero` and `completeSquareEquiv`, and no text, theorem or page.

**Repair.** Add a locator at each claim.
- **Verified here:** for central simplicity, "(EKM §98.E, p. 389)". `ekm2008` line 20422–20425 states that the quaternion algebra (L/F, b) is central simple of dimension 4, for L a quadratic field extension; that is the nonsquare-`a` case. The split case is Layer 2's `≃ M₂(K)`.
- **Classical construction:** the index-two statement takes 6B's "O'Meara 63:11–13".
- **Milestones 1–2, the cup compatibility, and base change:** cite the theorem of the source used. The reference of record named at README 2717 is Gille–Szamuely, and the README already cites Serre *Local Fields* XIV §2 for 7C.

## R07 (P3) — The cup-norm locator in `Suggested.lean` disagrees with the README

**Location.** `Suggested.lean` 174: "(Serre, *Galois Cohomology* II.§1 and Gille–Szamuely 4.7)". README 2109 gives the same theorem as "(Serre, *Local Fields* XIV §2 Props. 4–5; Gille–Szamuely 4.7)".

**Witness.** The README References (2678–2726) list no *Galois Cohomology*, so the docstring cites a work the roadmap does not record.

**Repair.** Use the README's locator in the docstring: "(Serre, *Local Fields* XIV §2, Props. 4–5; Gille–Szamuely 4.7)".

## R08 (P3) — LocalFieldsRamification names are attributed to the wrong owner

**Location.** README 316–322: "… `normGroup` and `LocalFieldsRamification.map_norm_unitFiltration_zero` are Tau Ceti's declarations under that roadmap's names. Its … `mem_normGroup_iff_dvd_normalizedValuation` are that roadmap's prototypes". The 6A *Needs* at 1345 cites the first.

**Witness.** Neither name is what the README says:
- `Completed/LocalFieldsRamification/Suggested.lean` declares both as closed proofs (857, 870);
- they are proved from `TauCeti.map_normUnits_unitFiltration` and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`;
- `map_norm_unitFiltration_zero` occurs nowhere in the pinned Tau Ceti.

So the first name is not a Tau Ceti declaration, and the second is not a prototype.

**Repair.**
- In the contract, name Tau Ceti's `TauCeti.map_normUnits_unitFiltration` (at depth `0`) and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`, and say that the two LocalFieldsRamification names are closed wrappers of them.
- At 1345, cite `TauCeti.map_normUnits_unitFiltration`. 6A then uses Tau Ceti's own statement, as 321–322 promise.

## R09 (P3) — 7B item 5 names one cohomology transport for two statements that use different ones

**Location.** README 2057–2061: "the transport `RingEquiv.unitsH2Congr` of unit cohomology … `TauCeti.brauerExplicitH2Equiv_uliftEquiv` and `TauCeti.brauerCohomologyEquiv_uliftEquiv`".

**Witness.** At the pin:
- `brauerCohomologyEquiv_uliftEquiv` (`TauCeti/Algebra/CrossedProduct/BaseChange/ULift.lean:228`) is stated with `unitsContinuousH2Congr` (`TauCeti/FieldTheory/GaloisCohomology/Congr.lean:147`);
- only the explicit form (ULift.lean:205) uses `unitsH2Congr` (Congr.lean:91).

**Repair.** Write "the transports `RingEquiv.unitsH2Congr` of explicit classes and `RingEquiv.unitsContinuousH2Congr` of continuous classes".

## R10 (P3) — `Suggested.lean` sections are not in README layer order, and the docstring contradicts the file

**Location.**
- `Suggested.lean` 55: "## Layer 6C: the Hilbert symbol and the local Hasse invariant" holds `hasseInvariant_eq_localHasse`.
- 139: "## The headline theorems, discharged by Tau Ceti" holds Layers 2, 6D, 7C and 9.
- Docstring 18–21: "The statements here suggest Lean forms for particular milestones … Discharging all of them finishes neither a layer nor the roadmap."

**Witness.** README 6E (line 1697) places `hasseInvariant_eq_localHasse` in 6E. The Layer 2 statement follows the Layer 6C sections. Every statement is already discharged by Tau Ceti, as docstring lines 23–25 and 36–39 themselves say.

**Repair.**
- Use section comments `## Layer 2`, `## Layer 6C`, `## Layer 6D`, `## Layer 6E`, `## Layer 7C` and `## Layer 9`, in README order, with each declaration under its own layer.
- Replace docstring 18–21 with: README.md is the roadmap; this file states its headline theorems against the pinned APIs, each discharged by Tau Ceti, together with the names that consumers import.

## Verified sound

**Gate and dependency check.**
- I re-ran the gate. Every check is 0 except `outside-folder=4`, which lists `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/GlobalQuadraticForms/{README.md,Suggested.lean}`. Those are this pull request's own folders, so they are not findings. The worker's gate at this head passes.
- The gate does not flag `Completed/LocalGaloisGroups`. R04 rests on the brief's diffstat.
- Dependency check output: `depcheck: 240 roadmaps, 2332 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0 with no output at all: no `sorry`, no warning, no `set_option`.
- A scratch copy with `#check @` of all seven names (`hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`, `hilbertSymbol_productFormula`, `hilbertSymbol_eq_cohomological`, `RegularFormClass`, `formClass`) gives types equal to their README statements. Each instance binder occurs in its type, so no section binder is lost.
- The Lean generality equals the README's. Local instances are carried only where the README requires a local field.

**Library names (689 checked).**
- The README's 699 dotted identifiers were all `#check`ed at the pin (Tau Ceti `2fd255d9`, identical on head and main), with Mathlib and 243 Tau Ceti modules imported. 688 of the 689 non-roadmap names resolve. `Ideal.Quotient` is a namespace, not a constant, and is cited as one.
- The other 10 are roadmap names, and all are found on main:
  - in `ProfiniteCohomology/Suggested.lean`: `cup`, `f2Pairing` (5332), `inhomogeneousCochain2`, `homClass`, `cochainClass`, `galoisF2Iso`;
  - in `Completed/LocalFieldsRamification/Suggested.lean`: `square_eq_range_powMonoidHom` (720), `card_squareClasses_dyadic` (708), `mem_normGroup_iff_dvd_normalizedValuation` (870), `map_norm_unitFiltration_zero` (857).
- The ProfiniteCohomology names that README 343–348 calls Tau Ceti's exist at the pin, from `trivialF2` (`ContCohomology/TrivialF2.lean`) to `explicitCup11` (`Cup/Product.lean`).
- The 8 Tau Ceti files that contain `sorry` at the pin are in AdicSpace, EllipticCurve Frobenius, Huber rings, valuations and group presentations. None is cited here.

**Tau Ceti statements opened at the pin**, matched against the sampled README text:
- `QuaternionAlgebra.instIsCentral` and `instIsSimpleRing`;
- `isSimpleRing_of_j_sq_mul_discr_ne_zero` (the hypothesis is `c * discr a b ≠ 0`);
- `completeSquareEquiv` (target `ℍ[R, discr a b, 0, c]`);
- `BrauerGroup.quaternionClass_mul`, `_one_sub` and `_congr`;
- `RegularFormClass.hasseInvariant_add` and `hasseInvariant_mk_rankOne_mul` (exponents `rank.choose 2` and `rank − 1`);
- `omearaHasseSymbol_eq`;
- `eq_iff_discr_eq_and_hasseInvariant_eq` (hypotheses: equal rank and `rank ≤ 3`);
- `cliffordInvariant_eq_hasseInvariant_mul` (exponents `(rank−1).choose 2` and `(rank+1).choose 4`);
- `…_of_signedDiscr_eq_zero` (`m.choose 2`);
- `cliffordInvariant_add_of_signedDiscr_eq_zero` (one summand of even rank with `d± = 0`);
- `cliffordHomI2` (into `Additive (BrauerGroup K)`) and `cliffordHomI2_two_torsion`;
- the base-change and rank-≤1 lemmas;
- `hilbertSymbol_def`;
- `quadraticNormSubgroup_index_eq_two_of_not_isSquare` and `index_normGroup_of_isCyclic` (`K L : Type`);
- `quaternionSubgroupSignEquiv`, `quaternionSubgroup_eq_twoTorsion`, `invMap_…_eq_half_iff` and `h2MuEquivZMod_eq_one_iff_…` (all `K : Type`, as 6E says);
- `exists_rank_eq_discr_eq_localHasse_eq_iff` (exceptions `n = 1` and `n = 2 ∧ d = [−1]`);
- the rank-3 and rank-4 isotropy criteria;
- `galoisEvens2_kummerClass` and `…_of_trace_eq_zero`;
- `sw1/sw2Class_formClass_traceTransfer_smul_sq`;
- `brauerCohomologyEquiv_uliftEquiv`, `_baseChange`, `_crossedProductClass` and `_unique`;
- `brauer2EquivH2_cliffordInvariant`.

**Mathlib.** At `Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean:37,50`, `star = reverse ∘ involute` and `star (ι m) = −ι m`. So a unit vector of `pinGroup` has `Q v = −1`, as Layer 9 says.

**Cross-roadmap citations resolved.**
- ClassFieldTheory at this head:
  - Layer 5 (README 1007) and Layer 14 (1993);
  - `index_normGroup_of_isCyclic` is assigned to its Layer 5 (1576–1581);
  - its boundary text (205–214) states the same direction: ClassFieldTheory → QuadraticFormInvariants, with re-exports under this roadmap's names.
- ProfiniteCohomology Layers 0–4, 8–10, 12 and 13 on main (583–2163). Corestriction is in Layers 6 and 10.
- LocalFieldsRamification Layers 0–2 (Completed, 72–724).
- SemisimpleAlgebras Layers 4–6 (249–293).
- Section links `#layer-1-hyperbolic-planes-and-witt-theory` (SpinRepresentations) and `#6c-the-hilbert-symbol-and-the-local-hasse-invariant` (ClassicalArithmeticCompletion) match this head's headings.
- On main, `Completed/OrthogonalSpinGroups/Suggested.lean` 84–86 `#check`s `hilbertSymbol`, `localHasse` and `hasseInvariant_eq_localHasse`. All three are kept and elaborate.
- GlobalQuadraticForms at this head no longer imports this module. Its citations on main (`discr`, `wittRing`, `toWittRing`, `hilbertSymbol_unramified`, `exists_of_realization`, …) are on the old → new list.

**Ownership.**
- QuadraticFormInvariantsPartII owns exactly this roadmap's exclusions: characteristic 2, Pfister theory beyond `n ≤ 2`, the Milnor homomorphism and graded invariants.
- GeometryOfNumbersAndQuadraticArithmeticPartII consumes Layers 4, 6 and 9. It declares a gap on this roadmap, `quadratic-extension-witt-exactness`, which the intake announces. That is not a defect here.
- No object has two owners.

**Sources** (the seeded sample and the README's cached citations).
- `kahn1984` line 763–765 (printed p. 241): Lemme II.2.1 gives `𝒩((a)) = (Tr a, −d·N a) + (2,d)` if `Tr a ≠ 0`, and `(2,d)` if `Tr a = 0`. This is exactly README 2410–2412.
- `kahn1984` line 55–56 (p. 224): Théorème 2, `w(T(q)) = 𝒩(w(q))·w(T(1))^r`, for E/F finite separable and char ≠ 2. Its degree-≤2 part at r = 1 is README 2553–2557.
- `kahn1984` line 1044–1058 (p. 248): Prop. II.3.5, Théorème 2 for a quadratic extension at rank 1, with `w(T(1)) = 1 + (d) + (2,d)`. This matches the four-line computation at README 2573–2581.
- `serre1984cmh` line 560–562 (p. 668): Théorème 1′, `w₂(Q_{E,α}) = e*s′ + (2)(d_E)`, with the remark that `d_E`, not `d(Q_{E,α})`, enters. This is README 2504–2505.
- `serre1984cmh` line 582: the second proof exists, as README 2425 says.
- `kozlowski1984` line 34–41: Theorem 1.1, the transfer for 2-coverings commutes with the total Stiefel–Whitney class.
- `ekm2008` line 20422–20425 (§98.E, p. 389): used in R06.
- `ekm2008` lines 3434–3447 (§14, pp. 63–64): Lemma 14.2 and Theorem 14.3 give `e₂ : I² → Br₂` with `I³ ⊂ Ker`, which supports the `I²` homomorphism.

**Generated files.** `STATUS.md` still reports the 2026-10-28 audit as incomplete and links an anchor this README removes. The two items it calls open are now proved at the pin:
- `brauerCohomologyEquiv_uliftEquiv` (ULift.lean:228);
- `brauerCohomologyEquiv_baseChange` (`BaseChange/Naturality.lean:51`).

The file is regenerated after merge, so this is not a finding.

### Adversarial table

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Four-fold criterion (L2; `Suggested.lean` 149–155) | ℚ₂ at (2,5) and (5,5); `a = 1` | (2,5): Serre exponent `ε(1)ε(5)+1·ω(5) = 0+1` → `−1`, so all five fail. (5,5): `5 = 5² − 5·2² = 25−20`, so all five hold. `a=1`: `b = ((b+1)/2)² − ((b−1)/2)²`, and `ℍ[K,1,b] ≅ M₂` | holds | — |
| Local classification (6D; 162–172) | ⟨1,1⟩ vs ⟨−1,−1⟩ over ℚ₃ and over ℚ₂; rank 0 | `d = [1]` on both sides. ℚ₃: `s = 1` vs `(−1,−1)₃ = +1`, so isometric, with witness `1²+1² = 2 ≡ −1 mod 3`, which lifts. ℚ₂: `s = 1` vs `−1`, so not isometric. Rank 0: both sides true | holds | — |
| Cup-norm (7C; 177–181) | ℝ at (−1,−1); `a = 1`; K separably closed | ℝ: cup ≠ 0, and `x²+y² = −1` is unsolvable. `a = 1`: `(1) = 0`, and the right side is solvable. Separably closed: `H¹ = 0`, and `a` is a square | holds | R07 (locator) |
| Evens value (Kahn II.2.1; 188–199) | ℚ₂(i), `a = 1+2i`; ℂ/ℝ, `a = 1+i`; `a = √d` | ℚ₂(i): `Tr = 2`, `N = 5`, value `(2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0`, since `(2,5)₂ = −1` and `(2,−1)₂ = +1`. ℂ/ℝ: `(2)∪(2)+(2)∪(−1) = 0 = 𝒩(0)`, as `1+i` is a square in ℂ. `Tr √d = 0` gives `(2)∪(d)` | holds | — |
| Relative SW, degrees 1 and 2 (Kahn Thm 2; 205–214) | ℚ₂(i)/ℚ₂ with `a = 1+2i`; ℂ/ℝ with `a = −1` | ℚ₂(i): left side `w₂⟨2,−2/5⟩ = (2)∪(−2)+(2)∪(5) = (2)∪(5)`; right side `w₂⟨2,−2⟩ + (2)∪(5) + (−1)∪(5) = 0 + (2)∪(5) + 0`. Degree 1: `(−5)` on both sides. ℂ/ℝ: left `w₂⟨−2,2⟩ = 0`, right `0+0+0` | holds | — |
| `hasseInvariant_eq_localHasse` (6E; 90–106) | ℚ₂ with `![−1,−1]`, `![a]`, `![a,−a]` | `[(−1,−1)] = [D] ↦ −1 = localHasse`; rank 1: `1 ↦ 1`; `[(a,−a)] = 1 ↦ +1`. ε is forced: an injective map out of a group of order 2 | holds; ε is not free data | — |
| `hilbertSymbol_productFormula` (118–123) | ℚ with (−1,−1) and (2,5) | (−1,−1): `v=2: −1`, odd `p: +1`, `∞: −1`, product 1. (2,5): `v=2: −1`, `v=5: (2/5) = −1`, `∞: +1`, product 1. `∏ᶠ` is not junk, since the support is finite | holds; equal to Tau Ceti's by `rfl` | R01 |
| `hilbertSymbol_eq_cohomological` (129–137) | F = ℝ, ℂ, 𝔽₅ | ℝ: `H² ≅ ℤ/2`, `tr` is unique, and `(−1,−1) = −1 = sign 1`. ℂ and 𝔽₅: `H²(G,μ₂) = 0`, no `tr` exists, so the statement is vacuous there and true | holds; equal to Tau Ceti's by `rfl` | R01 |
| `localHasse` (71–73) | `n = 0, 1`; `![a,−a]`; ℚ₂ with `![−1,2]` | empty product, 1; `(a,−a) = +1`; `(−1,2)₂ = +1` (`2 = 1²+1²`), while O'Meara's `∏_{i≤j} = (−1)(+1)(+1) = −1 = s·(−2,−1)₂` | holds | — |
| Quaternion algebras central simple (L5) | `a = 1`; `ℍ[ℝ,−1,−1]`; `ℍ[K,a,b,c]` | `M₂(K)`; ℍ has center ℝ. `i′ = 2i − b` gives `i′² = 4(a+bi) − 4bi + b² = b²+4a`, which is `completeSquareEquiv` at the pin | holds | R06 |
| Quaternion symbol in `Br` (L5) | ℚ₂ bilinearity; `⟨2,−1⟩ ≅ ⟨1,−2⟩` | `[(2,5)]² = 1 = [(2,25)]`. `⟨2,−1⟩` represents 1 (`2−1`) and `d = −2`, so `[(2,−1)] = [(1,−2)] = 1`, matching `(2,−1)₂ = +1` (`−1 = 1−2·1`). The pairing with `B(2,−1)=1` and 0 elsewhere on ℚˣ/ℚˣ² is symmetric, bilinear and 2-torsion | the warning is correct | — |
| Hasse invariant formulas (L5) | `⟨a⟩⊥⟨b⟩`; ℝ, `λ = −1`, `q = ⟨1,1⟩` | `[(a,b)] = 1·1·[(a,b)]`. `s⟨−1,−1⟩ = [ℍ] = 1·(−1,−1)¹·(−1,1)¹`. At rank 0 the ℕ-subtraction junk exponent `0−1 = 0` is harmless | holds | — |
| Classification in dim ≤ 3 (L5) | binary forms in general; ℝ ⟨1,1⟩ vs ⟨−1,−1⟩; a dim-4 control | `⟨a,b⟩` represents `c` iff `(a,b) = (c,−ab)`, and this equals `(c,d)` when `d ≡ abc`. ℝ: `s = 1` vs `[ℍ]`. Dim 4: `⟨1⁴⟩` and `⟨(−1)⁴⟩` share `d` and `s` (`[ℍ]⁶ = 1`) but are not isometric, so `rank ≤ 3` is needed, and the pin has it | holds | — |
| Clifford invariant (Lam V.3.20) | `⟨a,b,c⟩`; `⟨a,b,c,d⟩`; `⟨1ⁿ⟩` over ℝ for n ≤ 8; `⟨−1,−1,−1⟩` over ℝ | n=3: `(−ab,−ac) = s·(−1,abc)·(−1,−1)`. n=4: `(a,b)(−abc,−abd) = s·(−1,d)·(−1,−1)`. ℝ: `1,1,ℍ,ℍ,ℍ,ℍ,1,1`, the parities of `C(n+1,4)` = `0,0,1,5,15,35,70,126`, matching `Cl_{n,0}`. On `I²`, `C(2m+1,4) ≡ C(m,2) mod 2` for m = 1..6: (0,0), (5,1), (35,3), (126,6), (330,10), (715,15) | holds | — |
| `I²` homomorphism (L5) | ℝ: `⟨1⁴⟩⊥⟨1³⟩`, `⟨1,1⟩⊥⟨1⟩`, `⟨1⁴⟩⊥⟨−1,−1⟩` | `c⟨1⁷⟩ = 1 = ℍ·ℍ`. `ℍ ≠ 1·1` when neither summand is in `I²`. `s = ℍ` with `C(7,4) = 35` odd gives `c = 1 = ℍ·ℍ` | holds | R06 |
| Base change and remaining API (L5) | `⟨1,−1⟩`; `⟨−1,−1⟩` from ℝ to ℂ | `s = (1,−1) = 1` and `c = [ℍ[K,1,−1]] = 1`. `[ℍ] ↦ [M₂(ℂ)] = 1 = s` over ℂ | holds | R06 |
| The symbol (6C) | ℚ₂ at (5,2) and (5,−1); `(a,−a)` | `2 = x²−5y²` is unsolvable (`v(2)` odd against Δ = 5), so `−1`. `−1 = 2²−5·1²`, so `+1`. `−a = 0²−a·1²`, so `+1`. `hilbertSymbol_def` is the `if ∃ x y` | holds | — (Conventions cite Serre CiA III.1.1) |
| Classical construction (6C) | ℚ₂ with `a = −1`; ℚ with `a = −1` | The norms from ℚ₂(i) are the classes `[1],[5],[2],[10]`, 4 of 8, so index 2; `−1` and `3` are non-norms. Over ℚ, `3`, `7` and `21` are all non-norms, so the indicator is not a homomorphism | holds | R06 |
| Milestone 1 (6E) | ℚ₂ | `Q(K) = {1,[ℍ]}`. `ε[(−1,−1)] = −1 = s(![−1,−1])`; `ε[(5,5)] = ε(1) = 1 = (5,5)` | holds | R06 |
| Milestone 2 (6E) | ℚ₂ at (2,5) and (5,−1) | `inv = 1/2` and `(2,5) = −1`; `inv[(5,−1)] = 0`; `Br(K)[2] ≅ ℤ/2 = Q(K)` | holds | R06 |
| Cup compatibility (6E) | ℚ₂ | `(2)∪(5) ≠ 0` with `(2,5) = −1`; `(5)∪(5) = 0` with `5 = 5²−5·2²` | holds | R06 |
| False Evens candidate (L9 warning) | ℚ₂, `d = −1`, `t = 2` | `(2)∪(5) + (−1)∪(−1) = 0` in ℤ/2, against the value `(2)∪(5) ≠ 0`. The difference `(−1)∪(−1)` lies in `(d)∪H¹`, the kernel of restriction | the warning is correct | — |
| ℚ₂ Gram matrix (6C.12) | basis {−1, 2, 5} | `(−1,−1) = −1`, `(2,5) = −1`, all others `+1`: rows `(1,0,0)`, `(0,0,1)`, `(0,1,0)` | holds | — |
| Unit defects over ℚ₂ (6B) | 1, 5, −1, 5/4, −5 | `δ = ⊤, 2, 1, 0, 1`, so `𝔡 = 0, 4ℤ₂, 2ℤ₂, ℤ₂, 2ℤ₂`; `2ℤ₂ ≠ 8ℤ₂` | holds | — |
| Index-4 remark (6B), K = ℚ₂(√2), d = 1 | `e = 2`, `q = 2` | `|𝒪ˣ/𝒪ˣ²| = 2qᵉ = 8`, and `U(4)𝒪ˣ²/𝒪ˣ²` has order 2, so index 4 | holds | — |
| Pin⁺ model (L9) | `e₁ = diag(1,−1)`, `e₂ = swap`, `t = (e₁−e₂)/√2` | `e₁e₂ = −e₂e₁`, `t² = 1`, `e₁t` is rotation by π/4 with `(e₁t)⁴ = −1`, and `t` lifts the swap under `v ↦ det·xvxᵀ` | holds | — |
| Realization and isotropy (6D) | ℚ₂ | `(1,[1],−1)` is impossible (empty product); `(2,[−1],−1)` is impossible (`(a,−a) = 1`); `(2,[1],−1)` is realized by `⟨−1,−1⟩`. `⟨1⁴⟩`: `d = [1]`, `s = 1 ≠ (−1,−1)₂`, so anisotropic | holds | — |
| Ramified-base control (6E examples) | ℚ₂(π) with `π² = 2`, `a = 5` | `(π+½)² − 5(½)² = 2+π−1 = 1+π`. Both families are `≡ 1 mod 2`, while `1+π ≡ 1+ε`. No native counterpart exists, as the README says | holds | — |

## Not verifiable

- **Lam (2005).** All Lam locators: I.2.3, I.3.4–3.5, I.4.1–4.9, I.5.1–5.2, I.7, II.1, II.3, III.2.2–2.11, III.4.2, V.3.4, V.3.16–3.21, pp. 119–120, VII §1. The sources service, tried with a scratch manifest, reported "no legal source found". The book is an AMS paywalled title and is not in the manifest (R05). The formulas these locators carry were checked by computation in the table.
- **Gille–Szamuely (2017).** Locators 1.1.9, 1.5.2, 4.4 and 4.7. The service found only the CUP landing page, "no legal source found".
- **Settled as uncertified, not re-requested.** O'Meara (1963) §63, Serre *A Course in Arithmetic*, Serre *Local Fields*, Scharlau and Milnor.
- **Not fetched.** Grove (2002) and O'Meara (1955). They are cited without theorem locators, for the exclusion note and for history.

## Source issues

- none
