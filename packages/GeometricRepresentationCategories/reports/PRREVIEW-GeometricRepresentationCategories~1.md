# Review of GeometricRepresentationCategories (pull request #2579 at d953859)

**Verdict:** needs changes

**Summary.** Two findings block acceptance. First, the coordinate character equation `χ_(σ·p) = χp ∘ aσ⁻¹` of §3.3 is a target here and is also proved in AffineLieAlgebras A8.3 on main, so it has two owners. Second, the Summary's descent headline says that opers and local systems have equivalent groupoids of complex points, which is false as written: the equivalence is between `IsomOp` and the local systems. The rest of the mathematics checks out. All 28 Checks are true, every supplier section cited exists with the content claimed, and every cited library name resolves at the pins. There are four small corrections and three format notes, none blocking, and nothing is left for a human to decide.

## R01 (P2) — The coordinate character equation of §3.3 is a target here and also a target of AffineLieAlgebras A8.3, so it has two owners

Two implementers would prove the same theorem. The ownership list (line 909) claims "the coordinate character equation" for this roadmap. Yet the supplier's own scope gives AffineLieAlgebras "the exact Feigin–Frenkel, coordinate and Poisson normalizations (A8)", and so does this README's "Owned elsewhere" paragraph (lines 954–958).

§3.3 (lines 396–400) asks: "Prove the coordinate character equation `χ_(σ·p) = χp ∘ aσ⁻¹`, so that restriction of scalars along `aσ⁻¹` is a functor `Ccrit(p) → Ccrit(σ·p)`". It then asks to prove that for `φ(t) = at` the mode `S_n` maps to `a^n S_n` while `L_n(p^φ) = a^(−n) L_n(p)`. AffineLieAlgebras A8.3 on main (`TauCetiRoadmap/AffineLieAlgebras/README.md`, lines 1121–1123) already asks to "prove `eval_(σp) = eval_p ∘ a_σ⁻¹`" and that module pullback along `a_σ⁻¹` carries the fibre at `p` to the fibre at `σp`. Once `χp` is written as `eval_p` through the Feigin–Frenkel isomorphism, this is the same equation. Its Check at line 1144 is the `φ = at` rescaling. Both texts are unchanged at the open revision of AffineLieAlgebras.

Smallest change: in §3.3, consume A8.3's character equation and its fibre statement instead of proving them; A8.3 is already on the *Needs:* line. Keep the `φ = at` computation as the Check it already is, and drop "the coordinate character equation" from the ownership sentence at line 909.

## R02 (P2) — The Summary says opers and local systems have equivalent groupoids of complex points; as written this is false

This sentence states a headline in the overview, the paragraph a reader takes at face value. Line 23 reads: "Since opers and local systems on the punctured disc have equivalent groupoids of complex points, a coherent lift along the groupoid of opers and isomorphisms of their underlying local systems descends to local systems".

The complex points of the ind-scheme `Op_(G∨)(D×)` form a set (FormalConnectionsOpers §5.2), so its groupoid is discrete. The trivial `PGL₂`-local system has automorphism group `PGL₂(ℂ)`, and the distinct opers `q = 0` and `q = 1` have isomorphic local systems (the Checks of §4.4). No discrete groupoid is equivalent to that one. What §5.1 proves is that `IsomOp`, whose arrows are isomorphisms of the underlying local systems, is equivalent to the groupoid of local systems.

Repair: "Since the groupoid of opers and isomorphisms of their underlying local systems is equivalent, on complex points, to the groupoid of local systems on the punctured disc, a coherent lift along it descends to local systems, uniquely up to pseudonatural equivalence."

## C01 — FormalConnectionsOpers cites this roadmap as "R3–R5" and "R5", ids this revision drops without saying where they went

FormalConnectionsOpers cites "GeometricRepresentationCategories R3–R5" and "R5's relative differentiation question" at lines 155, 2671, 2786 and 2795 on main, and its open revision does the same. The README now has Layers 1–5 and no R-ids, so these citations no longer resolve. One sentence would fix this, for example in "How to read the build": "Layers 1–5 are the parts numbered R1–R5 in other roadmaps' citations, in the same order, and R5.1–R5.3 are §§5.1–5.3."

## C02 — The fixed-cell targets of §2.3 follow by applying Tau Ceti lemmas, and §3.5 asks for the second one again

§2.3 (lines 316–326) asks for two proofs:
- that the unit and associator of the rank-one action are the restrictions of `ModuleCat.restrictScalarsId'App` and `ModuleCat.restrictScalarsComp'App`;
- that the action recovered from its pseudofunctor equals the action.

