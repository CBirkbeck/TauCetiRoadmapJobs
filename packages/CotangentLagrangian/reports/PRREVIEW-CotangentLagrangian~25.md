# Review of CotangentLagrangian (pull request #2687 at 39183a0)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 75 lines changed since `2544fed` has no findings. The five small corrections of the previous review are repaired and each repair was checked at its source: the former-numbering paragraph against the README on main, the Gotay locator against the paper, the four relative Poincaré declarations against the pinned Tau Ceti, and the two consumer citations against HamiltonianReduction and IntegrableSystems. There is one small correction (a sentence of the description that the restored anchors make wrong) and two format notes, none blocking. Nothing is left for a human to decide.

## C01 — The description says the anchor links into this README no longer match, but this head keeps the anchors

The last paragraph of the description's Suggested.lean section says: "Anchor links into this README from `SymplecticGeometry/README.md` and from HamiltonianReduction (`#c20-…`, `#c21-…`, `#c22-…`, `#c4-…`) no longer match a heading." At this head the README carries the explicit anchors `c20-elementary-matrix-polar-package` (line 239), `c21-compact-intersections-and-group-applications` (line 291), `c22-exact-lagrangians-and-basic-examples` (line 428) and `c4-relative-symplectic-germs` (line 946), which are exactly the fragments linked from the family index (its lines 35 and 72) and from HamiltonianReduction (its line 73), so those links resolve. A reader of the description would expect broken links and look for a follow-up change that is not needed. The sentence would be right as: "The anchors `#c20-…`, `#c21-…`, `#c22-…` and `#c4-…` that `SymplecticGeometry/README.md` and HamiltonianReduction link to are kept as explicit anchors before §2.0, §2.1, §2.2 and Layer 4; the Former numbering paragraph gives the mapping for citations by id."

## N01 — Several targets still carry no locator

As in the previous review: the Kodaira–Thurston target of §2.2 (Cannas da Silva has the example with b₁ = 3 at p. 102), the symplectic neighbourhood theorem of §4.6, the transverse composition of §3.0 and the polar diffeomorphisms of §2.0. A locator into a standard text for each would let a reader check the hypotheses.

## N02 — The new sentence of §4.1 writes r*η where the paragraph has r*(i*η)

In §4.1, r is introduced as the retraction onto Q and the target reads dβ = η − r*(i*η) (line 966); the added sentence says the differential of the fibre-scaling operator "is η − r*η" (line 974), which reads r as the self-map (q, p) ↦ (q, 0), as the supplier contract defines it. Writing η − r*(i*η) in line 974 too would keep one meaning of r in the paragraph.

## Deferred findings

- D01 — resolved: this head adds the explicit anchors `c20-…`, `c21-…` and `c22-…` (README lines 239, 291, 428), so the family index links at its lines 35 and 72 resolve.

## Previous findings

The previous report had no findings (no R-numbered remark); its small corrections and format note are accounted for here.

