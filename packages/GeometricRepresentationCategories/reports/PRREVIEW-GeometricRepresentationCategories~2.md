# Review of GeometricRepresentationCategories (pull request #2579 at 4ae6385)

**Verdict:** accepted

**Summary.** Accepted: no finding blocks. Both earlier findings are repaired. The coordinate character equation is now consumed from AffineLieAlgebras A8.3. The descent headline now states the equivalence between `IsomOp` and the groupoid of local systems. The earlier small corrections and format notes are repaired too. The sampled locators, the 28 Checks and the supplier citations hold at the pins. One small correction remains: §3.4 asks to prove cells that the pinned family pseudofunctor already supplies. There are also two format notes, none blocking, and nothing is left for a human to decide.

## C01 — §3.4 asks to prove the covariance isomorphism and the product and unit coherence, but these are cells of the pinned pseudofunctor the family is built as

As targets, these ask an implementer for nothing once the family is constructed. §3.4 (lines 433–434) says "Prove the covariance isomorphism `T_σ ∘ T_h ≅ T_(βσ h) ∘ T_σ`, the product and unit coherence". The family is `TauCeti.discreteCentralCharacterFamily` (Tau Ceti `Algebra/Category/ModuleCat/CentralCharacter/ActionCategory.lean:107`). At the pin it is a `Pseudofunctor` out of `LocallyDiscrete (ActionCategory G X)`, and its only inputs are a homomorphism `G →* (A ≃ₐ[R] A)` and the equation `χ (g • x) = χ x ∘ (a g)⁻¹` on the centre.

In `H ⋊ S`, `(1, σ)(h, 1) = (βσ h, σ) = (βσ h, 1)(1, σ)`. So the arrow `p → σ·p` labelled `(βσ h, σ)` factors as `(h, 1)` followed by `(1, σ)`, and also as `(1, σ)` followed by `(βσ h, 1)`. The covariance isomorphism is therefore the composite of two `mapComp` cells, and the product and unit coherence are the pseudofunctor axioms.