These are `MonoidHom.discreteCentralCharacterMonoidalLeftAction_unit`, `MonoidHom.discreteCentralCharacterMonoidalLeftAction_assoc` and `MonoidalLeftAction.monoidalLeftAction_pseudofunctor` applied to A8.3's homomorphism, as the stated route itself says. §3.5 (line 443) asks for the same round trip again.

Similarly, §3.1 asks to prove that A5.4's comparison "preserves kernels, cokernels and arbitrary direct sums" (line 361). Every equivalence of categories does that.

As targets these ask nothing beyond instantiation. You could mark them as Checks of the rank-one instance (or write "follows from"), and state the round trip once.

## C03 — Frenkel–Gaitsgory §20.1 defines actions of a group scheme; the action by the group of points used in §1.1 is Frenkel §1.3.3, p. 25

Line 126 attributes the unit and associativity constraints to Frenkel–Gaitsgory, §20.1, pp. 120–121. There they are isomorphisms of functors `C → QCoh_H ⊗ C` for an affine group scheme `H` (FrenkelGaitsgory2006 lines 5883–5909), and `G((t))` is not affine.

§1.1 uses a different datum, for the group of complex points: functors `F_g` with `F_1` the identity and isomorphisms `F_gh ≅ F_g ∘ F_h` satisfying the cocycle identity. That datum is Frenkel, §1.3.3, p. 25 (Frenkel2007 lines 1284–1297). I would cite that and keep §20.1 as the algebraic version.

## C04 — Lemma 1.3.1 on p. 26 is stated for `𝔤((t))`; its extension to `ĝκ`, which §3.5 uses, is on p. 29

§3.5 (line 439) and the References (line 1119) cite Frenkel, §1.3.4, Lemma 1.3.1, pp. 26–27 for finitely generated critical-level modules. The lemma (Frenkel2007 line 1349) is about smooth modules over the loop algebra. The remark that it remains valid for `ĝκ` is in §1.3.6, p. 29 (Frenkel2007 line 1437). Add "and §1.3.6, p. 29". Keep the page numbers in any case, because the book uses the number 1.3.1 for two different lemmas (see Source issues).

## N01 — Line 1140 cites an unmerged Mathlib pull request and says §5.1 "follows its interfaces". §5.1 uses Tau Ceti's `Pseudofunctor.precomp`, `Pseudofunctor.precompNatIso` and `Pseudofunctor.mapNatIso`, and the pinned Mathlib has no `eval` or `evaluation` for pseudofunctors. I would drop the item or call it a design reference only.

## N02 — Johnson–Yau is cited without a chapter or page locator (line 127 and the References).