- C01 (previous) — repaired: "**Former numbering.** Citations of the former section ids resolve as follows: C1 is now Layer 1, its item n being §1.n; C2 is now Layer 2, its opening paragraphs being §2.3; …" (line 1274); anchors restored.
- C02 (previous) — repaired: "stated there without compactness and without proof; Gotay, Local Uniqueness Theorem, p. 111, proved in §III, p. 113, for closed embeddings" (line 1142); the Lean docstring says the same.
- C03 (previous) — repaired: "Develop the kernel, leaf and quotient tangent API." (line 1146) and "HamiltonianReduction R3 applies the tubular fibre-homotopy construction of §4.1–§4.3 to its orbit slices." (line 1193); ConvexityToric no longer named.
- C04 (previous) — repaired: "The coordinate-box case is Tau Ceti's, on an open convex subset of a product E × N of normed spaces that is stable under scaling the normal coordinate by t ∈ [0, 1]" (line 970), with the four declarations in the contract.
- C05 (previous) — repaired: "IntegrableSystems §5.2 (I5.2), the finite action and periodic-orbit dictionary, instantiates the chain dictionary of §3.1" (line 1195); I5.2 resolves on main, §5.2 at the open revision.
- N01 (previous) — not repaired: the four targets still have no locator; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.1, coordinate-box case as cited from Tau Ceti (lines 970–977, contract 1463–1469) | E = N = ℝ: η = dx∧dy; η = dx (degree 1); a ball about (0, 2) | Kη = −y dx, d(−y dx) = dx∧dy, r*η = 0, K at (x, 0) is 0; η = dx: K = 0, dx − r*dx = 0; ball not scaling-stable, excluded by hypothesis | README matches the pinned statements: C¹ for the identity, r : ℕ∞ with 1 ≤ r, F complete for the last two | N02 |
| §4.1 pinned declarations | names and namespaces | `TauCeti.fiberwisePoincareHomotopy` (line 67), `…_zeroSection` (96, no hypothesis on ω), `Convex.extDeriv_fiberwisePoincareHomotopy` (192, root namespace), `Convex.exists_contDiffOn_relative_primitive` (269) | all four exist as named | none |
| §4.8 and `exists_diffeomorph_opens_of_isCoisotropicMap` (docstring changed, statement not) | Q = M compact, i = id; S¹ ⊂ ℝ² and zero section of T*S¹; a point in ℝ² | kernel 0, codimension 0, φ = j on U = M; σ = 0, both Lagrangian, Weinstein; point: TQ^ω = ℝ² ⊄ 0, not coisotropic; dim M = 2 dim Q − rank σ = dim N | true; compact embedding is closed, as Gotay's definition requires | none |
| §4.8 locators | Gotay p. 111, §III p. 113; Cannas da Silva Thm. 8.6 | Gotay1982 lines 15, 34–35 (closed imbedding; statement on printed p. 111), 92 (proof, p. 113); CannasDaSilvaLSG lines 2028–2040 (no compactness, proof referred out) | locator sentence true | none |
| Former numbering (line 1274) | README on main | C1 items 1–4 ↔ §1.1–§1.4; C2 opens with tangent-image predicates (§2.3); C3 opens with correspondences and generating functions (§3.0, §3.0a); C2.0–C2.2, C3.1, C4 headings | every former id cited elsewhere is mapped | none |
| Consumers (lines 1193, 1195) | HamiltonianReduction on main; IntegrableSystems on main and at its open head | HamiltonianReduction R3.1, line 276: applies the tubular fibre-homotopy construction of the former C4; IntegrableSystems main line 534 "I5.2", open head line 952 "5.2 Finite action, quotient and periodic-orbit dictionary" | both citations supported | none |
| Anchors (lines 239, 291, 428, 946) | family index lines 35, 72; HamiltonianReduction line 73 | four fragments linked, four anchors with the same ids present | links resolve; description says otherwise | C01 |

The rows for the untouched statements stand as in the previous review, of `2544fed`.

- Source locators checked against the text: 2 (Gotay1982 lines 12–37 and 92–121; CannasDaSilvaLSG lines 2028–2040).
- Library declarations opened at the pin: 5 in `TauCeti/Analysis/Calculus/DifferentialForm/Relative.lean` (lines 67, 96, 180, 192, 269), with the standing variables at lines 43–45 and 188.
- Cross-roadmap citations resolved: HamiltonianReduction R3 (main, lines 262, 276), IntegrableSystems I5.2 (main, line 534) and §5.2 (open head, line 952); family index links (lines 35, 72).
- Automatic checks: run again on this head, all pass. Dependency check output: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eight `declaration uses sorry` warnings (lines 103, 135, 164, 181, 199, 221, 258, 278) and no other message; the diff changes one docstring and no signature, so the binder comparison and the one-tactic probe of the previous review stand.
- Headlines: unchanged; the eight stated theorems and the docstring's list of the five not statable are as the previous review read them.

Overlap check: read IntegrableSystems (main and open head, §5.2), HamiltonianReduction (main, R3) and SymplecticGeometry (the family index at this head) for the changed citations; ContactGeometry stands as read in the previous review; nothing shared: the chain dictionary is §3.1's and IntegrableSystems instantiates it, the relative germs are Layer 4's and HamiltonianReduction applies them, the contact predicate is ContactGeometry's.

Source independence: changed passages only: 2 passages compared with 2 sources (the §4.8 locator sentence and its docstring with Gotay1982 lines 34–35 and CannasDaSilvaLSG lines 2028–2040; the added §4.1 sentence describes pinned library declarations and has no source passage), none shared; largest share CannasDaSilvaLSG, 15 of 16 locator sites; contents not compared again, since the diff adds, removes or reorders no layer (previous result: independent).

Research link: Layer 4 is Weinstein's Lagrangian neighbourhood theorem (Weinstein, 1971) and Gotay's coisotropic embedding theorem (Gotay, 1982), as CannasDaSilvaLSG pp. 48–49 cites them and Gotay1982 proves; §2.2's example is Thurston's (1976). FukayaTheory, HeegaardFloer and TaubesGromov consume Layer 4. Rests on CannasDaSilvaLSG, Gotay1982 and the README's Downstream consumers.

## Not verifiable

- none: both locators of the changed passages were read in the texts, and every head consulted was read at its head.

## Source issues

- none

## For the human reviewers

- none
