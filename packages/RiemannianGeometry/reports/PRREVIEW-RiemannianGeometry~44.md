# Review of RiemannianGeometry (pull request #2226 at 9cfb02f)

**Verdict:** needs changes

## R01 (P3) — The description's list of edits to the parent README leaves out the two new §1.1 locators

**Location:** pull request description, paragraph "Edits to the parent README": "A paragraph listing the sub-roadmap after the opening, and one sentence in "Downstream consumers"."

**Claim:** The sentence lists the parent README's edits as complete. At this head the parent README also adds locators to §1.1 items 1 and 3, and two entries under References. A reader of the description does not learn that R1's text changed.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/RiemannianGeometry/README.md` has hunks at lines 895–898 (Bishop §3.11), 927–929 (Barzen–Leymann Theorem 7), 4123–4124 and 4145–4146 (References). These are in addition to the opening paragraph and the line 4036 sentence.

**Repair:** Replace the paragraph with: "**Edits to the parent README.** A paragraph listing the sub-roadmap after the opening, one sentence in "Downstream consumers", and two locators in §1.1 (item 1: Bishop, §3.11, p. 13; item 3: Barzen–Leymann, Theorem 7, p. 46), with their entries under References."

## Previous findings

- R01 — repaired: README line 4036–4037 "consumes R1's Euclidean limits of rescaled metrics, R3, R4.1–R4.3, R4.5, R5a, …"; the description's MS1 bullet reads "(R1 item 5, R3, R4.1–R4.3, R4.5, R5a, …)".
- R02 — repaired: §1.1 item 1 cites "(Bishop, *Riemannian Geometry*, §3.11, p. 13, the second structural equation `Φ=dϕ+ϕ∧ϕ`; …)"; item 3 cites "(Barzen–Leymann, *Mathematics of Spacetime*, Theorem 7, p. 46, which cites Lee, …, Theorem 7.10)". Both have References entries.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| §1.1 item 1: Bishop's Φ is the matrix of our R | Bishop's `D_X X_j=Σϕ^i_j(X)X_i` (line 484); our R; Bishop's `R_XY=D_[X,Y]−D_XD_Y+D_YD_X` (line 572) | our `R(X,Y)B=B(Xϕ(Y)−Yϕ(X)−ϕ([X,Y])+ϕ(X)ϕ(Y)−ϕ(Y)ϕ(X))=BΦ(X,Y)`; Bishop's matrix is −Φ (line 580) | consistent with the README's sign remark |
| same, unit S² | coframe dθ, sin θ dφ | ϕ¹₂=−cos θ dφ, Φ¹₂=sin θ dθ∧dφ, Φ¹₂(e₁,e₂)=1=⟨R(e₁,e₂)e₂,e₁⟩=K; Bishop's sign gives −1 | holds |
| §1.1 item 3: flat on an open set ⇔ locally Euclidean | flat T²; open U⊂ unit S²; dimension 1 | R=0 with ℝ²→T² a local isometry; K=1≠0 on U, so no Euclidean chart; R=0 and an arc-length chart | holds both ways |
| same, against Barzen–Leymann | Definition 46 and Theorem 7 (lines 2119–2122, p. 46); stated for (pseudo-)Riemannian M | an open U⊆M with the induced metric is such an M | source supports the statement |
| Consumer sentence, line 4036 | counts in MinimalSurfaces/README.md | R3: 5, R4.1: 15, R4.2: 3, R4.3: 3, R4.5: 6, R5a: 24, R5b: 20, R5c: 28, R7.0: 9, R7.6: 5, R7.9: 16, R8.2: 5, "rescaled": 18; R2, R4.4, R4.6–R4.9, R6, R7.1–R7.5, R7.7–R7.8, R8.1, R8.3–R8.5: 0 | range now exact |

The rows of the previous review, of `3866361`, stand for every untouched statement. `Suggested.lean` has not changed since then (`git diff --stat 3866361 HEAD` lists the README only).

- Source locators: 2 new, both checked against the text. bishop-rg line 570 (§3.11) and line 578 (the second structural equation), with the page 13 marker at line 561. spacetime-guided-tour line 2122 (Theorem 7) with the page 46 marker at line 2104; its reference [23] at line 5289 is Lee's second edition. "Used by R1.1" matches the label of §1.1 (README lines 63, 316).
- Library declarations: the changed text names none.
- Cross-roadmap citations: the change adds none. The parent sentence's 13 items were resolved against MinimalSurfaces at this head (table).
- Gate: `tauceti-roadmap gate` passes every check at 9cfb02f. The dependency check prints `depcheck: 206 roadmaps, 1912 edges, 0 problem(s)`. `git diff --stat` outside the roadmap folders is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 23 `declaration uses 'sorry'` warnings and nothing else. The previous `#check @` comparison and one-tactic probe stand, because the file is unchanged.
- Overlap leads stand as resolved in the previous review. GeneralizedCohomology G4.0b is on main at line 939, and AlgebraicTopology §4.6 is on main. #2222–#2225 each merge cleanly with this head, in the order the description states.
- Overlap check: read RicciFlow, PositiveMass, Surfaces (main and #2225), LorentzianGeometry (#2232), ManifoldOptimization (#1506), DGFloerPartII (#1799) and SmoothBundlesConnections (#2127). SBC B4 owns the principal-bundle structure equation, which §1.1 consumes. RicciFlow's moving frame is Uhlenbeck's, a different object. None of them owns the frame form of R or the flat ⇔ locally Euclidean equivalence, so R1 is the single owner.

## Not verifiable

- lee-irm (Theorem 7.10, cited in §1.1 item 3 through Barzen–Leymann): settled as uncertified. It is confirmed only through spacetime-guided-tour lines 2121 and 5289.

## Source issues

- none
