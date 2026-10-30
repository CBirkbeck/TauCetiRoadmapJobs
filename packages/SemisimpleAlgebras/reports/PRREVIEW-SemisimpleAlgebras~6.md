# Review of SemisimpleAlgebras (pull request #989 at 0fbb5b6)
Folder: `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/`

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since 08635df. The only change is the deletion of the family-index Lean file, which repairs the previous P3. The push gate's text scanners and the dependency check pass, but the targeted build fails: the consumer `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` on main no longer elaborates against this head's acceptance file. That is one P1 finding; nothing else blocks.

## R01 (P1) — The targeted build fails: QuadraticFormInvariants consumes two names this head removed

**Location:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:1,21–53` (imports only Mathlib; declares exactly three theorems) against `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:5` (“import TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested”) and its 36 lines “open TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras in”.

**Claim:** The worker's gate reports `build=26 FAIL` at this head, and my independent rerun of `lake build TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested` reproduces it: 26 errors, all in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` (lines 528, 536, 554, 562, 585, 594, 739, 756, 773, 783, 825, 1288, 1291, 1588, 1589, 1603, 1613, 1735, 2264, 2303, 2325, 2349, 2666, 2674). They are of two kinds: no `Group`/`CommMonoid`/`OfNat 1`/`HMul`/`HPow` instance on `BrauerGroup K`, and “unknown identifier” for `IsSplittingField` (lines 1603, 1613), plus universe and instance problems stuck on the same `BrauerGroup` carrier.

**Witness:** On main, `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/Suggested.lean:182` declares `noncomputable instance brauerCommGroup : CommGroup (BrauerGroup (K := K)) := sorry` and line 187 defines `IsSplittingField (K A L : Type u) … : Prop`. QuadraticFormInvariants is unchanged in this pull request (its diff against origin/main is empty) and reaches both through the namespace it opens. This head keeps neither, so the consumer's file loses its Brauer-group structure and its splitting predicate. Mathlib's `Mathlib/Algebra/BrauerGroup/Defs.lean` at the pin provides only the quotient `BrauerGroup` (line 99) and no group instance. The shared package checkout was at the branch pin (Mathlib 6b7abb3c, Tau Ceti a91d3aa) with no checkout flip since 18:44 UTC, an hour before both builds, so this is not the pin race.

**Repair (tested):** Re-supply the two names from the pinned Tau Ceti, which the README already cites as the owners (§6.1 `TauCeti.BrauerGroup.instCommGroup`, `TauCeti/Algebra/BrauerGroup/Group.lean:174`; §6.2 `TauCeti.Algebra.IsSplittingField`, `TauCeti/Algebra/CentralSimple/Splitting.lean:120`). In `Suggested.lean` add after `import Mathlib` the two lines

    import TauCeti.Algebra.BrauerGroup.Group
    import TauCeti.Algebra.CentralSimple.Splitting

and, inside `namespace TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras`, the line

    export TauCeti.Algebra (IsSplittingField)

This adds no definition, no sorry'd data and no new statement: the import makes Tau Ceti's real `CommGroup (BrauerGroup.{u, u} K)` instance visible to every importer, and the export makes `TauCeti.Algebra.IsSplittingField` (same explicit arguments `K A L`, same body ∃ n, L ⊗[K] A ≃ₐ[L] Mₙ(L)) resolvable under the name the consumer uses. I tested it on a scratch copy of the consumer's whole file with those two imports and that export block prepended: `lake env lean` exits 0 with 0 errors and only the 152 expected `sorry` warnings, including the four later universe and stuck-instance errors, which were cascades of the missing instance. Then say so in the README: in “How to read the build” (line 180–181, “contains exactly the three headline theorems … with no auxiliary definitions”) and under “Downstream consumers” for QuadraticFormInvariants (line 822–824), state that the acceptance file imports the Brauer-group module and re-exports `TauCeti.Algebra.IsSplittingField` as `IsSplittingField` because that consumer reads both through this roadmap's namespace. The alternative, repointing QuadraticFormInvariants to Tau Ceti directly, is an edit outside this folder and would need its own revision merged first; it is not the repair for this pull request. I did not run the gate's text scanners on the repair (they need a worktree); the `export` line and `TauCeti.*` imports are within the Lean form rules as the brief states them.