## N03 — In the module docstring of `Suggested.lean`, line 31 ends "and its coordinate automorphisms are;". It would read better as "as are its coordinate automorphisms (`TauCeti.CurrentAlgebra.coordinateCompletedEnvelopingAut`);".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 actions ↔ pseudofunctors; Check | `(ℤ/2)²`, `c = (−1)^(b a′)` | `c((0,1),(1,0)) = −1`, `c((1,0),(0,1)) = 1`; bilinear ⇒ cocycle; coboundaries symmetric ⇒ not equivalent to trivial | true | C03 (locator) |
| §1.2 abelian restriction; Check | `ℂ[x]`, `x = λ` | Mathlib instance needs zero, kernels, cokernels, finite products (Abelian/Subcategory.lean:60); Jordan block `x − λ ≠ 0` ⇒ not extension-closed | true | none |
| §1.3 objectwise invariance; Check | trivial `K`, `(ℤ/2)²` line | definition `∃ N > 0, ∀ g ∈ K N, T_g X ≅ X` (Congruence.lean:51); `b(g)b(h)/b(gh)` symmetric, `c` not | true | none |
| §2.1 twist order; Checks | `g: x↦2x`, `h: x↦x+1` on `ℂ_λ` | `T_h ℂ_λ = ℂ_(λ−1)`; `T_gT_h = T_(gh) = ℂ_((λ−1)/2)`; `T_(hg) = ℂ_(λ/2−1)`; along `a h`: `ℂ_(λ+1)` | true | none |
| §2.2 fibres and twists; Checks | `ℂ[y]`, `χ(y)=1`, `a: y↦y+1`; `ℂ[[x]]` | twist lands at `y↦0`, wrong direction `y↦2`; `x^M ≠ 0` in `A/x^N` for `N > M` | true | none |
| §2.3 rank-one cells | TauCeti signatures | `actionLeftTensorIso g h = restrictScalarsComp' (a g)⁻¹ (a h)⁻¹ (a(gh))⁻¹` at the pin | true; holds by library | C02 |
| §3.1 fibres; Checks | `sl₂` vacuum, `q = 0, 1` | `S_(−2)|0⟩ = f₋₁e₋₁|0⟩ + ½h₋₂|0⟩ + ¼h₋₁²|0⟩` from A8.3's `S_n` and `[e₋₁,f₋₁] = h₋₂`; `S_0|0⟩ = 0`; `S_(−2) ↦ q_0 = 0, 1` | true | C02 (§3.1 sentence) |
| §3.2 loop action | A8.3, Frenkel p. 308 | centre fixed pointwise (A8.3; Frenkel2007 lines 12815–12818) | true | none |
| §3.3 coordinates; Checks | `φ=2t`, `ψ=t+t²`; `φ=at` | `2t+4t²` vs `2t+2t²`; `L_n(p^φ)=a^(−n)L_n(p)` via `u=at`; `χp(aσ⁻¹S_n)=a^(−n)L_n(p)`; `aσ` gives `a^n` | true; duplicated in A8.3 | R01 |
| §3.4 semidirect family; Check | `h=diag(t,t⁻¹)`, `φ=at` | `aσa_haσ⁻¹(e_n)=a^(−n)a^(n+2)e_(n+2)=a²e_(n+2)`; `a_haσ(e_n)=a^n e_(n+2)`; `(h,σ)(k,τ) ↦ a_haσa_kaτ` | true | none |
| §3.5 congruence, `Q_M`; Checks | `g ∈ G[[t]]`, `diag(t,t⁻¹)`, `Q_1(sl₂)` | `Res κ(g⁻¹dg,x)=0` for `x ∈ t^M𝔤[[t]]`; `f_M ↦ f_(M−2)`; `ad h_0(1)=0` vs `h_0·1 ≠ 0` | true | C02, C04 |
| §4.1 lift packages; Check | `Γ = Π`, `H` trivial | `E_g = e_p⁻¹ ⋙ F(g,1) ⋙ e_q` matches Normalized.lean docstring; Conj. 10.3.10 p. 335 has `E_Id = Id` plus cocycle | true | none |
| §4.2 biequivalence; Check | `Γ = ∅`; `Γ,H` trivial; `Mat` vs `fdVect` | both sides a point; lift 2-cells unique by full faithfulness of `e′`; skeletal ≠ isomorphic, but equivalent | consistent | none |
| §4.3 linear refinement; Check | conjugation on `Vect_ℂ` | `F(if) = −iF(f) ≠ iF(f)` for `f ≠ 0` | true | none |
| §4.4 conjecture; Checks | `PGL₂`, `q = 0, 1` | both regular, trivial local systems; `Aut = PGL₂(ℂ)`; Frenkel p. 335 notes the dual group acting | true | none |
| §4.5 cocycle obstruction; Checks | `ℤ/2`, `b(s)=i` | cocycle identity on all 8 triples; `b(s)²/b(1)·c(s,s) = (−1)(−1) = 1` | true | none |
| §5.1 descent; Check | `d` with `A = 0`, `q = 0` | DS representatives `∂+p₋₁+v` have `A ≠ 0`; `∂+p₋₁` is gauge-trivial; Conj. 10.1.1 and (10.1-3) on p. 310 | true | none |
| §5.2 θ, `Ext¹`; Checks | `z_ℏ+ℏb_ℏ`; `ℂ[x]`, `d/dx`; `sl₃` | `δ` shifts by `[b,a]`; `[[λ,1],[0,λ]]`; depths `2, 1`; `4 ≥ 4`, `5 < 6`; `sl₂`: `S_(2N−1) ∈ I_N` matches A8.1 indexing | true | none |
| §5.3 relative data; Checks | `c=1`; flow product; `ℂ[ε]` | `(1+ε)(v+εu)=(u+v,v)`; `(1+ηY)(1+εX)(1−ηY)(1−εX)=1−εη[X,Y]`; `b(γγ′)=b(γ)+a_γb(γ′)` | true | none |
| Headline: action family (§§3.2–3.4) | statability at the pins | no loop-group action on `CompletedEnveloping`; no Feigin–Frenkel, opers or `IsomOp` in Tau Ceti | not statable; docstring says so | none |
| Headline: biequivalence (§4.2) | statability at the pins | Mathlib has the scoped `Bicategory (Pseudofunctor B C)` but no biequivalence; Tau Ceti: "morphisms between them are not treated" | not statable; docstring says so | none |
| Headline: descent (§5.1) | Summary wording | `Op(D×)(ℂ)` discrete; `Aut(trivial PGL₂ system) = PGL₂(ℂ)` | Summary false; §5.1 correct | R02 |
| Headline: θ (§5.2) | FG Lemma 7.4.1, Theorem 7.4.2, (7.2) | Jacobi in `A_ℏ` gives `[δ_z,δ_w] = δ_({z,w})` modulo inner derivations; anchor `δ_z(w) = {z,w}` | true | none |

