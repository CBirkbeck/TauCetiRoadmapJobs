# GATE-SheafTheoreticSmithTheory~1: answers to human review

One review comment (roed-math, 2026-11-06), one point. Its closing paragraph (moving the pull request to `awaiting-author`) is procedural and not a finding.

## H01 (roed-math) — applied

The point is correct: no roadmap states the loop/BD Grassmannian over an arbitrary separably closed field. The README now owns it. Old `TauCetiRoadmap/SheafTheoreticSmithTheory/README.md` line 89, "What GlobalShtukasAndFunctionFieldLanglands must provide (gap:grassmannian-arbitrary-geometric-field): …", is deleted. New §3.0, *The loop Grassmannian over an arbitrary field* (README lines 640–697), covers a split connected reductive group over any field: loop, positive-loop and jet groups; ind-projectivity of Gr_H (GL_n lattice charts, plus affineness of GL(V)/H); the L⁺H-orbit stratification with dimension ⟨2ρ,λ⟩, connected stabilizers, jet-level factorization and component parity; affine flags, Iwahori cells and Demazure resolutions; convolution Grassmannians; BD Grassmannians over A^J with diagonal/factorization isomorphisms and permutation equivariance; and semi-infinite orbits as κ-attractors and repellers. Over extensions of F_q it is identified with GlobalShtukasAndFunctionFieldLanglands §1.1 and GeometricSatakeAndFusion §0.29, and over ℂ with FormalConnectionsOpers §3A.5. The Needs lines that cited the gap now cite §3.0: §3.1 (line 705), §4.4, §5.1, §5.2, §6.1 and §6.2, together with the Layer 3–6 Dependencies.

Evidence that the geometry had no owner. Each candidate was checked at the head this brief gives, or the head `roadmaps show` returned.
- GlobalShtukasAndFunctionFieldLanglands (head 2379b34): §§1.1–1.3 work on a curve X over F_q (README lines 543–620). Its Scope line 28 credits this roadmap with the arbitrary-field extension, so as the review says, each roadmap handed the geometry to the other.
- EndoscopicTransferAndUnitaryTraceComparison §3.2 is over a finite field; its Conventions say "For the equal-characteristic geometry, k is finite".
- GeometricSatakeAndFusion §0.29 works with E=F_q((t)) and F_q-algebras.
- FormalConnectionsOpers §3A.5 works over ℂ, and its Layer 3 over a characteristic-zero field.
- GeometricSatakeAndFusionPartII asks GeometricSatakeAndFusion for "arbitrary-field fpqc algebraic Grassmannians" (gap:algebraic-loop-representability), and GeometricSatakeAndFusion does not state it either.

Why own it here rather than carry a hypothesis: the README rule "No gaps" requires a target, and Layer 3 needs F of characteristic 0 or ℓ≠p, which no finite-field or ℂ construction reaches.

## Other changes made with H01

- **Scope (line 14).** States what each existing owner covers: GlobalShtukas §§1.1–1.3 and GeometricSatakeAndFusion §0.29 over finite fields, EndoscopicTransfer §3.2 over a finite field, FormalConnectionsOpers §3A.5 over ℂ. It adds that §3.0 is the arbitrary-field construction, identified with theirs on their fields. The Scope paragraph (line 7), Summary and "How to read the build" mention §3.0.
- **Supplier contracts.**
  - GlobalShtukas (line 88) and GeometricSatakeAndFusion (line 92) are rewritten as comparison inputs.
  - New contract sections for FormalConnectionsOpers §3A.5 (comparison only), ArithmeticGaloisRepresentations §1.11 *Reductive quotients over fields and DVRs*, and RelativeFarguesFontaine §6.5 (Beauville–Laszlo).
  - Additions to existing contracts: ModularCurves Layer 0G (represented Grassmannian); SchemeAndStackFoundations §§1.1, 1.15–1.16 and 4.14; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.0a *weil-restriction-group-scheme* / *weil-restriction-smoothness-and-immersions* and RG2.4 *cartan-decomposition* / *iwasawa-decomposition* / *iwahori-bruhat-decomposition*, applied over F̄((t)), which satisfies RG2's ModelField hypotheses (perfect residue field).
  - Mathlib contract: `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`, line 66) is a functor of points only. The pins have no loop group or loop Grassmannian (searched Mathlib and Tau Ceti for affine/loop Grassmannian, loop group and ind-scheme).
- **§3.1** now says that its Grassmannian, Schubert models and fusion geometry are those of §3.0.
- **References.** Three new entries: Zhu17 (arXiv:1603.05593v2), PappasRapoport08 (arXiv:math/0607130v2) and Alper14 (arXiv:1005.2398v3). They are fetched through the sources service and are legal arXiv copies. The board manifest `packages/SheafTheoreticSmithTheory/sources.toml` has no entry for them (searched by arXiv id and author), and this job does not edit it. The worker needs to add the three keys. PappasRapoport08 was fetched under the provisional id `PR08`; the README uses `PappasRapoport08` because the gate's prnum check rejects `PR08` as a pull-request reference.

## Pattern search (other gap contracts in this README)