## Previous findings

- R01 — repaired: the family-index `TauCetiRoadmap/RepresentationTheory/Suggested.lean` (20 lines, added in an earlier round, absent on main) is deleted in 0fbb5b6; the family's files now match origin/main exactly, so there is no docstring left to correct and the standalone gate reports `outside-folder=0`.

## Verified sound

**Scope and pins.** HEAD is 0fbb5b6d16f3db45a5feba2a008e91bec05f2a69. The folder diff since 08635df is empty (0 insertions, 0 deletions); README.md (844 lines) and Suggested.lean (53 lines) are byte-identical to the head r5 read. The only commit since, “RepresentationTheory: drop the empty family-index Lean file”, deletes `TauCetiRoadmap/RepresentationTheory/Suggested.lean`. The outside-folder diff excluding the family's direct files is empty; the family-direct diff is now empty as well. The branch manifest pins Tau Ceti a91d3aa and Mathlib 6b7abb3c (main's pins 358314d4 and f6090c70); the shared package checkout is at the branch pin and its reflog shows the last flip at 18:44:34 UTC, before the worker's gate (19:40) and my build (19:44). No file of the pull request was edited.

**Gate and elaboration.** My standalone gate run at this head reports every text and dependency counter zero and `OK` (it does not build). My targeted build fails exactly as the worker's: 26 errors, all in `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`, and the three expected `sorry` warnings for this roadmap's own module, which builds (its olean is written at 19:40). The elaborated signatures of the three headlines are unchanged from r5 (`skolemNoether`, `centralizer_isSimpleRing`, `centralizer_centralizer` at lines 30, 39, 47), with ambient centrality, simplicity and finite dimension and source or subalgebra simplicity all present; no binder dropped. The dependency check output is exactly

    depcheck: 204 roadmaps, 1392 edges, 0 problem(s)

with no UPWARD or CYCLE line.

**Consumer contract.** Opened `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` on main: it imports this module (line 5) and opens its namespace at 36 sites (lines 491–2670); its README cites this roadmap's Layers 4 and 6 (lines 472, 634, 3111), which this README's consumers section records (lines 822–824). Opened main's version of this roadmap's Suggested.lean: lines 182 (`brauerCommGroup`, a sorry'd instance) and 187 (`IsSplittingField`) are what the consumer uses; neither is in this head. Opened the pinned replacements: `TauCeti/Algebra/BrauerGroup/Group.lean:174` `instance instCommGroup : CommGroup (BrauerGroup.{u, u} K)` with a real body (multiplication by tensor product, identity the class of K, inverse by the opposite algebra), and `TauCeti/Algebra/CentralSimple/Splitting.lean:120` `def IsSplittingField (K A L : Type*) … : Prop := ∃ n, Nonempty (L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L)`, in `namespace TauCeti` then `namespace Algebra` (lines 106, 110). Both module oleans exist at the pin. The repair probe (the consumer's file with the two imports and the export block) elaborated with 0 errors.

**Headlines and padding.** Unchanged file, unchanged pins: the README's three headlines (§§5.1–5.3) are the three declarations; the one-tactic probes and native-alternative comparisons of the previous reports (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:98–110`, `Centralizer.lean:367–374,446–447`, which assume centrality of B) carry forward. No padding, no stand-in, no definition.