- Source locators checked against the text: all 19 in-text locators and the reference list (Frenkel2007 §§1.3.3–1.3.6 pp. 19–29, §10.1 pp. 307–311, §10.3.7 pp. 334–335; FrenkelGaitsgory2006 §0.5 pp. 8–9, §4.1 p. 37, §5.1 pp. 47–48, §7.4 pp. 54–55, §§20.1–20.2 pp. 120–122). Page numbers were read from the running heads.
- Library: 220 backticked names of the README were `#check`ed at the pins in one elaborated probe (Tau Ceti modules built first); all resolve. Opened: Tau Ceti `Congruence.lean:51`, `Twist.lean:89`, `Completion.lean:133,161,297`, `CompletedCoordinateAction.lean:100`, `ResidueCocycle.lean:14–36`, `Normalized.lean` docstring, `Hom.lean:317`, `Coinduction.lean:256`, `EquivariantGroupoidLift/Basic.lean:420`. Mathlib: `Abelian/Subcategory.lean:60`, `Adjunction/Limits.lean:118,227`, `FunctorBicategory/Pseudo.lean:86`.
- Cross-roadmap citations resolved on main and at the open revision of both suppliers: AffineLieAlgebras A2.2–A2.4, A3.1–A3.2, A4.1–A4.2, A5.1–A5.4, A6.3, A8.1, A8.3; FormalConnectionsOpers §§1.2, 3.1, 3.4, 5.1, 5.2, 6.1, 7.1–7.2, 8.1, 8.2.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file has no declarations, so there is no padding and no signature to compare; its docstring names each of the five headlines as not statable, and the reasons check out at the pins.
- Ownership against open pull requests: searched by object (critical-level categories, categorical lifts, `IsomOp`, normalized transport, outer derivations) over every open head and main; no other owner was found besides the two suppliers.

Overlap check: read AffineLieAlgebras (main and its open revision) and FormalConnectionsOpers (main and its open revision); the list of roadmaps closest by results is empty. Shared objects: the coordinate character equation (owner AffineLieAlgebras A8.3, R01); opers, `IsomOp`, `K_N` and the gauge groupoid (owner FormalConnectionsOpers, consumed here); the completion, loop and coordinate lifts, Feigin–Frenkel and the deformation family (owner AffineLieAlgebras, consumed here).

Source independence: 26 passages compared with 2 sources (every locator above, the Summary's account of the Frenkel–Gaitsgory proposal, §4.1's transport shape, §3.5's weak equivariance, §5.2's θ paragraph, the Suggested.lean docstring), plus a 7-word overlap scan of the whole README against both texts. The longest shared runs are titles and the standard phrase "functions on the space of G∨-opers on the punctured disc". Largest share: Frenkel2007, 12 of 19 locators. Contents compared with Frenkel2007: independent. No layer maps onto a run of its chapters, and the layer order is the one the *Needs:* lines force (§3.1 needs §§2.1–2.2, §4.4 needs §3.2, §5.1 needs §§4.1 and 4.4).

Research link: the roadmap makes precise the setting of Frenkel–Gaitsgory's local geometric Langlands conjecture (Frenkel–Gaitsgory 2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007). Its §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2), which they use for Ext computations at the critical level. This rests on the README and both sources read.

## Not verifiable

- Johnson–Yau, *2-Dimensional Categories*: cited without a locator, so there was nothing to check; not opened.
- The Zulip discussion and the Mathlib pull request in the References: not opened (design references, not cited for any statement).
- The printed Cambridge edition of Frenkel's book was not compared with the author's copy; page numbers were checked against the running heads of the author's copy.

## Source issues

- **Misprint** in Frenkel2007 at §1.3.4, Lemma 1.3.1, p. 26: the lemma that a finitely generated smooth `𝔤((t))`-module is integrable over some `t^N 𝔤[[t]]` reuses the number 1.3.1 of the lemma on p. 19 (smooth integrable representations are trivial); it should be numbered distinctly; affects nothing.

## For the human reviewers

- none
