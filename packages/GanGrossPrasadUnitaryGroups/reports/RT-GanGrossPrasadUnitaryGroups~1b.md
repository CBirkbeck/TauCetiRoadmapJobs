<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/625#issuecomment-6334386908 -->
Red team round 1 pass b (claude) of d0e51ae

Verdict: needs_changes

1. **F01** (P3) Four of the five sorried theorems are one tactic each from the pinned Mathlib

   **Location:** `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:25–29` (`splitLineFrame_iff_norm_ne_zero`), `:84–92` (`algebraicBesselModel_equivariant`), `:174–178` (`unitaryConstituentSigns_card`), `:197–201` (`unitaryConstituentCoefficient_eq`).

   **Claim:** These four are stated as sorried targets, but each is a direct instance of a pinned declaration the README already names (`Prod.isUnit_iff`, `Representation.IntertwiningMap.isIntertwining`, `Nat.card_fun`/`Nat.card_sum`). They carry no roadmap content; left sorried they read as work, and a port would count them among the open targets. Only `componentCentralElement_character` (lines 131–137) is a genuine target.

   **Witness:** A probe copy of the file with the four proofs below elaborates under the project's pinned toolchain (`lake env lean`) with the single remaining `sorry` warning at `componentCentralElement_character`; no other diagnostics.

   **Exact repair text:** replace the four `sorry` bodies by, respectively:
   `rw [splitLineFrame, Prod.isUnit_iff, isUnit_iff_ne_zero, isUnit_iff_ne_zero, mul_ne_zero_iff]`;
   `simpa [Representation.tprod_apply, TensorProduct.map_tmul] using Representation.IntertwiningMap.isIntertwining _ _ ℓ h (v ⊗ₜ[ℂ] w)`;
   `simp [unitaryConstituentSigns, Nat.card_fun, Nat.card_sum]`;
   `simp [unitaryConstituentCoefficient, unitaryConstituentSigns_card]`.
   Keep the statements and docstrings; if the file is meant to leave one sorried target per layer, the README's next statement in each layer (for instance the besselModel dimension bound of §2.1, or the §6.3 coefficient identity against the relative character) is the one to state instead.

2. **F02** (P3) Supplier heading names a module path that does not exist

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:69`: “### From TauCetiRoadmap.RestrictedProducts”.

   **Claim:** The restricted-products roadmap is no longer under `TauCetiRoadmap/`; it lives at `Completed/RestrictedProducts/` and its targets are discharged by Tau Ceti declarations. The section text already says “Completed Layers 0–3”, but the heading points a reader at a folder that is absent from the destination repository.

   **Witness:** On the current `main` tree, `Completed/RestrictedProducts/README.md` exists and `TauCetiRoadmap/RestrictedProducts/` does not. Sibling roadmaps cite it as `[RestrictedProducts](../../Completed/RestrictedProducts/README.md)` (`TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`).

   **Exact repair text:** heading “### From [RestrictedProducts](../../Completed/RestrictedProducts/README.md) (completed)”; first sentence “Its completed Layers 0–3 supply compact-open reference families, coordinate maps, reference change, finite-place decomposition and eventually integral rational diagonals, each realized by the Tau Ceti declaration its README names.”

3. **F03** (P3) The title lower-cases proper names

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:1`: “# Roadmap: unitary bessel models and the gan–gross–prasad period formula”.

   **Claim:** Lower-case titles are used on `main`, but they keep proper names capitalised; here “Bessel” and “Gan–Gross–Prasad” are not, while the same package's docstrings and body write “Bessel” and “Gan–Gross–Prasad”.

   **Witness:** `TauCetiRoadmap/LocalGaloisGroups/README.md:1` “local Galois groups of p-adic fields” and `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1` “Galois groups of polynomials” (first lines on `main`); `Suggested.lean:75–83` docstring “A Bessel functional …”.

   **Exact repair text:** “# Roadmap: unitary Bessel models and the Gan–Gross–Prasad period formula”.