**Sources and seeded sample.** No locator changed. I re-opened the cached Stacks text (`stacks-brauer`, version ed88ff78) at every tag the fifteen sampled sections cite and confirmed tag, number and page against the README: 074E line 135 (Lemma 4.6, p. 4; §0.1/§1.3/§5.1 route), 074H 163 and 074I 166 (Lemmas 4.9, 4.10, p. 4; §4.1, §4.3), 074K 175 (Lemma 5.1, straddling pp. 4–5 as the README says at line 705; §6.1), 074L 198 and 074N 210 (Definition 5.2, Lemma 5.4, p. 5; §6.1, §2.4/§4.2), 074Q 215 (Theorem 6.1, p. 5 with proof on p. 6; §5.1), 074R 230 (Lemma 6.2; §4.4), 074T 235 and 074U 252 (Theorem 7.1, Lemma 7.2, p. 6; §5.2, §5.3, §4.4), 074Y 272, 0750 294, 0752 302 (Definition 8.1, Lemma 8.3, Proposition 8.5, p. 7; §6.2–§6.4). Page markers: p. 4 begins at cache line 133, p. 5 at 176, p. 6 at 218, p. 7 at 263. The hypothesis checks of the sampled statements (finite central simple ambient, simple source or subalgebra, no separability) are those of the previous reports and the text is unchanged. Sections without a Stacks locator in the sample (§0.2, §1.2, §2.1, §3.1, §3.2) cite pinned declarations only, verified in r4/r5 and unchanged.

**Ownership and citations.** Nothing new is constructed. The eight cross-roadmap references resolved in r5 are unchanged; the one that matters here, QuadraticFormInvariants, is re-resolved above on main. Ownership against open pull requests beyond the sibling checkouts was not re-searched, as no object changed.

**Adversarial table.** Rows 1–41 are carried forward individually from the previous report, which carried most of them from r4; every statement they cover is byte-identical at this head. Rows 42–44 are fresh.

[previous]: packages/SemisimpleAlgebras/reports/PRREVIEW-SemisimpleAlgebras~5.md

