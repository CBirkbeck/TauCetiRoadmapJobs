# Review of CotangentLagrangian (pull request #2687 at 2544fed)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** accepted

**Summary.** Accepted: there are no findings. The eight headline statements are unchanged from main and test true on every instance tried. All 20 README locators match Cannas da Silva at the stated theorem and page, the targeted build of `Suggested.lean` passes, the automatic checks of the text (process words, machine paths, Lean form) pass, and the dependency check finds no upward or cyclic supplier. There are three small corrections and no format notes, none blocking. First, the README drops the ids C1–C4 without an old → new mapping, although twelve roadmaps on main cite them. Second, §4.8 adds a compactness hypothesis that the cited Thm. 8.6 does not have. Third, two consumer attributions for §4.8 are not supported by the consumers' own READMEs. Nothing is left for a human to decide. The previous review of this roadmap had no open findings, and its two earlier repairs still hold at this head (the Hurewicz route of §2.2, lines 514–516, and the dimension counts of §2.3, lines 583–587).

## C01 — The ids C1–C4 that other roadmaps cite are renumbered with no old → new mapping in the README

When this merges, a reader who follows "CotangentLagrangian C3.1" or "C4" from another roadmap finds no such heading. Twelve READMEs on main cite the former ids. LieGroups cites C2.0 and C2.1 (its lines 904, 1235, 1422–1423); IntegrableSystems (line 544) and MathematicalBilliards cite C3.1; HamiltonianReduction (lines 73, 276), TaubesGromov and FukayaTheory cite C4; LieGroupoidsPoisson cites C1; DGFloer, GeometricQuantization, HeegaardFloer and ContactGeometry cite the old ids too. The open heads of ContactGeometry, MathematicalBilliards, LieGroups, DGFloer and ArithmeticKTheoryPartII also cite them. The pull request's description gives the mapping, but the README does not. One sentence would fix this, for instance under Scope and ownership: "In the former numbering, Ck.n is §k.n here, C1 item n is §1.n, the opening of C2 is §2.3, the body of C3 is §3.0 and §3.0a, and C4 is §4.1–§4.8."

The family index `TauCetiRoadmap/SymplecticGeometry/README.md` belongs to this pull request. It still links to the removed anchors `#c21-…` and `#c20-…` (line 35) and `#c22-…` (line 72). Pointing these links at §2.1, §2.0 and §2.2 repairs them. With that change, the description's sentence that these files are "outside this change" applies only to HamiltonianReduction's link at its line 73.

## C02 — §4.8 cites Cannas da Silva Thm. 8.6 for a narrower statement than the source makes, without saying so

At p. 49 (CannasDaSilvaLSG lines 2030–2040), Thm. 8.6 places no compactness hypothesis on the submanifold. The text also gives no proof and refers the reader to its references [47, 58, 107]; Gotay [47] is named again at p. 53 (line 2156). The §4.8 target and `exists_diffeomorph_opens_of_isCoisotropicMap` add `CompactSpace Q`, but the locator (line 1125) notes only that the source treats two forms on one manifold. A reader therefore cannot tell that compactness is a choice made for the roadmap's proof route (uniform neighbourhoods) and not a hypothesis of the cited theorem. Nothing stated is false. Two repairs are possible: add "stated there without compactness and without proof" to the locator, or drop compactness from the target if the route can do without uniform neighbourhoods.

## C03 — §4.8 and the Downstream consumers attribute a use of the coisotropic kernel API to roadmaps that do not cite it