4. **F04** (P3) Non-unitary endpoints are assigned to a “Part II” of a unitary-groups roadmap

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:19`: “Orthogonal, symplectic/metaplectic and Fourier–Jacobi GGP endpoints belong to GanGrossPrasadUnitaryGroups, Part II”; `:1408` “belong to the named Part II”.

   **Claim:** A Part II continues its roadmap's subject; the orthogonal, metaplectic and Fourier–Jacobi cases are not unitary Bessel models, so the name misdescribes the owner and a later board triage would attach that work to this roadmap's name. The filed target narrowed the scope to unitary groups and names no Part II.

   **Witness:** The target statement on the job board (“The Gan–Gross–Prasad conjectures for unitary groups: multiplicity one for Bessel models of unitary pairs …”) and this README's own scope sentence at line 19 (“its scope begins after the unitary Bessel interfaces here”).

   **Exact repair text:** line 19: “Orthogonal, symplectic/metaplectic and Fourier–Jacobi GGP endpoints belong to a later roadmap on the remaining classical cases; its scope begins after the unitary Bessel interfaces here.” Line 1408: replace “belong to the named Part II and retain their other owners” by “belong to that later roadmap on the remaining classical cases and retain their other owners”.

## Verified sound

Read all 1447 README lines, all 213 Lean lines and the 17-entry manifest. Elaborated `Suggested.lean` as submitted under the project's pinned toolchain (`import Mathlib` at the pin): the only diagnostics are the five `sorry` warnings; no error, no linter warning, no `set_option`, no `lemma`, one import.

Counts: 23 Lean declarations read (6 definitions/abbreviations, 5 sorried theorems, 12 proved examples); 40 numbered README target blocks read; 36 declared gaps checked for an owner and a matching slug; 17 manifest entries checked for a locator; 14 locators verified against the cached legal copies; 9 Checks recomputed; 17 supplier/consumer citations checked against `main` and the merge order.

Locators verified in the cached copies: bpcz Theorem 1.1.5.1 (the L-function and the Petersson normalisation), Theorem 1.1.6.1 (the normalised local period and the spherical value), the constant `|S_Π|⁻¹` with `S_Π = S_{Π_n} × S_{Π_{n+1}}` and `|S_Π| = 4` in the cuspidal case (lines 104–107, 191–195), Theorem 8.1.4.1 with the factor `2^{−dim A_P}` (line 4245–4254) and (10.3.2.1) (line 4892); ggp Theorem 17.2, Corollary 15.2, Theorem 14.1, Conjecture 24.1 and Section 6 “Characters of component groups” (line 720); agrs Theorem 1′ (line 59); harris Conjecture 1.3 and Theorem 2.12; bplzz Theorem 1.8, Theorem 1.10 and Definition 1.5; xue-real Theorem 2.2 (p. 1000), Lemma 4.1 (line 1067, p. 1025) and Corollary 2.5 (line 254, p. 1001, as cited). The cited pages agree with the README's page numbers.

Checks recomputed: the split-line frame criterion over F₂ and Q (unit iff both coordinates nonzero); the linear-first pairing distinguishes i from −i; the trivial scalar model takes the values 1 and i on the displayed tensors; the central element vanishes for multiplicity two and the generator does not; sign-group orders 4, 8, 1 and coefficients 1/4, 1/8, 1 for constituent counts (1,1), (2,1), (0,0); the Layer 5 arithmetic for the displayed Steinberg/split example (raw integrals 3 and 1, `L(1/2) = 2`, `L(1, Ad) = 32/9`, `C = 3`); the `2^{−dim A_P} = |S_Π|⁻¹` agreement between §6.3 and Theorem 8.1.4.1 (both are `2^{−(r_n + r_{n+1})}`). The §2.4 finite-place reduction keeps the unnormalised induction and the excluded block; the §3.8 induction decreases the counts and keeps the zero companion-lift branches.

Merge order and ownership: the package is inserted after its last supplier (position 149 of 151, after ModularityAndLanglandsExtensions); every named supplier is above it, on `main`, or completed (ReductiveGroups, GlobalNumberFields, NoncommutativeGeometry on `main`; ReductiveGroupsPartII, SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, EndoscopicTransferAndUnitaryTraceComparison, MetaplecticAutomorphicForms, ModularityAndLanglandsExtensions above it; RestrictedProducts completed). No upward dependency. The two named consumers, PeriodsAndSpecialValues and TwistedAutomorphicDescents, are open packages on the job board and not yet in the order, which is the expected state for consumers. The 36 gaps each name one owner and no gap is double-owned. No process words or pull-request numbers in the README or the docstrings. The diff against `main` touches only this package.

Not re-raised: the three findings of round 1 pass a (Check mirrors, the K-basis restriction, the manifest path) were read and are not repeated here; F01 above is independent of the pass-a Check finding (it concerns the sorried theorems, not the examples).

## Not verifiable

- **Waived source:** xue-bessel is waived; nothing was inferred from it.
- **Fine typography in xue-real:** the cached extraction scrambles conjugation bars and exponents in several displayed formulas; the statement numbers, pages, rank conditions and the induction structure were checked, the printed signs in those displays were not.
- **Declared gaps:** the 36 supplier contracts were checked for ownership, direction and slug agreement, not for existence at the suppliers' current heads; acceptance of the package's eventual theorems remains conditional on those contracts.
- **Analytic categories:** the Casselman–Wallach, Schwartz and relative-trace statements are specified in prose only; their Lean carriers do not exist yet and no signature for them was tested.