| # | Statement | Instances | Values computed | Result | Change / evidence |
|---|---|---|---|---|---|
| 1 | `skolemNoether`, f = g | any B, A | u = 1: 1·f(b)·1⁻¹ = f(b) | sound | Carried from [previous report, row 1][previous] |
| 2 | `skolemNoether`, B = K, A = M₂(K) | scalar maps | A as right A-module = two copies of the row module: dim 4, length 2 | sound | Carried from [previous report, row 2][previous] |
| 3 | `skolemNoether`, A = B = M₂(K), g = conjugation by P = E₁₂ + E₂₁ | E₁₁ | P E₁₁ P⁻¹ = E₂₂ = g(E₁₁), u = P | sound | Carried from [previous report, row 3][previous] |
| 4 | `skolemNoether`, ℂ ⊂ ℍ over ℝ, f inclusion, g conjugation | i | j i j⁻¹ = −i; Z(B) has dim 2 | sound without centrality of B | Carried from [previous report, row 4][previous] |
| 5 | Same with ambient A = ℂ | u ∈ ℂˣ | u i u⁻¹ = i ≠ −i | centrality of A needed and present | Carried from [previous report, row 5][previous] |
| 6 | Infinite-dimensional ambient A₁(ℚ) | f = id, g: x ↦ x + 1 | units are ℚˣ, u x u⁻¹ = x ≠ x + 1 | `FiniteDimensional K A` needed and present | Carried from [previous report, row 6][previous] |
| 7 | Injectivity of f | B simple, A nontrivial | ker f two-sided, f(1) = 1 ≠ 0, so ker f = ⊥ | finite dimension of B derivable | Carried from [previous report, row 7][previous] |
| 8 | Conjugation orientation | ℍ, u = 1 + i, b = j | u j u⁻¹ = k; Stacks' f = x g x⁻¹ is ours with u = x⁻¹ | consistent with Lean line 34 | Carried from [previous report, row 8][previous] |
| 9 | Opposite convention | ℍ, right multiplications | (rᵢ ∘ rⱼ)(1) = j i = −k; r_{ij}(1) = k | End_ℍ(ℍ) = ℍᵒᵖ | Carried from [previous report, row 9][previous] |
| 10 | Centralizer headlines, B = K ⊂ M₂(K) | | C = M₂(K) simple; 1·4 = 4; C(C) = K | sound | Carried from [previous report, row 10][previous] |
| 11 | B = M₂(K) ⊂ M₂(K) | | C = K; 4·1 = 4; C(C) = M₂(K) | sound | Carried from [previous report, row 11][previous] |
| 12 | B = ℂ ⊂ ℍ over ℝ | | C = ℂ, Z(C) dim 2; 2·2 = 4; C(C) = ℂ; ℂ ⊗ ℂ → ℍ has image of dim 2 ≠ 4 | headlines hold; factorization needs B central | Carried from [previous report, row 12][previous] |
| 13 | B = diagonal K × K ⊂ M₂(K) | not simple | C = K × K not simple; C(C) = K × K | simplicity of B needed | Carried from [previous report, row 13][previous] |
| 14 | B = upper triangular ⊂ M₂(K) | dim 3 | C = K; 3·1 = 3 ≠ 4; C(C) = M₂(K) ≠ B | simplicity of B needed | Carried from [previous report, row 14][previous] |
| 15 | B = K(s), s² = t, K = 𝔽₂(t) ⊂ M₂(K) | inseparable | C = L, basis (1, s); 2·2 = 4; C(C) = L | no separability needed | Carried from [previous report, row 15][previous] |
| 16 | B = M₂(K) ⊗ 1 ⊂ M₄(K), char 2, 3 | | C = 1 ⊗ M₂(K); 4·4 = 16; C(C) = B | sound | Carried from [previous report, row 16][previous] |
| 17 | A = K, B = K | degenerate | C = K; 1·1 = 1; C(C) = K | sound | Carried from [previous report, row 17][previous] |
| 18 | A = ℂ over ℝ, B = ℝ | | C = ℂ; 1·2 = 2; C(C) = ℂ ≠ ℝ | centrality of A needed | Carried from [previous report, row 18][previous] |
| 19 | Zero algebra | | not `IsSimpleRing` | excluded | Carried from [previous report, row 19][previous] |
| 20 | §5.3 cancellation | | dim Cₐ(B) ≥ 1; B ≤ C(C); equal finrank ⇒ equal | route sound | Carried from [previous report, row 20][previous] |
| 21 | §5.2 route | R = B ⊗ Aᵒᵖ, M = A | R simple, Artinian; End_R M simple; transport | route sound | Carried from [previous report, row 21][previous] |
| 22 | Positivity of blocks | K vs K × M₀(K) | counts 1 vs 2; `NeZero (d i)` excludes the second | sound | Carried from [previous report, row 22][previous] |
| 23 | Jacobson Checks | K, K × K, K[ε]/(ε²), T₂(K) | radicals 0, 0, (ε), strictly upper; quotients K, K × K | sound | Carried from [previous report, row 23][previous] |
| 24 | §4.3 map | ℍ, i ⊗ iᵒᵖ | 1 ↦ −1, j ↦ j; conjugation fixes 1 | convention is the pinned `tensorOpAlgEquivEnd` | Carried from [previous report, row 24][previous] |
| 25 | Degrees, tensor, index | K, M₂(K), ℍ, M₂(ℍ), ℍ ⊗ ℍ | dims 1, 4, 4, 16; (deg, index) = (1,1), (2,1), (2,2), (4,2) | sound | Carried from [previous report, row 25][previous] |
| 26 | Brauer laws and representatives | Br(ℝ) | [ℍ]² = 1; [ℍᵒᵖ] = [ℍ]; rep of [M₂(ℍ)] is ℍ | sound | Carried from [previous report, row 26][previous] |
| 27 | Dimension sums and Schur controls | M₂(k) on k²; k(t); ℂ/ℝ; k[S₃]; 𝔽₂[C₂] | 1 vs 4; infinite; dim 2; 1 + 1 + 4 = 6; (g − 1)² = 0 | hypotheses necessary | Carried from [previous report, row 27][previous] |
| 28 | §3.1 non-simple semisimple modules | R = K, M = K² | End = M₂(K) dim 4; commutant K dim 1 | bijective | Carried from [previous report, row 28][previous] |
| 29 | §3.1 nontriviality and faithfulness | M = 0; M = K under K × K | kernels K and 0 × K | excluded by hypotheses | Carried from [previous report, row 29][previous] |
| 30 | §6.2 embedded field of prescribed degree | D = K; D = ℍ, L = ℂ; L = ℝ | degrees 1, 2; ℝ ⊗ ℍ = ℍ not split | sound | Carried from [previous report, row 30][previous] |
| 31 | §6.2 degree implies maximality | ℂ ⊂ ℍ; ℝ ⊂ ℍ | dim bounds force E = ℂ; ℝ properly contained | sound | Carried from [previous report, row 31][previous] |
| 32 | §2.1 presentation structure | zero ring, K, K × K | block counts 0, 1, 2; degrees (), (1), (1,1) | sound | Carried from [previous report, row 32][previous] |
| 33 | §2.2 matrix-block enumeration | K × K; M₂(K) | classes 2 = 2 and 1 = 1 | sound | Carried from [previous report, row 33][previous] |
| 34 | §2.2 finite simple-factor enumeration | M₂(K) × K | 2 classes = 2 factors | sound | Carried from [previous report, row 34][previous] |
| 35 | §2.2 empty-family Check | zero ring | 0 simple modules, 0 indices | sound | Carried from [previous report, row 35][previous] |
| 36 | §2.3 division-ring block count | M₂(K) × K vs K × M₂(K); zero ring | 2 = 2; 0 = 0 | sound | Carried from [previous report, row 36][previous] |
| 37 | §2.3 general simple-factor count | M₂(K) vs M₁(M₂(K)) | counts 1 = 1; sizes 2 ≠ 1 | division-ring hypothesis retained | Carried from [previous report, row 37][previous] |
| 38 | §2.3 factor equivalences | transposition | f(X,0) = (0,X); identity permutation fails | sound | Carried from [previous report, row 38][previous] |
| 39 | §2.3 empty matching | two empty products | 1 bijection, 0 equations | sound | Carried from [previous report, row 39][previous] |
| 40 | §2.3 full uniqueness | M₂(K) × K vs K × M₂(K) | sizes 2 = 2, 1 = 1; identity would need 2 = 1 | sound | Carried from [previous report, row 40][previous] |
| 41 | §2.3 positivity and coefficient controls | K vs K × M₀(D); M₂(K) vs M₁(M₂(K)) | 1 ≠ 2; 2 ≠ 1 | hypotheses present | Carried from [previous report, row 41][previous] |
| 42 | Consumer build at this head (R01) | QuadraticFormInvariants/Suggested.lean, unchanged from main | errors: 26 (worker) = 26 (my rerun); names it needs from this namespace: 2 (`IsSplittingField`, Brauer `CommGroup`); supplied at this head: 0; supplied on main: 2 (lines 182, 187) | fails | Fresh; P1 R01 |
| 43 | Repair probe for R01 | consumer file + 2 Tau Ceti imports + 1 export | errors 0; `sorry` warnings 152; universe of the instance `BrauerGroup.{u, u} K` unifies at every consumer site (0 stuck constraints) | elaborates | Fresh; scratch probe |
| 44 | Family-index deletion (previous R01) | `TauCetiRoadmap/RepresentationTheory/` | files differing from main: 0; declarations formerly claimed (Brauer): 1 claimed vs 0 present, now 0 claimed | repaired | Fresh |

## Not verifiable

- None of the changed material needs a source. The full source audit of the thirteen unchanged sampled sections beyond the tag and page spot-check above is carried forward from the previous reports, not represented as repeated.

## Source issues

- **Misprint** in stacks-brauer at Proposition 8.5 (tag 0752), printed p. 7, stacks-brauer line 304: the source says the final consequence using a spelling of splitting that omits its l; it should be splitting field; affects nothing.

The source issue is carried forward from the previous report; no new source mistake was found.
