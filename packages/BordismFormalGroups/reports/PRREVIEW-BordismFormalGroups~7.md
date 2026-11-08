# Review of BordismFormalGroups (pull request #1807 at 113b939)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4aa8b0b: `git diff --stat 4aa8b0b..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty, so the folder is byte-for-byte the one the previous review read. The commits since then touch only `TauCetiRoadmap/ClassifyingSpaces/` and `TauCetiRoadmap/TopologicalKTheory/`, both folders this pull request declares as its own, and the diff outside the fourteen declared folders is empty. The gate passes, the dependency check prints no UPWARD or CYCLE line, and `Suggested.lean` elaborates with only its two `sorry` warnings. None of the three P3 findings of the previous review is repaired, because nothing in the folder changed; each is re-verified at this head below and raised again.

## R01 (P3) — F6.2 still names DGFloer 1.2 as the owner of the Serre machinery, and cites a native predicate absent at the pin

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 816–819 ("Consume the native `TauCeti.TopCat.serreFibrations` and locally trivial bundle instances; DGFloer1.2 owns their homotopy LES and all-CW ordinary Serre spectral sequences, not a second Serre predicate").

Claim: the fibration homotopy long exact sequence and the ordinary Serre spectral sequences have one owner, and the named predicate exists at the pinned Tau Ceti.

Witness: the same README, lines 27–30, cites AlgebraicTopology Stage 5.5 for exactly these objects, and `TauCetiRoadmap/AlgebraicTopology/README.md` at this head (lines 102–108) says Stage 5.5 owns the fibration homotopy long exact sequence and both Serre spectral sequences. A recursive grep of the pinned Tau Ceti (358314d) for `serreFibrations`, `SerreFibration` and `serreFibration` returns no file, and the pinned Mathlib (f6090c7) has no `serreFibrations` either; `TauCeti/Topology/` at the pin has no module with a Serre-fibration predicate. The worker's citation scan lists the name as found nowhere.

Repair: replace the clause by "AlgebraicTopology Stage 5.5 owns their homotopy long exact sequence and the ordinary Serre spectral sequences on its Serre-fibration predicate; no second Serre predicate is built here", and describe the predicate in words rather than by a backticked name that no pin declares.

## R02 (P3) — Locator slips in the F2 paragraphs

Location: `TauCetiRoadmap/BordismFormalGroups/README.md` lines 223–225, 248–251 and 327.

Claim: each cited statement is where the locator says, in the setting the roadmap uses.

Witness and repair, one item each:

- Line 327, "Miller, Chapter 1, Theorems 12.1–12.2": miller-cobordism line 1226 is Theorem 12.1 (A acts freely through degree n on the Thom class of MO(n)) and line 1238 is Corollary 12.2 (freeness on the Thom class of MO). Write "Theorem 12.1 and Corollary 12.2".
- Lines 223–225 cite Kudo's theorem as the topological cochain instance of "Guillou–Weibel, Definition 6.1, Theorem 6.2 and Theorem 6.5". Theorem 6.2 is algebraic (guillou-weibel lines 752–759, a first-quadrant spectral sequence of graded-commutative H*-algebras), but Theorem 6.5 (lines 784–788) is stated for the Leray spectral sequence of a connected simplicial sheaf of groups under the Künneth hypothesis of Proposition 6.4 (lines 767–771). Say that the path–loop fibration of K(ℤ/p,n) is the instance over the point site with G = K(ℤ/p,n−1), and that the Künneth condition holds because H*(K(ℤ/p,n−1);𝔽_p) has finite type; or cite a topological source for Kudo's theorem directly (McCleary, *A User's Guide to Spectral Sequences*, Theorem 6.14, or May, *A general algebraic approach to Steenrod operations*, §3).
- Lines 248–251 identify the HF_p-nilpotent completion of a bounded-below spectrum with G3.9's derived p-completion and cite only Ravenel, Theorem 2.1.1(ii) (ravenel-green lines 2627–2635), whose part (ii) is the finite-type statement about π_*(X)⊗ℤ_p and says nothing about bounded-below spectra of infinite type. Add the locator for the identification, Bousfield, *The localization of spectra with respect to homology*, Topology 18 (1979), §6, Theorem 6.6 (the manifest key `bousfield-1979`, settled as uncertified), and list it under the references.

## R03 (P3) — The acceptance file's docstring does not name every headline that is not statable

Location: `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 17–24.

Claim: the module docstring names each headline theorem that is not statable at the pins and what it lacks.

Witness: the docstring names six non-statable headlines. The README's headlines with no entry are the Hopkins–Smith thick-subcategory classification and periodicity theorem (README lines 1290–1299), the Hopkins–Ravenel smashing theorem (lines 1460–1462), the chromatic fracture square and the K(n)-local completion formula (lines 1690–1700 and 1905–1911), the Lubin–Tate universal deformation theorem (lines 706–711), the Conner–Floyd and graded Eilenberg–MacLane comparison for MO (lines 408–421) and the torus Euler cancellation of F6.6 (lines 1968–1979). None is statable at the pins: no finite p-local spectra, Morava K-theories, Bousfield localizations, K(n)-local categories, deformation functors of formal groups over complete local rings, or MU-module families over BT exist in Mathlib f6090c7 or Tau Ceti 358314d.

Repair: add one clause per headline to the "Not statable at the pins" sentence, naming the missing carrier as the existing clauses do (for Lubin–Tate: "no deformations of formal groups over complete local rings and no universal deformation ring").

## Previous findings

- R01 — not repaired: README lines 816–819 still read "Consume the native `TauCeti.TopCat.serreFibrations` and locally trivial bundle instances; DGFloer1.2 owns their homotopy LES and all-CW ordinary Serre spectral sequences". Raised again as R01.
- R02 — not repaired: line 327 still reads "Miller, Chapter 1, Theorems 12.1–12.2"; lines 223–225 still cite "Guillou–Weibel, Definition 6.1, Theorem 6.2 and Theorem 6.5" with no instance stated; lines 248–251 still cite only "Ravenel, Theorem 2.1.1(ii)". Raised again as R02.
- R03 — not repaired: `Suggested.lean` lines 17–24 still name only Lazard's polynomial theorem, Quillen's theorem, Thom's computation, Landweber exactness, nilpotence and Tate vanishing. Raised again as R03.

## Verified sound

**The change.** `git diff --stat 4aa8b0b..HEAD -- TauCetiRoadmap/BordismFormalGroups` prints nothing; `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen declared folders prints nothing. The two commits since 4aa8b0b (`1745f502`, `113b9393`) change only `TauCetiRoadmap/ClassifyingSpaces/` and `TauCetiRoadmap/TopologicalKTheory/`, which have reviews of their own; this README cites neither of them for the passages the previous findings touch (it cites TopologicalKTheory only as a roadmap on main), so no passage here depends on those changes.

**Gate and dependency check.** The worker's gate at this head passes every rule (`gate.md`: all counters 0, `OK`). I re-ran the dependency check; its whole output is

```
depcheck: 230 roadmaps, 2174 edges, 0 problem(s)
```

**Elaboration.** `lake env lean` on `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` at this head: exit 0, two warnings `declaration uses 'sorry'` (lines 58 and 88), nothing else. The worker's signature file lists the six declarations with no dropped section binder: the height theorem carries `[Field k] [IsSepClosed k] [Fact p.Prime] [CharP k p] [F.IsComm] [G.IsComm]` and the exponent-two theorem `[F.IsComm]` with `formalNSeries F 2 = 0`, as the README states at lines 113–163. The file is unchanged since the previous review, so the one-tactic probes (both headlines survive `simp`, `rfl` and `exact?`) and the `#check @name` comparison of that review stand; I did not repeat them on an identical file.

**Seeded sample, re-read at this head.** Steenrod algebras and mod-p Adams towers (README lines 193–260): Hatcher Theorem 4L.12 (hatcher-at line 21777, the Sq^i axioms), Theorem 4L.13 (line 21864, Adem relations for squares), Theorem 4L.16 (line 22197, the P^i axioms and Adem relations), the unnumbered theorem on printed page 500 (lines 21565–21571, free commutative algebra on admissible monomials of excess below n, proof deferred to [SSAT] at line 21561); Guillou–Weibel Definition 6.1 (guillou-weibel lines 748–751), Theorem 6.2 (lines 752–759) and Kudo's Theorem 6.5 (lines 784–788, the three transgression laws with the signs the README states); Ravenel Theorem 2.1.1 (ravenel-green lines 2627–2635). Unoriented coefficients (README lines 319–353): Miller Theorem 12.1 (miller-cobordism line 1226), Corollary 12.2 (line 1238), Theorem 12.3 (line 1239, H*MO free over A), Theorem 12.4 (line 1261, v a weak equivalence), Section 13 (lines 1368–1373, N_* = 𝔽₂[x_n : n ≠ 2^i − 1]). The smoothing-and-triangulation comparison (README lines 1954–1957): GeometricTopology on main, `TauCetiRoadmap/GeometricTopology/README.md` line 930 (the section heading) and line 938 (item 1, "Smooth implies PL", Whitehead 1940 and Munkres), consumed for compact closed manifolds, where the triangulation is finite.

**Cross-roadmap citations resolved at this head.** AlgebraicTopology Stage 5.5 (`TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–108 at this head); GeometricTopology's smoothing-and-triangulation section on main (line 930). The remaining citations of the README (GeneralizedCohomology G2–G5, CharacteristicClasses C3, AlgebraicTopology Stages 8.8–8.10) were resolved by the previous review on the same text and are unchanged.

**Backticked names.** The gate's `readme-ids-missing` rule passes. The README on main already carries the backticked target names of F6.6 (`torusFiniteCellMappingEulerComparison`, `momentNormalMU_eulerPrecomposition_injective`) and the `TauCeti.TopCat.serreFibrations` clause (main lines 653–654); this pull request revises the README rather than re-planning it, and the one of these that contradicts the ownership the pull request establishes is R01.

**Ownership against open work.** Unchanged since the previous review: TangentialBordism (#942) and HomotopySpheres (#1287) still carry their own Steenrod, James and Toda sections and are later than this roadmap in the merge order, so the repair is on their side; no other `Suggested.lean` on main or at an open head declares `formalNSeries`, `IsFormalGroupIso` or `formalHeight`. Ownership was checked only against the sibling checkouts the brief lists and the `roadmaps grep` index.

**Adversarial table.** Every statement is untouched by the (empty) diff; each row carries forward the previous report's computed values, re-read against the same lines at this head.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `formalNSeries` recursion (Lean 37–39) | n = 0, 1; 𝔾ₐ; 𝔾ₘ at n = 2 | [0] = 0; [1] = F(0,X) = X; 𝔾ₐ: [n] = nX; 𝔾ₘ: [2] = 2X + X² | agrees with [n]_F; every substitution has zero constant coefficient (previous report) | none |
| Exponent-two logarithm (Lean 58–67, README 113–145) | R = 𝔽₂ with F = 𝔾ₐ, 𝔾ₘ; R = ℤ; the zero ring | 𝔾ₐ: [2] = 0, g = X satisfies all four conditions, X + X² fails coeff(2) = 0; 𝔾ₘ: [2] = X² ≠ 0, hypothesis fails; ℤ: coeff₁([2]) = 2 ≠ 0; zero ring: g = 0 unique | true as stated (previous report) | none |
| `formalHeight` (Lean 82–83, README 147–152) | 𝔾ₘ, 𝔾ₐ over 𝔽_p; 𝔾ₐ over ℤ at p = 2 | 𝔾ₘ: [p] = X^p, height 1; 𝔾ₐ over 𝔽_p: [p] = 0, iInf over ∅ = ⊤; 𝔾ₐ over ℤ: coeff(X) = 2 ≠ 0, height 0 | matches the usual height over `CharP k p` (previous report) | none |
| Height classification (Lean 88–92, README 156–163) | 𝔾ₘ, 𝔾ₐ over 𝔽̄_p; F = G; twists of 𝔾ₘ over 𝔽_p | heights 1 and ∞, no isomorphism; F = G: φ = X; over 𝔽_p two twists of height 1 are non-isomorphic, so `IsSepClosed` is needed | true as stated (previous report) | none |
| `IsFormalGroupIso` direction (Lean 72–76) | φ = X; φ = 0; φ = uX + X² over 𝔽₂ | φ = 0 excluded by the unit clause; φ(F(X,Y)) = G(φX,φY) pins F → G | correct (previous report) | none |
| Steenrod Checks (README 252–258) | a ∈ H¹(RP^∞); degrees at p = 2, 3; d₂ on (1,2); Moore spectrum of ℤ/2^∞ | Sq¹a = a², Sq²a = 0; |ξ₂| = |Q₁| = 3 at 2; |ξ₁| = 4, |τ₀| = 1, |τ₁| = 5, |Q₁| = 5 at 3; (1,2) ↦ (3,3); L₁(ℤ/2^∞) = ℤ₂ | all correct (previous report) | none |
| Milnor primitive degrees (README 232–235) | i = 0, 1 at p = 2, 3 | |Q₀| = 1; |Q₁| = 2p − 1 = 3, 5 | agree (previous report) | none |
| Dual Steenrod coproduct (README 228) | n = 1, 2 | Δξ₂ = ξ₂⊗1 + ξ₁^p⊗ξ₁ + 1⊗ξ₂, matching miller-cobordism line 1220 | same sum reindexed (previous report) | none |
| MU Adams E₂ (README 272–281) | a_i bidegrees | a_i ∈ Ext^(1,2p^i−1), t − s even, E₂ even, collapse | consistent (previous report) | none |
| MU Hurewicz Checks (README 295–300) | i = 1,…,6 | 2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆; π₂ = ℤx₁, π₄ = ℤx₁² ⊕ ℤx₂ | correct (previous report) | none |
| MO Checks (README 348–353) | degrees 1–5 | π₁ = π₃ = 0, π₂ = 𝔽₂x₂, π₄ rank 2; degree 5: 7 = 1·1+1·2+1·0+2·1+2·0+2·1 | correct (previous report; Miller line 1373 agrees) | none |
| π₀MO = 𝔽₂ and the MO route (README 334–338) | H̃_n(MO(n);ℤ) | twisted Thom isomorphism gives ℤ/2, 2·id_MO = 0, cofiber of bounded exponent | closes without geometric input (previous report) | none |
| Toda bracket conventions (README 475–494) | ⟨2,η,2⟩; the swap | ⟨2,η,2⟩ = η² ≠ 0, indeterminacy 0; swap degree −1 | consistent (previous report) | none |
| James construction (README 828–848) | Y = S²; Y = S⁰ | H₂(J₂(S²)) = ℤ; J(S⁰) = ℕ ≠ ΩS¹ ≃ ℤ | path-connectedness stated (previous report) | none |
| Serre–Cartan basis (README 206–209) | n = 1, 2 at p = 2 and odd p | Hatcher page 500 cases | agrees (previous report) | none |
| K(n)-local Tate and Sylow unit (README 1815–1825) | n ≥ 1; G = S₃ at p = 2, 3 | [p](x) = v_n x^(p^n), K(n)^(tC_p) = 0; tr∘res = 3, 2 units | holds (previous report) | none |
| Smooth implies PL as used (README 1950–1957) | compact closed; noncompact | compact: finite triangulation; noncompact excluded | hypotheses present (previous report) | none |

## Not verifiable

- Thom, *Quelques propriétés globales des variétés différentiables* (1954), Chapitre IV: `thom-1954` is settled as uncertified; checked instead against miller-cobordism lines 1368–1373.
- Bousfield, *The localization of spectra with respect to homology* (1979), §6: `bousfield-1979` is settled as uncertified; the locator R02 asks for is cited by theorem number.
- James, *Reduced product spaces* (1955); Toda, *Composition Methods in Homotopy Groups of Spheres* (1962); Whitehead, *On C¹-complexes* (1940); Munkres, *Elementary Differential Topology* (1966): no open copy, as in the previous review; the constructions are checked through Hatcher 4J.1 and 3C.8, by computation, and through GeometricTopology's section respectively.
- The Lurie, Nikolaus–Scholze, Clausen–Mathew, Hovey–Strickland, Symonds and DHS/Hopkins–Smith passages behind F6.2–F6.5 were not reopened: those sections are unchanged since the previous review.

## Source issues

- none
