# Review of RiemannianGeometry (pull request #2222 at 90a5c6a)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 780–782 now read "harmonic representatives, and, for R5c, the extension of smooth functions across a smooth boundary by a collar and the half-space Seeley extension". Lines 3743–3744 read "K5a on closed manifolds and its Seeley extension across a boundary", and lines 3747–3749 read "collars (§1.1) and gluing along the boundary (§1.3)".
- R02 — repaired: the description's **Edits.** now ends its supplier-contract list with "and R5c's sentences in the GeometricTopology bullet (the collars of §1.1 and the gluing of §1.3) and in the ComplexKahlerGeometry bullet (K5a's Seeley extension)", which matches lines 776 and 779–782.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| K5a contract, README 777–782 | ComplexKahlerGeometry on main, §5.4 (K5a, line 1651), lines 1795–1796; #1807 line 1808; #1808 line 1772 | Supplier constructs the collar extension of functions/maps, the half-space Seeley extension and a finite partition of unity; the contract lists the first two | matches at main and both open heads | none |
| collar sentence for `exists_pos_dirichletEigenfunction_neg_laplaceBeltrami_add` (lines 3546–3549) | closed upper hemisphere of S², collar coordinates (y,t), g=dt²+cos²t dy² | Seeley Ef(t)=Σaₖf(−bₖt), Σaₖ=1: E(cos²)(0)=1, g_ty=0 extends to 0; g positive definite for \|t\|<δ; convex partition-of-unity combinations stay positive definite | holds | none |
| GeometricTopology §1.1, §1.3 as cited (lines 776, 3546, 3613, 3748) | main lines 788 (smooth collars) and 851 (gluing `M ∪_f N` along the boundary) | D̄ glued to ∂D×[0,1) via a collar gives a boundaryless M′ ⊃ D̄ | resolves | none |
| Dependencies vs *Needs:* vs contracts | lines 3612–3614, 3741–3751, 776, 779–782 | Each of the three has K5a's Seeley extension and GeometricTopology §1.1 and §1.3 | consistent | none |
| description vs head | **Edits.** sentence; diff 7cdd446..90a5c6a | The diff touches the K5a bullet and the R5c Dependencies lines; both are listed in the description | consistent | none |

Rows for the statements the diff does not touch stand as in the previous review, of 7cdd446. `Suggested.lean` is byte-identical to its 7cdd446 version, so that review's `#check @` comparison and one-tactic probe also stand.

- **Gate:** re-run at 90a5c6a: every check is 0 and the result is `OK`. The worker's run includes `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. ComplexKahlerGeometry and GeometricTopology are both on main.
- **Elaboration:** `lake env lean` gives 28 `sorry` warnings and nothing else.
- **Cross-roadmap citations resolved (5):**
  - K5a's Seeley extension at main line 1796, #1807 line 1808 and #1808 line 1772;
  - GeometricTopology §1.1 and §1.3 at main lines 788 and 851.
- **Seeded sample:** §§1.1–1.3 and 2.1–2.3 are untouched since 9a35a85. The diff adds no source locator and no pinned declaration, so this round checked 0 locators and opened 0 declarations.
- **Overlap check:**
  - Read Surfaces (#2225, main), MinimalSurfaces (#2226), LorentzianGeometry (#2232), ManifoldOptimization (#1506), PositiveMass (#2247), RicciFlow and HopfRinow (main).
  - The change adds citations and no owned object.
  - The half-space Seeley extension has one owner, ComplexKahlerGeometry K5a. PseudodifferentialOperators' Seeley citation (main line 2237) is complex powers, a different object.
  - Collars and gluing have one owner, GeometricTopology Layer 1. None of the roadmaps read states either.
- **Remarks on untouched text:** the overlap tool's GeneralizedCohomology G4 and G4.0b leads (lines 819, 1255, 1301, 1319) and the citation tool's AT4.6 lead stand as resolved at 9a35a85.

## Not verifiable

- Gilbarg–Trudinger, Theorems 3.5, 8.12–8.14, 8.37 and 8.38: DOI 10.1007/978-3-642-61798-0 resolves only to a paywalled page. The description says 8.12 and 8.37 were cited from memory. These lines are untouched this round.
- Milnor, *Morse Theory*; O'Neill, Theorem 2 and Corollary 1; Lee, *Introduction to Riemannian Manifolds*: uncertified in the manifest and cited by locator only.

## Source issues

- none
