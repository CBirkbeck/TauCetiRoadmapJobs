# Review of SmoothBanachRepresentations (pull request #1145 at b04eb8f)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** accepted

:robot: Incremental AI re-review of the 6 lines changed since 3823a08: the scope sentence on BanachSpaceTheory B4 and the Banach cases of the scalar comparisons, the §7.2a clause that now owns the Banach balancing map, and the enlarged third Check of §7.2a. The previous blocking finding is repaired and the repair introduced no new defect. One note carried from the previous round. The gate passes; the movable dependency check reports no problem; `Suggested.lean` is unchanged and elaborates with `sorry` as its only warning.

## R01 (P3) — The family index does not list the roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:13–` (“## The roadmaps”), the index this pull request owns together with the folder.

**Claim:** The index of the RepresentationTheory family lists its roadmaps.

**Witness:** The file is unchanged between 3823a08 and this head (`git diff` empty); every other subfolder of the family (AdoIwasawa at :32, CompactGroups at :47, and the rest) has an entry and SmoothBanachRepresentations has none. Carried from the previous report's R02.

**Repair:** Add one bullet in the same shape as its neighbours, linking `SmoothBanachRepresentations/README.md` and naming the content in a sentence (real and complex Banach smooth vectors, support-controlled Dixmier–Malliavin, exactness, tensors, spectral invariance). A note, not a blocker.

## Previous findings

- R01 — repaired: :438 now owns the Banach case: “For complex Banach E and F … the balancing map is a continuous real-linear map from B4's real completed Banach tensor E_ℝ⊗̂ℝF_ℝ to the realification of B4's complex completed Banach tensor E⊗̂ℂF”, with surjectivity, kernel, isometry and naturality as targets; :9 says B4 “states no map between its real and complex tensors”. Both claims about suppliers were verified on main (below). No new problem.
- R02 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md` is unchanged and still has no entry for the roadmap; written again as this report's R01 (P3, not blocking).

## Verified sound

Head `b04eb8fe65ee400ce599d1a588cc04729889d252`, worktree clean; main is `929496d4`. The brief's outside-folder diff is empty; the diff against `origin/main` lists only `README.md` and `Suggested.lean` of the folder. `Suggested.lean` and the family index are byte-identical to 3823a08. No file was changed by this review.

### Gate, dependency direction and Lean

The worker's gate at this head passes every check (`build=0 OK`). Run again by this review, the plain gate prints `depcheck=1 … FAIL` with only `NOT IN ORDER: SmoothBanachRepresentations (insert it after its last supplier)`, which the brief says is not a defect; the same gate with the merge-order candidate prints `depcheck=0 … OK` with every other scanner at 0. The movable check printed exactly:

```text
depcheck: 204 roadmaps, 1658 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The `*Needs:*` line of §7.2a (:440) is unchanged and names only native declarations, `TauCeti.Complexification`, BanachSpaceTheory B4, NoncommutativeGeometry N1 “as the complex construction compared with” and this roadmap's §7.2; the new Banach clause uses nothing beyond those (N1's comparison with B4 is part of N1's complex construction, main :91–92). The §7.3 line (:455) and the Layer 7 dependencies (:478) cite §7.2a for real factors and the scalar comparisons, not a B4 comparison.

`lake env lean` on `Suggested.lean` elaborated in 5 s with exactly seven “declaration uses `sorry`” warnings and nothing else. The scratch copy with `#check @name` for all 12 declarations elaborated again; the printed types are those of the previous report (the file is unchanged), including `smooth_inverse` without an orbit-continuity hypothesis and with `CompleteSpace A` in scope. The one-tactic probe of the previous report stands. No `set_option`, no sorry'd data, one `import Mathlib`, no `lemma`.

### Seeded source sample

Of the sample's targets only 7.2a falls in the diff. The others (0.1, 0.3, 1.1, 1.2, 1.4, 2.1, 3.1, 3.4, 4.1, 6.1, 7.1, 7.3, 7.4, 8.1) are untouched since the heads that earlier rounds read, and their rows stand (7.3, 7.4, 8.1 in the previous report's sample table; the rest in the rounds before it).