The last sentence of §4.8 (line 1129) and the Downstream consumers bullet at line 1176 say that HamiltonianReduction R3 and ConvexityToric Layer 4 use the kernel, leaf and quotient tangent API of §4.8. On main, ConvexityToric's README does not mention this roadmap at all. HamiltonianReduction cites it in three places: for the cotangent forms (its line 286), for the relative diagonal germ (line 73), and for the tubular fibre-homotopy of the former C4 (line 276). The last of these is the second half of the same bullet. A reader who looks for the consumer of §4.8's API finds none. The fix is to drop "ConvexityToric Layer 4" from both sentences and to replace R3's claimed use with what R3 actually cites, or else to add the citations in those roadmaps. For the same reason, the description's list of "the roadmaps that cite this one" should not include ConvexityToric.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 chart change (sampled) | M = ℝ, base chart change φ(q) = 2q | covector p ↦ p/2 at 2q; (p/2)(2v) = p(v); pushforward 2p gives 4p(v) | true; Check separates the wrong variant | none |
| Convention 4, §1.2 signs | T*ℝ; H = p; H = (q²+p²)/2 | ω = −d(p dq) = dq∧dp, ω(∂q,∂p) = 1; ι_X ω = dH gives q̇ = p, ṗ = −q | agrees with the oscillator Check of §3.0a | none |
| §1.4 restricted translation (sampled) | α = x dy on T*ℝ², U = {x > 0}; α = dy | p_y ↦ p_y + x; ω ↦ ω + dy∧dx = ω − π*dα; dy preserves ω; same on T*U | true | none |
| §2.0 polar package (sampled) | A = [[0,−2],[½,0]] | AAᵀ = diag(4,¼), P = diag(2,½), U = [[0,−1],[1,0]], UᵀPU = diag(½,2) = (AᵀA)^½; det P = det U = 1 | true; wrong left factor gives non-orthogonal [[0,−4],[¼,0]] | none |
| §2.0 equivariance, determinant one | A ↦ VAW; det A = 1 | VAW = (VPV*)(VUW); det P > 0, abs det U = 1 force det P = det U = 1 | true | none |
| §2.1 intersections, Killing form (sampled) | n = 1, 2; diag(1,−1), diag(2,½), 2I | pairwise intersections SO(2); each matrix meets exactly one condition; B = 4 tr (sl₂); 6 tr against sl₄'s 8 tr | true; pin has (2n+2) tr, characteristic ≠ 2 | none |
| §2.1 trace growth | P = diag(2,½) ∈ Sp(2,ℝ) | tr Pᵏ = 2ᵏ + 2⁻ᵏ → ∞, so P lies in no compact subgroup | argument sound | none |
| §2.3 tangent-image facts (sampled) | planes in ℝ⁴; point in ℝ²; figure-eight | ω(∂q₁,∂p₁) = 1; {p = 0} isotropic of dim 2; 0 ≤ 2 holds, 2 ≤ 0 fails; dim 1 = ½·2 | Checks true | none |
| §3.0 composition (sampled) | dimensions; {p=0}∘{p=0} and {p=0}∘{q=0} via T*ℝ | ½(d₁+d₂) + ½(d₂+d₃) − d₂ = ½(d₁+d₃); first: dim 1 against 0; second: one point | true | none |
| §3.0a generating function (headline, sampled) | free particle; oscillator; S = qQ; S = q sin Q on ℝ² | Q = q+tp; oscillator Q = q cos t + p sin t; λ − φ*λ = d(qp); q sin Q: no global graph | Lean asserts only a local branch: true | none |
| §3.1 chain dictionary (headline, sampled) | S = qQ, N = 1, 2, 4 | ψ = q² ↔ fixed point 0; A₂ = 2q₀q₁ ↔ φ² = −id; A₄ = (q₀+q₂)(q₁+q₃), a plane ↔ φ⁴ = id | bijection checked by matching covectors | none |
| §3.1 billiards (headline, sampled) | circle of radius R; N = 2, 3, 4 | ∂s∂tS = −sin((t−s)/2R)/2R < 0; β̃*λ − λ = dℓ; 8R > 4√2R; law ½ = ½; (0, π/2, π): 0 ≠ 1/√2 | circle meets every Lean hypothesis; true | none |
| §3.1 recurrence | x ↦ x + 1 on ℝ | Lebesgue measure infinite; points of (0, ½) never return | finiteness needed, and stated | none |
| §4.1 relative Poincaré | ℝ², Q the x-axis, η = dx∧dy | fibre scaling gives β = −y dx, dβ = dx∧dy, β = 0 on Q; x dy ≠ 0 on Q | true | none |
| §4.2 relative Moser (headline, sampled) | ω₁ = (1+y²) dx∧dy; Q = ∅ | φ = (x, g(y)), (1+g²)g′ = 1, φ*ω₁ = ω₀, g′(0) = 1; empty Q: U₀ = U₁ = ∅ | true; matches Thm. 7.4 | none |
| §4.3 first jet (sampled) | ω₁ = 2 dx∧dy, ω₀ = dx∧dy | both pullbacks to Q zero; φ*ω₁ = ω₀ forces det dφ = ½ ≠ 1 | full ambient equality needed, and stated | none |
| §4.4 point-germ Darboux (headline, sampled) | same pair; the route at q₀ | (x, y/2) fixes Q; after Witt, η(q₀) = 0, so ω_t is nondegenerate near q₀; Moser field vanishes on Q | true without compactness or a rank condition | none |
| §4.5 prescribed derivative (headline, sampled) | T²×ℝ², A = id ⊕ (−id); Q a point | (−1)² = 1, so A is symplectic; realized by (x,y) ↦ (x,−y); point case is Darboux with given differential | true | none |
| §4.6 symplectic neighbourhood (sampled) | Q = {q₂ = p₂ = 0} ⊂ ℝ⁴; Q a point | TQ^ω = span(∂q₂, ∂p₂), TQ ∩ TQ^ω = 0; for a point TQ^ω = T_pM | Checks true | none |
| §4.7 Weinstein (headline, sampled) | unit circle in ℝ² | dθ∧dp = r dr∧dθ for p = (1−r²)/2; (1/r) dx∧dy for p = 1−r; ∂r ↦ −dθ = ω(·,∂r) on TQ | sign consistent; Thm. 9.1 uses the opposite sign, also an isomorphism | none |
| §4.8 coisotropic (headline, sampled) | S³ ⊂ ℂ²; σ = 0; dimensions | kernel ℝ·iz, rank 1 = codimension; σ = 0 gives T*Q; codimensions equal the kernel rank, so dim M = dim N | true; compactness stricter than Thm. 8.6 | C02 |
| Downstream attribution (lines 1129, 1176) | ConvexityToric and HamiltonianReduction on main | ConvexityToric: no mention of this roadmap; HamiltonianReduction cites C1/C2 (line 286), C4 germ (73), C4 tube (276) | kernel-API use unsupported | C03 |
| Renumbered ids | READMEs on main citing this roadmap | 12 READMEs: C1 ×27, C2 ×15, C2.0 ×6, C2.1 ×6, C2.2 ×3, C3 ×1, C3.1 ×27, C4 ×13; README gives no mapping | citations break at merge | C01 |