Three things remain to prove: that `(h, σ) ↦ a_h ∘ aσ` is a homomorphism (by A4.2's conjugacy); the character equation (by A8.3, with `a_h` fixing `Z`); and that the restriction to the arrows `(h, 1)` is the action of §3.2, which the pin does not supply. You could write the first two cells as consequences ("are then the `mapComp` and `mapId` cells of the family"), as §2.3 now does for the rank-one cells.

## N01 — Convention 9 and the Tau Ceti contract say that names in `CategoryTheory` drop that prefix, but the `MonoidalLeftAction` names live in `CategoryTheory.MonoidalCategory`

This covers 17 names, among them the class itself, `MonoidalLeftAction.pseudofunctor` and `MonoidalLeftAction.curriedActionMop`. They are declared in `CategoryTheory.MonoidalCategory` (Mathlib `CategoryTheory/Monoidal/Action/Basic.lean:42`; Tau Ceti `CategoryTheory/Monoidal/Action/Pseudofunctor.lean:58`), so a reader who restores only `CategoryTheory.` finds nothing. Name that namespace in Convention 9 (line 99) and at line 1012.

## N02 — In §1.2 (line 173), "an action of `D` by exact functors" means an action on `D`; `D` is the category acted on.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Earlier R01: §3.3 character equation | A8.3 on main and at the open revision | §3.3 now "is A8.3's `eval_(σp) = eval_p ∘ a_σ⁻¹`"; scope (line 970) assigns it to AffineLieAlgebras; A8.3 lines 1121–1123 | repaired | none |
| Earlier R02: descent Summary (lines 23–25) | `Op(D×)(ℂ)` discrete; `Aut(trivial PGL₂ system)` | Summary now states the `IsomOp ≃ Loc` equivalence; `Aut = PGL₂(ℂ)` lives in `IsomOp` | repaired | none |
| Earlier C01–C04, N01–N03 | text at lines 55–56, 322–332, 366–368, 457–458, 126–132, 452–453, 1160–1162; Lean 30–32 | R-label map present; instantiations stated as consequences; §1.3.3 p. 25 and §1.3.6 p. 29 cited; JY locators added | all repaired | none |
| §1.1 Frenkel §1.3.3 (new) | Frenkel2007 lines 1284–1297 | source: `F_1` identity, `F_gh → F_g ∘ F_h`, cocycle; README: same, plus unit iso | true | none |
| §1.1 Johnson–Yau (new) | JohnsonYau2021 lines 5332, 5392, 6020, 6091, 6592, 12209 | Def. 4.1.2 p. 103–104 (pseudofunctor bullet p. 104); 4.2.1 p. 117–118; 4.4.1 p. 126–127; Thm 8.4.1 p. 238 | true | none |
| §1.2 abelian restriction; Check | `ℂ[x]`, `x = λ`, Jordan block | closed under kernels, cokernels, finite products; `[[λ,1],[0,λ]]` has `x − λ ≠ 0` | true | N02 (wording) |
| §1.3 congruence predicate; Check | `#print TauCeti.congruenceInvariant`; `(ℤ/2)²` | `∃ N, 0 < N ∧ ∀ g ∈ K N, Nonempty (g ⊙ X ≅ X)`; `c((0,1),(1,0)) = −1 ≠ 1 = c((1,0),(0,1))` | true | none |
| §2.1 twist order; Checks | `g: x↦2x`, `h: x↦x+1` on `ℂ_λ` | `T_h: λ−1`; `T_gT_h = T_(gh): (λ−1)/2`; `hg = 2x+2`, `T_(hg): λ/2−1`; along `a h`: `λ+1` | true | none |
| §2.2 fibres; Checks | `ℂ[y]`, `χ(y)=1`, `a: y↦y+1`; `ℂ[[x]]` | twist lands in `y↦0`, along `a` in `y↦2`; `x^M·(1,1,…) ≠ 0` at `N > M` | true | none |
| §2.3 rank-one cells | lemmas at `CentralCharacter/Action.lean:119,129` | unit = `restrictScalarsId'App (a 1)⁻¹`; assoc = `restrictScalarsComp'App (a g)⁻¹ (a h)⁻¹ (a(gh))⁻¹`, by `rfl` | true; stated as consequences | none |
| §3.1 fibres; Checks | `sl₂` vacuum with A8.3's `S_n`; `q = 0, 1` | `S_(−2)|0⟩ = f₋₁e₋₁|0⟩ + ½h₋₂|0⟩ + ¼h₋₁²|0⟩` via `[e₋₁,f₋₁] = h₋₂`; `S_0|0⟩ = 0`; `q_0 = 0, 1` | true | none |
| §3.2 loop action (revised) | `leftLinearιOfLE` signature; definition of the fibre action | fibre action is `inferInstance` from the full-subcategory restriction, so `ιOfLE` equivariance applies with `Ccrit(p) ≤ Ccrit` | true | none |
| §3.3 coordinates; Checks | `φ=2t, ψ=t+t²`; `φ=at` | `2t+4t²` vs `2t+2t²`; `L_n(p^φ) = a^(−n)L_n(p)` (sub `u=at`); `aσ(L_n) = L_n∘σ⁻¹ = a^n L_n`, matching `aσ(S_n)` | true | none |
| §3.4 semidirect family; Check | `h = diag(t,t⁻¹)`, `φ = at`; Mathlib product law | `aσ a_h aσ⁻¹(e_n) = a² e_(n+2) = a_(σh)(e_n)`; `(1,σ)(h,1) = (βσh,σ) = (βσh,1)(1,σ)` | true; covariance is mapComp | C01 |
| §3.5 congruence, `Q_M`; Checks | Frenkel p. 26 L. 1.3.1, p. 29; `diag(t,t⁻¹)`; `Q_1` | `f_M ↦ f_(M−2)`; `ad h_0(1) = 0` vs `h_0·1 ≠ 0`; `c_g(a_g⁻¹(x)u) = x c_g(u)` | true | none |
| §4.1 lift packages; Check | `Γ = Π`, `H = 1` | `E_g = e_q ∘ F(g,1) ∘ e_p⁻¹`; Conj. 10.3.10 p. 335: `E_Id = Id` plus cocycle | true | none |
| §4.3 linearity; Check | conjugation on `Vect_ℂ` | `F(if) = −iF(f) ≠ iF(f)` for `f ≠ 0` | true | none |
| §4.4 conjecture; Checks | `PGL₂`, `q = 0, 1`; Frenkel pp. 311, 335 | both regular, trivial systems; `Stab(d) = PGL₂(ℂ)`; Conj. 10.1.2 p. 311 is the per-arrow statement | true | none |
| §4.5 cocycle; Checks | `ℤ/2` with `b(s)=i`; `(ℤ/2)²` | `(s,s,s)`: `−1 = −1`; `c(s,s)·b(s)²/b(1) = (−1)(−1) = 1`; bicharacter asymmetric | true | none |
| §5.1 descent; Check | `d` vs `∂ + p₋₁`; FCO §6.1 | DS form has `p₋₁ ≠ 0`; `exp(tf)` gauges `∂+f` to `d`; Conj. 10.1.1 and (10.1-3) p. 310 | true | none |
| §5.2 θ and `Ext¹`; Checks | `ℂ[x]`, `d/dx`; `sl₃` `S_1[4]`, `S_2[5]` | `E_δ`: Jordan block; depths 2, 1; `4 ≥ 4`, `5 < 6`; `(u,v)↦(u+bv,v)` intertwines `δ`, `δ+ad_b` | true | none |
| §5.3 relative data; Checks | `c = 1`; flow product; `ℂ[ε]` | `(1+ε)(v+εu) = (u+v, v)`; product `= 1 − εη[X,Y]`; `a(v+εu) = av + ε(au+δ(a)v)` | true | none |
| Headline: family over `H ⋊ S` (§§3.2–3.4) | statability | no loop action on `CompletedEnveloping`, no Feigin–Frenkel or opers at the pin (grep) | not statable; docstring says so | none |
| Headline: biequivalence (§4.2) | statability; skeletal Check | no biequivalence in either library; `Normalized.lean:43` treats no morphisms; `Mat` vs `fdVect`: equivalent, not isomorphic | not statable; docstring says so | none |
| Headline: descent (§5.1) | statability; Summary text | `IsomOp`, gauge groupoid absent at the pin; Summary matches §5.1 | not statable; docstring says so | none |
| Headline: θ and `Ext¹` (§5.2) | FG Lemma 7.4.1, Thm 7.4.2, (7.2) | `[δ_z,δ_w] ≡ δ_({z,w})` mod inner; `[D,fD′] = D(f)D′ + f[D,D′]`; FG (7.2) functoriality = README naturality | not statable; true | none |

- Source locators checked against the text: 22 in-text locators (Frenkel2007 14, FrenkelGaitsgory2006 7, JohnsonYau2021 1) and the reference list, with page numbers read from running heads (Frenkel2007 pp. 25–29, 308–311, 334–335; FrenkelGaitsgory2006 pp. 8–9, 37, 47–48, 54–55, 120–122; JohnsonYau2021 printed pp. 103–104, 117–118, 126–127, 238).
- Library: all 244 backticked names of the README `#check`ed in one elaborated probe at the pins (77 Tau Ceti modules imported). All resolve, the 17 `MonoidalLeftAction` names under `CategoryTheory.MonoidalCategory`. Opened: Tau Ceti `CentralCharacter/Action.lean:85–144`, `CentralCharacter/ActionCategory.lean:107`, `Current/CompletedCoordinateAction.lean:100`, `Current/ResidueCocycle.lean:14–36`, `EquivariantGroupoidLift/Normalized.lean:43,72`; Mathlib `Monoidal/Action/Basic.lean:42`.
- Cross-roadmap citations resolved on main and at the open revision of both suppliers: AffineLieAlgebras A2.2, A2.3, A2.4, A3.1, A3.2, A4.1, A4.2, A5.1–A5.4, A6.3, A8.1, A8.3; FormalConnectionsOpers §§1.2, 3.1, 3.4, 5.1, 5.2, 6.1, 7.1, 7.2, 8.1, 8.2. Suppliers unchanged from main.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. No change outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file has no declarations, so there is no padding to probe and no signature to compare. Its docstring names each headline as not statable, and the reasons hold at the pins.
- Pull-request description read against the head: every sentence checked agrees with it. The 28 Checks were counted. The R-label map is present, the old file's `set_option` (line 62) and its Mathlib sub-imports are confirmed, and the STATUS.md declarations are confirmed absent at the pin.
- Ownership against open pull requests: searched by object (`EquivariantGroupoidLift`, `IsomOp`, categorical lift, critical level, Feigin–Frenkel, normalized transport, `Ccrit`, weak equivariance, outer derivations, central-character fibres) over every open head and main. The only other owners are the two suppliers; the other hits use the phrases in unrelated senses.

Overlap check: read AffineLieAlgebras and FormalConnectionsOpers on main and at their open revision; the list of roadmaps closest by results is empty. Shared objects and owners: the coordinate character equation, completion, loop and coordinate lifts, Feigin–Frenkel and the deformation family belong to AffineLieAlgebras (consumed here). Opers, `IsomOp`, `K_N`, the gauge groupoid and oper reduction belong to FormalConnectionsOpers (consumed here). Coherent actions, fibres, descent and the outer-derivation bridge belong to this roadmap, as AffineLieAlgebras' scope assigns.

Source independence: 29 passages compared with 3 sources: the 22 verified locators; the Summary's account of the proposal; §1.1's new action sentence; §3.2's fibre sentence; §3.5's weak equivariance; §4.1's transport shape; §5.2's θ paragraph; and the `Suggested.lean` docstring. A 7-word overlap scan of README and `Suggested.lean` against all three texts was also run. The longest shared runs are titles, a URL and standard phrases ("functions on the space of G∨-opers on the punctured disc", "action of the loop group"). Largest share: Frenkel2007, 14 of 22 locators. Contents compared with Frenkel2007: independent. The layers draw only on its §1.3 and §§10.1, 10.3.7 and map onto no run of its chapters, and the order is the one the *Needs:* lines force (§3.1 needs §§2.1–2.2, §4.4 needs §3.2, §5.1 needs §§4.1 and 4.4).

Research link: the roadmap makes precise the setting of Frenkel–Gaitsgory's local geometric Langlands proposal (2006, (0.8)–(0.9)) and Frenkel's Conjectures 10.1.2 and 10.3.10 (2007). §5.2 is Frenkel–Gaitsgory's Lemma 7.4.1, Theorem 7.4.2 and map (7.2), used there for critical-level Ext computations. This rests on the README and both sources read.

## Not verifiable

- The Zulip discussion and the Mathlib pull request in the References: not opened (design references, cited for no statement).
- The printed Cambridge edition of Frenkel's book and the Oxford edition of Johnson–Yau were not compared. Pages were checked against the running heads of the author's copy and of arXiv v3, which the README names as its numbering for Johnson–Yau.

## Source issues

- **Misprint** in Frenkel2007 at §1.3.4, Lemma 1.3.1, p. 26: the lemma on finitely generated smooth `𝔤((t))`-modules reuses the number 1.3.1 of the lemma on p. 19 (smooth integrable representations are trivial); it should carry its own number; affects nothing.

## For the human reviewers

- none