| Target | Text and locator checked | Support and limits |
|---|---|---|
| 7.2a, Banach clause (new) | BanachSpaceTheory main `README.md:167–254`: the projective norm is the infimum of `∑‖xᵢ‖‖yᵢ‖` over finite decompositions, “norms over ℝ and ℂ” (:197), completions by `UniformSpace.Completion` (:193), symmetry, associativity and scalar-unit isometries (:200); the only realification in the roadmap is B6's Grothendieck inequality (:397). NoncommutativeGeometry main `README.md:91–92`: “Prove Fréchet completeness/metrizability and its agreement with BanachSpaceTheory B4's Banach projective tensor”, in a roadmap whose algebras are complex (:12). | The scope sentence at :9 (“B4 … states no map between its real and complex tensors”) is correct, and the two identifications the clause routes through (§7.2a's own Banach agreement for the real side, N1's comparison with B4 for the complex side) both exist where cited. The clause cites no theorem of B4 or N1 that they do not state. |
| 7.2a, native citations (unchanged) | `exists_extension_of_le_sublinear` at `Mathlib/Analysis/Convex/Cone/Extension.lean:159`; `UniformSpace.Completion` at `Mathlib/Topology/UniformSpace/Completion.lean:291` (`SeparationQuotient (CauchyFilter α)`); `TauCeti.Complexification` at `TauCeti/Analysis/Normed/Module/Complexification.lean:80`, `Module ℂ` instance :141, `equivProd` :303 | All present at the pins with the hypotheses the previous report recorded. |

### Adversarial computations

Rows 1–13 of the previous report stand for the statements the diff leaves untouched (and rows 1–70 of the report before it, as that report recorded); row 12's “real-to-complex clause is R01” is superseded by rows 14–19 below.

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 14 | Banach balancing map: source and target (:438) | `E=F=ℂ`: source `ℂ_ℝ⊗̂ℝℂ_ℝ`, B4's real tensor of two real Banach spaces, real dimension 4; target `(ℂ⊗̂ℂℂ)_ℝ=ℂ_ℝ`, real dimension 2; the map induced by `(x,y)↦x⊗_ℂy=xy` is real-bilinear and bounded by `‖x‖‖y‖`, so continuous real-linear on the completion. `E={0}`: both sides `{0}`, the map is the zero isomorphism. | Well-defined with the stated source and target; retain. |
| 15 | Check 3 values (:448) | Images of the real basis: `1⊗1↦1`, `i⊗1↦i`, `1⊗i↦i`, `i⊗i↦i²=−1`; `a·1⊗1+b·i⊗1+c·1⊗i+d·i⊗i↦(a−d)+(b+c)i`; kernel `a=d, b=−c`, spanned by `1⊗1+i⊗i` and `i⊗1−1⊗i`, dimension `4−2=2`. Both spanning elements are of the form `ix⊗y−x⊗iy`: `i·1⊗1−1⊗i·1` and `i·i⊗1−i⊗i·1=−(1⊗1+i⊗i)`. | Check correct and matches the kernel description of the target; retain. |
| 16 | Complex projective norm is the quotient norm of the real one (Banach case) | Algebraic level: a complex representation `t=Σxᵢ⊗_ℂyᵢ` is the image of the real element `Σxᵢ⊗_ℝyᵢ` of the same cost, so `quotient(t)≤π^ℂ(t)`; every real representation of every lift maps to a complex representation of `t` of the same cost, so `π^ℂ(t)≤quotient(t)`. Instance `t=1∈ℂ⊗_ℂℂ`: lifts `1⊗1` (cost 1), `−i⊗i` (cost 1), `(1+s)·1⊗1+s·i⊗i` (that representation costs `|1+s|+|s|≥1`); `π^ℂ(1)=|1||1|=1`; quotient norm `1`, as the Check says. Completion: for a normed space `X` with subspace `N` and `x∈X`, `dist(x,N̄)=dist(x,N)` by continuity of the norm, so `X̂/N̄` contains `X/N` isometrically and densely and is complete, hence is its completion; thus the balancing map on completions is onto with kernel `N̄` and the induced bijection is isometric. | Surjectivity, kernel and isometry as stated; retain. |
| 17 | Kernel dimension for `E=ℂ`, `F` a complex Banach space of complex dimension `n` | Source `ℂ_ℝ⊗_ℝF_ℝ≅F_ℝ⊕F_ℝ`, real dimension `4n`; target `(ℂ⊗_ℂF)_ℝ=F_ℝ`, real dimension `2n`; map `(a+bi)⊗y↦(a+bi)y`; kernel spanned by `i⊗y−1⊗iy`, real dimension `2n=4n−2n`. `n=1` recovers row 15. | Consistent with the general kernel description; retain. |
| 18 | Naturality of both scalar comparisons in continuous linear maps (:438) | `T:E→E′`, `S:F→F′` continuous ℂ-linear: `(T⊗S)(bal(x⊗_ℝy))=Tx⊗_ℂSy=bal((T_ℝ⊗S_ℝ)(x⊗_ℝy))`; the two continuous maps agree on the dense span, hence everywhere. Complexification map, `T,S` real: `(T_ℂ⊗S_ℂ)((x⊗1)⊗(y⊗1))=(Tx⊗1)⊗(Sy⊗1)` and `((T⊗S)_ℂ)((x⊗y)⊗1)↦(Tx⊗1)⊗(Sy⊗1)`; equal on the dense span. | Natural; retain. |
| 19 | Scope sentence :9 and contract :64 agree with §7.2a | :9 “including their Banach cases, as targets of this roadmap”; :64 “the two scalar-comparison maps between real and complex tensors, are targets of §7.2a”; :438 states them with the Banach case; :455 and :478 consume §7.2a for them. Grep for “balancing”/“B4” finds no other mention. | The roadmap agrees with itself; retain. |