- Source locators: all 20 README locators and the Lean docstring locators were read in CannasDaSilvaLSG (lines 601–659, 1089–1128, 1300–1360, 1361–1418, 1420, 1558, 1639, 1845, 1875, 1974, 2030, 2093, 2107, 4267). Theorem numbers, pages and hypotheses match, with the compactness exception of C02.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`), more than 40 in all. These include `TauCeti/Geometry/Symplectic/WittExtension.lean:212`, `TubularNeighborhood/Existence.lean:53`, `Cotangent/GeneratingFunction/MixedHessian.lean:78`, `Symplectic/MaximalCompact.lean:73,81`, `MaximalCompact.lean:106`, `Algebra/Lie/Symplectic/Killing.lean:160,293,311`, `Symplectic/Center.lean:112`, `Geometry/Lie/Symplectic/Cartan.lean:50,64`, `Lie/Subgroup/Embedded.lean:157`, `Lie/Subgroup/Unitary.lean:117`, `Liouville/Flow.lean:98`, `Liouville/Scaling.lean:81`, `Cotangent/Relation.lean:145`, `Cotangent/Conormal.lean:177,188`, `Manifold/Surface.lean:69`, and Mathlib `SymplecticGroup.lean:59` and `Ergodic/Conservative.lean:63,97,158,196`. No headline is proved at the pin: there is no smooth polar diffeomorphism, and the only Darboux theorem is local, on normed spaces.
- Cross-roadmap citations resolved on main: HeegaardFloer §4.1, §4.6h, §5.1; ComplexKahlerGeometry §6.3; SmoothBundlesConnections B1.2, B1.4, B2.1 (dual bundles constructed there) and Layers 2–5; DifferentialGeometry Layers 3, 4, 8 and item 5.4; GeometricTopology §1.5; LieGroups Layers 2, 7, 9; UniversalCovers Stages 1–2; ContactGeometry CG1 and CG3–CG5 (the open revision keeps CGk = Layer k); HamiltonianReduction R1 and R3; IntegrableSystems I5.2.
- Automatic checks: the worker's gate passed, and my own gate run reported every counter zero (OK). Dependency check output: `depcheck: 196 roadmaps, 2159 edges, 0 problem(s)`; no UPWARD or CYCLE line. ContactGeometry and this roadmap cite each other only section by section (CG1 → §2.2 → CG4–CG5), with no cycle.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with eight `declaration uses sorry` warnings (lines 103, 135, 164, 181, 199, 221, 258, 277). I ran `#check @` on all 11 declarations; each keeps every binder it needs. Nothing changed against main except docstrings and section comments. The one-tactic probe `first | rfl | (simp; done) | infer_instance | trivial` closes none of the eight theorems.
- Headlines: the four of the README summary plus §4.5 are all stated. The docstring names the five that cannot be stated at the pins (Kodaira–Thurston non-Kähler, §3.0 composition, the §3.1 billiard map theorems, §4.6, and existence in §4.8), each with its missing carrier.
- Overlap check: read ContactGeometry (open head and main), HamiltonianSystems (open head) and IntegrableSystems (main). Shared objects and their owners: the contact predicate is ContactGeometry CG1's, on Tau Ceti's carrier; the cosphere contact forms are Tau Ceti's declarations, with the application owned here in §2.2 and consumed by ContactGeometry §5.6; the conormal bundle is owned here in §2.2, and ContactGeometry builds unit conormals on it; the chain dictionary is owned here in §3.1 and instantiated by IntegrableSystems I5.2. Kodaira–Thurston appears in ComplexKahlerGeometry only as a Check. Nothing is owned twice.
- Source independence: 24 passages compared with 1 source, none shared beyond forced formulas (the tangent-line convexity condition, about 8 words). The largest share is CannasDaSilvaLSG, with 20 of 20 README locators. Contents compared with CannasDaSilvaLSG: independent. Layers 1–4 run in the order of Lectures 2, 3, 4–5 and 6–9, but each layer's scope is the roadmap's own (matrix groups, Kodaira–Thurston, cosphere bundles, composition of correspondences, the prescribed-derivative and symplectic neighbourhood theorems). The order is forced by the Needs lines: §3.0a needs §1.1–§1.2; §4.7 needs §1.2, §2.2, §4.5; §4.2 and §4.4 need §4.1.
- Research link: Layer 4 is Weinstein's Lagrangian neighbourhood theorem (Weinstein [104], cited by the source at p. 48) and Gotay's coisotropic embedding theory (Gotay [47], p. 53), which HeegaardFloer, FukayaTheory and TaubesGromov consume. §3.1's discrete action is the generating-function method that the source (p. 33) ties to Poincaré–Birkhoff and the Arnold conjecture. Rests on CannasDaSilvaLSG and the README's Downstream consumers.

## Not verifiable

- none: every locator was read in CannasDaSilvaLSG, and every open head consulted was read through the roadmap tool.

Automatic checks set aside as false positives: the declaration-change listing and the signature extraction read the docstring phrase "structure at the pins" (on main, "structure with") as a Lean declaration named `at` (or `with`); `Suggested.lean` declares no such name.

## Source issues

- **Misprint** in CannasDaSilvaLSG at §5.2, printed p. 32: the source equates the cyclic sum of f(x, y) = −|χ(x) − χ(y)| with the sum of the side lengths; it should be minus the perimeter; affects nothing.
- **Misprint** in CannasDaSilvaLSG at Prop. 6.8, printed p. 39: the statement starts from a closed ℓ-form but places its primitive in Ω^(d−1)(U), mixing the degree letters; it should read Ω^(ℓ−1)(U); affects nothing.

## For the human reviewers

- none