Five other gap contracts were checked for the same defect: an item the named supplier does not plan, or hands back to this roadmap.
- gap:witt-adic-uniform-operations → EtaleDualityAndPerverseSheaves
- gap:admissible-invariant-quotient-gluing → SchemeAndStackFoundations
- gap:finite-highest-weight-ideals → LanglandsParameterStacks
- gap:integral-highest-weight-orders → LanglandsParameterStacks
- gap:integral-tilting-lifts → LanglandsParameterStacks

`roadmaps grep` finds none of these ids outside this roadmap, and none of the suppliers credits this roadmap with the item. Each request lies inside its supplier's own scope: adic coefficient systems in EtaleDualityAndPerverseSheaves §§3.1–3.2, finite-group quotients in SchemeAndStackFoundations §§1.17/1.21, and highest-weight modules in LanglandsParameterStacks §4.1. They are ordinary pending requests in the form used on main (FlagVarieties → ReductiveGroups), so they are left unchanged. The Grassmannian request differed in two ways: it lay outside GlobalShtukas's finite-field scope, and GlobalShtukas assigns the item back to this roadmap.

## Overlaps and citations

No id this roadmap cites is dropped or redefined by an open pull request, and no open pull request changes this roadmap.

- `roadmaps overlaps`: no open pull request changes this roadmap, and no id this roadmap cites is dropped or defined only by an open revision. GlobalShtukas cites this roadmap as "§§ST.3 and ST.6". Layers 3 and 6 keep their numbers, and §§3.1–3.5 are not renumbered, because the new section is numbered 3.0 (as in HeegaardFloer §7.0 and ClassicalArithmeticCompletion §§4.0, 7.0 on main).
- With §3.0 in place, GlobalShtukas line 28 ("SheafTheoreticSmithTheory … over arbitrary separably closed geometric fields") now matches what this roadmap owns.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` over all 466 open heads in the index, by object: affine Grassmannian, loop Grassmannian, LG/L⁺G, ind-scheme, attractor, Beauville–Laszlo, Matsushima/Haboush, and W(F̄_p) coefficients.
- New suppliers, all earlier in the merge order: FormalConnectionsOpers, ArithmeticGaloisRepresentations and RelativeFarguesFontaine. They are open new-roadmap pull requests and are cited by section as they stand at their heads.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Gr_H represents the torsor functor on all F-algebras, including nonreduced ones | H=G_m, R=F[ε]/ε² | 1+εt⁻¹ has inverse 1−εt⁻¹. t⁻ⁿ(1+εt⁻¹)∈R[[t]]ˣ forces n=0 mod ε, and then the t⁻¹-coefficient ε≠0, so it fails. This gives an R-point ≠ the base point with the same reduction. | Gr_(G_m) ≠ constant ℤ; the reduced ind-scheme is ℤ | Check added |
| GL_n lattice chart is the t-stable part of the Grassmannian of a rank-2nN module | n=1, N=1 | t⁻¹R[[t]]/tR[[t]] has basis t⁻¹, 1, with t: t⁻¹↦1↦0. The t-stable F-subspaces are 0, F·1 and everything, i.e. the lattices t⁻¹F[[t]], F[[t]], tF[[t]], which are the three points ℤ∩[−1,1] | consistent | — |
| GL(V)/H affine for H split connected reductive; Gr_H→Gr_GL(V) a closed immersion | H=T⊂GL₂; H=B⊂GL₂ (negative); H=1; H=GL(V) | GL₂/T = P¹×P¹∖Δ, affine. GL₂/B = P¹, not affine. Gr_B→Gr_GL₂ is bijective on F̄-points, but S_ν is open-closed in (Gr_B)_red and not closed in Gr. GL(V)/1 = GL(V), affine; GL(V)/GL(V) = point | matches Alper14 Cor 9.7.7 (reductive ⇔ affine) | Check (non-example B) added |
| dim Gr^λ = ⟨2ρ,λ⟩ | G_m (ρ=0); GL₂ at (0,0), (1,0), (1,−1), (2,0), (2,−1) | 0; 0, 1, 2, 2, 3 | consistent with P¹ for (1,0) and the quadric cone for (1,−1) | Check added |
| Parity of dimensions constant on components | GL₂ components det-degree 0 and 1; PGL₂ | degree 0: dims 0, 2; degree 1: dims 1, 3. PGL₂: (1,0) odd (dim 1), (1,−1) even (dim 2) | consistent | Check added |
| Gr^≤λ = union of Gr^μ, μ≤λ; not smooth in general | GL₂, λ=(1,−1) | Gr^≤λ = Gr^λ ⊔ {L₀}, a 2-dimensional quadric cone singular at L₀ | "Schubert varieties smooth" and "closure = orbit" are refuted | Check added |
| The L⁺H action on Gr^≤λ factors through LⁿH, with n depending on λ | GL₂, λ=(1,0) and (1,−1) | (1,0): n=1. (1,−1): 1+tE₁₂ sends t⁻¹e₂ to t⁻¹e₂+e₁ ∉ tF[[t]]e₁⊕t⁻¹F[[t]]e₂, while (1+t²X)L′ ⊂ L′+tXL₀ ⊂ L′ for every tL₀⊂L′⊂t⁻¹L₀ | n=1 fails, n=2 holds for (1,−1) | Check added |
| Connected stabilizers | G_m; GL₂ at (1,0) | L⁺G_m; the preimage of a parabolic under L⁺GL₂→GL₂ | connected | — |
| Iwahori orbits are affine spaces of dimension ℓ(w) indexed by W̃; Fl_H→Gr_H has fibre H/B | GL₂ fibre over L₀; G_m | GL₂: P¹ = {pt}⊔A¹, dimensions ℓ(1)=0 and ℓ(s₁)=1. G_m: W̃=ℤ, all lengths 0, Fl=Gr | consistent | Check added |
| Demazure variety: smooth projective of dimension r, birational onto the Schubert variety, an isomorphism over the cell | w=s (r=1); w=s₁s₀ (r=2) | D(s)=P¹→P¹ isomorphism; D(s₁s₀) is a P¹-bundle over P¹ of dimension 2 | consistent. Source setting is algebraically closed; descent from F̄ is stated in the text | Text says how the statement is transported |
| m: Gr^≤λ×̃Gr^≤μ → Gr^≤(λ+μ) is onto | G_m (a,b); GL₂ (1,0)⋆(1,0); GL₂ (1,0)⋆(0,−1) | t^a⋆t^b = t^(a+b). Over (1,1) the fibre is P¹, over (2,0) a point, with dimension 2=2. For (1,0)⋆(0,−1), dimension 1+1=2=⟨2ρ,(1,−1)⟩ and L₀ is in the image (L₂=L₀) | onto, not finite | Check added |
| BD diagonal fibre of the closure lies in Gr^≤(λ+μ); disjoint product only off the diagonal | G_m legs (1,1) and (1,−1); GL₂ λ=μ=(1,0) | G_m: 2 and 0. GL₂: limits lie in Gr^(2,0)⊔Gr^(1,1) = Gr^≤(2,0) | consistent | Check added |
| S_ν = κ-attractor of t^ν; closures; S_ν∩Gr^≤μ≠∅ ⇒ t^ν∈Gr^≤μ | GL₂, B upper triangular, λ=(1,0), κ=2ρ∨=diag(s,s⁻¹); G_m | S_(1,0)∩P¹ is the line of F(e₂+ae₁), dimension 1 = ⟨ρ,(1,0)+(1,0)⟩. S_(0,1)∩P¹ is Fe₁, dimension 0 = ⟨ρ,(1,0)+(0,1)⟩. [a:b]↦[s²a:b]→[0:1]=t^(1,0) for b≠0. The closure of S_(1,0) contains S_(0,1), since (1,0)−(0,1)=α∨. G_m: S_ν={t^ν} | consistent with §6.2's Checks (antidominant intersection is one point, dimension 0). With the opposite Borel the roles swap | Check added (pins the direction) |
| Product compatibility for Hᵖ (used by §5.1) | H=G_m, p=3 | reduced Gr = ℤ³, rotation-fixed points (ν,ν,ν) | consistent with the §5.1 Check | — |
| Comparison with the F_q models | F_q ⊂ F_q(s) (imperfect F) | A reduced scheme over perfect F_q stays reduced over F_q(s); for (1,0), P¹_(F_q)⊗F = P¹_F | consistent | — |
| Field generality (any field; consumers use separably closed F) | F separably closed, imperfect, char ℓ≠p | RG2.4 needs a perfect residue field, so the route works over F̄((t)) and descends using the F-rational t^ν. Over separably closed F every connected reductive group is split | consistent | One sentence added on F's generality and splitness |

Context: §3.0 is README-only; no Lean declaration is added or changed. Unused hypotheses: none found. Vacuity: not applicable, since §3.0 consists of constructions and their properties.

## Lean signatures

`Suggested.lean` is unchanged at this commit. No new headline: §3.0 is a construction target and not statable at the pins, which have no loop group or ind-scheme carrier; the docstring already lists the affine-Grassmannian categories among the missing carriers. The six elaborated types supplied with this job (fixedSubring, cyclicTransfer, cyclicNorm, transferIdeal, algebra_tate_diagonal, tate_character_extension) were compared with README §§8.1–8.2. Each agrees: same carriers, the hypotheses p prime and σᵖ=1, and for the extension theorem S ≤ fixedSubring, norms and transfers in S, κ a perfect field of characteristic p, and χ killing transfers. No section binder is dropped. No new `#check` was run because the file did not change.

## Build and gate

The roadmap builds and passes both the gate and the direction check.

- `lake build TauCetiRoadmap.SheafTheoreticSmithTheory.Suggested`: Build completed successfully (8954 jobs). The only warnings are the two expected "declaration uses `sorry`" at Suggested.lean:61 and :73.
- Gate, after commit 94ca8ae: `gate SheafTheoreticSmithTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Commit: `SheafTheoreticSmithTheory: review repairs (own loop Grassmannian over arbitrary fields as §3.0, drop GlobalShtukas gap)`. Not pushed.