### Ownership of the Banach scalar comparison

`roadmaps grep -i --readme-only 'balancing map|ix⊗y|realification…projective tensor'` over the 440 open heads and main finds only this roadmap (:438 and :448). BanachSpaceTheory on main owns the real and the complex Banach projective tensor separately and states no map between them (:167–254, realification only at :397 in B6); NoncommutativeGeometry N1 on main is complex only (:12). The open revision of NoncommutativeGeometry is a revision of an existing roadmap and not a citable supplier, as the previous report recorded. So owning the Banach case of the balancing map in §7.2a introduces no second owner.

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| BanachSpaceTheory B4 (real and complex completed Banach projective tensor; no real-to-complex map) | main `README.md:167–254`, :197, :200, :397 | Resolves; the negative claim at :9 is correct. |
| NoncommutativeGeometry N1's comparison with B4 | main `README.md:91–92` | Resolves. |
| §7.2 Fréchet open mapping theorem (internal), §7.2a Banach agreement (internal) | `README.md:426`, :436 | Owned here; §7.2 does not use §7.2a, no cycle. |
| AutomorphicFormsOnReductiveGroups §2.7, §0.1a, §2.1; CompactGroups Layer 5; LieGroups 0–3; OneParameterSemigroups Part A; BanachAlgebras A1–A2, A7; NoncommutativeGeometry N6; Phillips 1955 | unchanged since 22d2666 and 3823a08 | Resolved in the previous reports; not re-derived. |

Every backticked Lean name of this roadmap's own in the README is declared in `Suggested.lean` and every Lean name appears in the README (the worker's resolve pass found none missing; the Lean file is unchanged). The headline inventory of the previous report is unchanged.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Bull. Sci. Math. 102 (1978): no legal readable copy, as in the previous rounds; the README labels its locators uncertified and routes every claim through Casselman. Nothing in the diff depends on it.
- The completion-of-quotient step of row 16 was checked as a route with its hypotheses (metrizable in the Fréchet statement, normed in the Banach clause), not as a formal proof.
- Ownership against open pull requests was checked through the roadmap tool's index and grep and the sibling checkouts the brief lists; the five board packages are arithmetic and logic packages whose contents were not fetched.

## Source issues

- none
