# Review of HilbertModules (pull request #2625 at 9841b24)

**Verdict:** needs changes

**Summary.** One finding (P2) blocks acceptance. Two sentences outside the stated results are false in the empty or zero case, which Convention 1 says every statement is read in: the second Check of §5.11 and the torus sentence of the Layer 5 Examples. Each needs a one-clause repair. The headline theorems, the four `Suggested.lean` declarations (which elaborate with `sorry` as the only warning), every cross-roadmap citation and every library name check out. There are three small corrections (three Kaad–Lesch and Dixmier–Douady locators, a missing CStarAlgebras §2.6 entry in §7.2's *Needs:* line, and the description's claim about Downstream consumers) and one format note. The human reviewers have licence questions about three hosts, and the largest source could not be read.

## R01 (P2) — Two sentences are false for the empty space and the zero module, the degenerate cases Convention 1 says every statement covers

A reader who takes Convention 1 at its word ("every statement is read in that case too") will find two sentences that fail there.

1. The second Check of §5.11 (line 1032–1034) says that with value ℤ on the empty set the tuple complex of a cover "has the cohomology of a point, whatever the space". For X = ∅ the only cover has an empty index set, so every cochain group is a product over the empty set: the complex is 0 and its H⁰ is 0, not ℤ. The pinned supplier says so explicitly: the module docstring of `TauCeti/Topology/Sheaves/Cech/Colimit.lean` notes that on the empty space the Čech cohomology of every presheaf vanishes, even when `P(∅)` does not. The repair is "for every cover with a nonempty index set (every cover of a nonempty space)" in place of "whatever the space".
2. The Layer 5 Examples (line 1097–1099) say that `M_k` and `Γ_(a,b)` "exhaust the finitely generated projective `C(T²)`-modules". The zero module is finitely generated and projective, but it is no `M_k` (rank 1) and no `Γ_(a,b)` (b ≥ 1). §5.7 itself is careful here ("Every nonzero finitely generated projective right A-module… Include the zero module separately"). The repair is "exhaust the nonzero finitely generated projective `C(T²)`-modules".

## C01 — Three source locators point at the wrong statement

- In §7.2 (line 1249), "(Kaad–Lesch, §4)" is the locator for the state separation theorem, but that theorem is Kaad–Lesch §3, Theorem 3.1. §4 is the local–global principle, which uses Theorem 3.1. Write "(Kaad–Lesch, §3, Theorem 3.1)".
- In §5.3 (line 740–741), the construction from a family with merely dense evaluations by local uniform closure is Dixmier–Douady **Proposition 3**. Proposition 4 is the criterion that a `C(B)`-module complete for local uniform convergence is the module of continuous sections of a field. That criterion fits the later reconstruction sentence, which now cites §9 alone; §9 defines Hilbert fields and proves continuity of inner products by polarization.
- In the References (line 1650), "the appended erratum, Theorems 1.3 and 2.1, for the pure-state principle and separation" is not right. Erratum Theorem 1.3 restates the principle for all representations and all states. The pure-state form is the erratum's Conjecture 1.1, which the erratum credits to Pierrot, Théorème 1.18. Theorem 2.1 is the pure-state separation. A correct version would be "Theorem 2.1 for the pure-state separation; the pure-state principle is Pierrot, Théorème 1.18 (the erratum's Conjecture 1.1)".

## C02 — §7.2's route uses CStarAlgebras' pure-state separation from closed left ideals, but its *Needs:* line does not name it

The route in §7.2 follows the erratum's proof of Theorem 2.1. That proof chooses a pure state of `K_A(E)` that vanishes on the left ideal `K_A(L, E)` and is nonzero at a given element, citing Pedersen, Lemma 3.13.5. On main, CStarAlgebras §2.6 owns exactly this fact: every closed left ideal is cut out by the pure states whose left kernels contain it, with a separating pure state for each element outside. CStarAlgebras' own Downstream consumers entry says this roadmap uses "§2.6's left-ideal separation theorem in its H7". Add "CStarAlgebras §2.6 (pure-state separation from closed left ideals)" to the *Needs:* line of §7.2, line 1256–1257, and to the CStarAlgebras contract.

## C03 — The description says the new Downstream consumers section lists the roadmaps that cite this one, but it omits five that consume its layers

The section (line 1331–1353) lists ten roadmaps. On main, five more consume this roadmap's layers as suppliers:

- OperatorTheory/UnboundedOperators uses H6 (its README lines 58, 76, 90, and an anchor link that this head keeps);
- OperatorAlgebraDynamics uses H1 and H3 (lines 80, 303, 387);
- QuantumGroups uses H1–H3 (lines 185, 520);
- NoncompactQuantumSymmetry uses H3 and H5 (lines 503–505);
- FactorRigidity uses H1–H3 (lines 123, 997).

Either add these five to the section, or say in the description that it "lists the main roadmaps that consume this one".

## N01 — "CStarAlgebras C2.6" is not a label of CStarAlgebras, whose §2.6 is labelled C2.AnnHull

The citation appears in §§3.7, 5.1 and 5.8, in the Dependencies and in the contracts. A reader who searches that README for "C2.6" finds nothing. "CStarAlgebras §2.6 (C2.AnnHull)" would resolve.

## Verified sound

Previous findings: the previous review of this folder raised no finding, so there was nothing to check for repair.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2 completion (sample) | E = C_c(ℝ) over C₀(ℝ); E = 0 | completion is C₀(ℝ), ‖f‖² = sup\|f\|²; completion of 0 is 0 | true; RW locator unread |
| §1.3 essential action, x = y⟨y,y⟩ (sample) | A = E = C₀(ℝ), e_n = 1 on [−n,n]; f ≥ 0 | ‖f − fe_n‖ ≤ sup_{\|t\|>n}\|f\| → 0; y = f^{1/3}, y·y*y = f | true; BanachAlgebras §4.3 `cohen_hewitt` present |
| §1.6 H_A vs Banach ℓ² (sample) | A = K(ℓ²), a_n = p_n/√(n+1) | tail Σ_{n≥N} p_n/(n+1) has norm 1/(N+1) → 0; Σ‖a_n‖² = Σ1/(n+1) = ∞ | Check true |
| §1.7 H ⊗ A (sample) | H = ℓ², ℂⁿ, 0 | ⟨(ξ_n a),(η_n b)⟩ = Σ conj(ξ_n)η_n a*b = ⟨ξ,η⟩a*b; ℂⁿ ↦ Aⁿ; 0 ↦ 0 | true |
| §1.9 E/EJ (sample) | A = E = C[0,1], J = ker δ₀ | EJ = J, A/J = ℂ, ‖[f]‖ = \|f(0)\| = ‖⟨f,f⟩+J‖^{1/2} | true |
| §2.4 multipliers (sample) | M₂, a = E₁₂, b = E₁₁; A = C₀(ℝ) | θ_(a,b) = left mult by ab* = 0 vs a*b = E₂₁; id ↦ 1 ∈ C_b(ℝ)∖C₀(ℝ) | Checks true; RW 2.54 unread |
| §2.5 K_A(H ⊗ A) (sample) | ζ⊗c; H = ℂ; H = 0 | θ_(ξ⊗a,η⊗b)(ζ⊗c) = ⟨η,ζ⟩ξ⊗ab*c; H = ℂ gives K_A(A) ≅ A; H = 0 gives 0 ≅ 0 | true |
| §2.7 frames (sample) | p ∈ A projection; x₁ = 2 in ℂ; Parseval Gram | θ_(p,p)z = pz = z on pA; Gram 4, 4² = 16 ≠ 4; (p²)_ik = ⟨x_i,x_k⟩ | Checks true; Roe unread |
| §4.1 countable generation (sample) | A = K(H), H nonseparable; A = C₀(ℝ) | K(H) not σ-unital ⇒ not c.g.; e = (1+t²)⁻¹ strictly positive ⇒ C₀(ℝ) c.g. by {e} | true |
| §4.2 Kasparov (sample, headline) | E = Aⁿ; E = 0; A = K(H) nonsep. | shift ((a_i),(b_k)) ↦ (a₁…a_n,b₀,…) preserves ⟨,⟩, onto; summand A of H_A not c.g. ⇒ H_A not c.g. | true; RW 5.49 unread |
| §5.9 local Morita (sample) | Â Hausdorff | T₀ + induced topology ⇒ equal kernels give indistinguishable points ⇒ equal; kernel map bijective homeomorphism | true; RW 5.15 unread |
| §6.1 adjoint domain (sample) | A = C[0,1], ι: J → A, y = 1 | x ↦ x* bounded on J; no z ∈ J with x*z = x* ∀x ∈ J; dom(ι*) = J, not dense | Check true; KL Lemma 2.1 matches |
| §6.5 deficiency (sample) | D = −i d/dt on L²[0,1], H₀¹ | N₊: −if′ = if ⇒ f = e^{−t}; N₋: f = e^{t}; S*(u+Uu) = iu − iUu | true; Teschl unread |
| §7.1 localization (sample) | x⊗h, y⊗h′ | ⟨T⁰(x⊗h), y⊗h′⟩ = ⟨h, π(⟨x,T*y⟩)h′⟩ ⇒ (T*)^π ⊆ (T^π)* | true; KL Lemma 2.5 (line 365) |
| §7.3 local–global (sample, headline) | X = [0,1], Λ(s) = e^{i/s}, Λ(0) = 1 | reg Λ = (0,1], sing-supp = {0} = sing-supp_r, interior ∅ ⇒ selfadjoint, not regular; localization at 0 is D_min | consistent with KL Thm 4.2, Prop 6.3 |
| `adjointPair_exists_continuousLinearMaps` | E = 0; A = 0 (forces E = F = 0); A = ℂ | ⟨T(x+λx′) − Tx − λTx′, y⟩ = 0 ⇒ linear; closed graph via ⟨w,y⟩ = ⟨x,Sy⟩; `simp_all` leaves goal | true, not padding |
| `norm_adjoint_comp_self` | A = ℂ, T = diag(2,1); T = 0 | ‖T*T‖ = 4 = 2²; ‖Tx‖² ≤ ‖ST‖‖x‖², ‖S‖ ≤ ‖T‖; 0 = 0; `simp_all` leaves goal | true, not padding |
| `exists_parseval_frame_iff_finite_projective` | A = 0; A = ℂ, E = ℂ², E = ℓ² | A = 0 ⇒ E = 0, both sides true; e₁,e₂ frame and f.g.; ℓ²: neither; `simp` no progress | true |
| Brown–Green–Rieffel (headline) | M_n vs ℂ; K(H), H nonseparable | M_n ⊗ K ≅ K; K(H) ~ ℂ but K(H)⊗K = K(H⊗ℓ²) ≇ K | true; σ-unitality needed |
| Dixmier–Douady (headline) | X = point; X = S³ | Ȟ³(pt) = 0, all algebras K(H) ~ ℂ; Ȟ³(S³) = ℤ realized by bundle | consistent |
| Convention witness ⟨x, ya⟩ = ⟨x,y⟩a | `inner Aᵐᵒᵖ x (op a • y)` | `inner_op_smul_right`: op a * ⟪x,y⟫, unop gives ⟨x,y⟩a | agrees |
| §1.1 Gram Check | M₂, x = (E₁₁, E₁₂) | Gram [[E₁₁,E₁₂],[E₂₁,E₂₂]] = vv*, eigenvalue 2; transpose = flip, eigenvalue −1 | true |
| §5.5 Chern number | ∇_s = ∂_s − 2πikt | [∇_s,∇_t] = 2πik; iF/2π = −k ds∧dt; F/(2πi) gives +k | true |
| §5.7 det, tensor parameters | b-cycle; Γ_(1,2)⊗Γ_(1,3) | det = (−1)^{b−1}e^{2πiar}; gauge e^{−πi(b−1)s} removes sign; parameter 3+2 = 5 | true |
| R01(1): §5.11 Check | X = ∅ (empty cover); X = point | empty index set ⇒ complex 0, H⁰ = 0 ≠ ℤ; point ⇒ ℤ | false for X = ∅ |
| R01(2): Layer 5 Examples | zero C(T²)-module | rank 0; M_k rank 1, Γ_(a,b) rank b ≥ 1 | false for 0 |
| C01 locators | KL §3/§4; DD Prop 3/4; erratum 1.3 | Thm 3.1 at line 377 (§3); DD Prop 3 line 130, Prop 4 line 285; erratum Thm 1.3 = states (line 1559) | mislocated |
| C02 *Needs* | erratum proof | Pedersen 3.13.5 pure state (line 1612); CStarAlgebras §2.6 line 564–566 owns it | missing entry |

- Source locators checked against the text: Kaad–Lesch §2.3, Lemmas 2.1, 2.3, 2.5, Prop. 2.4, Thm 3.1, Prop. 4.1, Thm 4.2, Lemma 6.2, Props 6.3–6.4, Assumption 7.1, Thm 7.10, erratum Thms 1.3, 2.1 (13); Dixmier–Douady Def. 1, Props 3–4, §9 (4); Liu–Luo–Xu Thm 3.8, Rem. 3.11 (2); Hatcher Prop. 3.10, p. 86 (1).
- Library declarations opened at the pins: 42 Mathlib names, the three opposite-algebra instances (found by `inferInstance`) and 28 Tau Ceti names, all elaborated in one probe file outside the repository. They include `CStarModule.inner_mul_inner_swap_le` (Defs.lean 203), `norm_inner_le` (233), `norm_eq_csSup` (280), `inner_op_smul_right` (79), `WithCStarModule.inner_def` (Constructions.lean 92), `instCStarModuleComplex` (353), `LinearMap.continuous_of_isClosed_graph` (Banach.lean 538) and `LinearPMap.cayley` (Tau Ceti Cayley.lean 64). `cechRefinementNatTrans` was read in source (Refinement.lean 101) because its object file is not built. The Mathlib Hilbert-module folder holds only Defs, Constructions and Synonym. Tau Ceti has no `CStarModule` use, Gram matrix or right self-module at the pin, as the description says.
- Cross-roadmap citations resolved on main, all present: CStarAlgebras §§1.3, 1.4, 1.7, 2.2, 2.6, 2.7, 5.1, 5.4, 6.1–6.2, 7.1, 9.7; VonNeumannAlgebras V0, V4.Core, V4.Normality, V7.StandardAmplifications, V7.Dimension; TopologicalKTheory T1 items 1–5, T1.5a; CharacteristicClasses C1.2b, C1.6 and its normalization; AlgebraicTopology §4.5, Layer 6; SmoothBundlesConnections B1.3, B3.3, B6.0, B6.1, B6.2, B6.3; DifferentialGeometry 5.2; PDE §§1.1, 1.2, 1.6; BanachSpaceTheory B1; BanachAlgebras §4.3; SelfAdjointSpectralTheory Parts C–D; ComplexKahlerGeometry §2.5; NoncommutativeGeometry N7; HeisenbergImprimitivity §6.3. Every supplier is on main.
- Automatic checks: every check passed at this head.
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Change outside the folder: `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings only. `#check @` of all four declarations agrees with the README statements, and no binder is lost (completeness on the first and third theorems, `StarOrderedRing` on all three, `CStarAlgebra` for the frame theorem).
- One-tactic probes: `simp_all [IsAdjointPair]` fails on the first two theorems and `simp` makes no progress on the third, so none is padding. The headline audit is complete: the three statable Layer 2 headlines are stated, and the docstring names the multiplier identification, Kasparov stabilization, Brown–Green–Rieffel, Dixmier–Douady and the local–global principle with the carrier each lacks.
- PR text: 54 sections, each with a *Needs:* line; 35 Checks lists with 58 bullets; eleven roadmap contracts; and the relabelled citations, the unchanged Lean declarations and the corrected docstring reason all agree with the head, except the Downstream consumers sentence (C03).

Overlap check: read TracesOnCStarAlgebras (open, by vocabulary), OperatorAlgebraDynamics, CStarAlgebras and OperatorKTheory (main, by vocabulary); the list by results and headings is empty. The shared objects and their owners are these:
- CStarAlgebras' C1–C9 are owned by CStarAlgebras and consumed here; CStarAlgebras lists this roadmap as a consumer and owns no Hilbert-module object.
- Imprimitivity bimodules and induced Hilbert spaces are owned here and consumed by OperatorAlgebraDynamics H1 and H3.
- The standard module and Kasparov stabilization are owned here; OperatorKTheory owns only the graded variant (its line 951).
- TracesOnCStarAlgebras shares nothing (its matches are lower semicontinuous traces).
An object search of all open heads finds no other owner of Brown–Green–Rieffel, Dixmier–Douady, continuous trace, the unitary dual or Parseval frames.

Source independence: 11 passages compared with 4 sources (Kaad–Lesch: semiregular and regular definitions, Thm 4.2, Assumption 7.1, Lemma 6.2, erratum Thm 2.1; Dixmier–Douady Def. 1, Prop. 3; Liu–Luo–Xu Thm 3.8; Hatcher Prop. 3.10; plus the Layer 2 docstrings), none shared beyond forced formulas and hypothesis lists. The largest share is Raeburn–Williams, about 23 of about 48 locators. Its contents could not be read (paywalled text; the AMS contents pages returned 403), so the contents were not compared. The *Needs:* lines force the layer order (Layer 2 needs Layer 1, Layer 3 needs Layers 1–2, Layer 4 needs Layers 1–3, Layer 5 needs Layers 1–4). Layers 6–7 follow Kaad–Lesch, and Layer 5 also draws on Williams, Appendix C, and on Dixmier–Douady, and plans the torus modules.

Research link: Layer 7's sum criterion (Kaad–Lesch 2012, Theorem 7.10) is, by that paper's §7 introduction, the regularity input for the Kasparov product of unbounded modules. Layer 5 is the Dixmier–Douady classification (Dixmier–Douady 1963; Raeburn–Williams 1998). This rests on Kaad–Lesch line 1082–1083 and the README's references.

## Not verifiable

- Raeburn–Williams, *Morita Equivalence and Continuous-Trace C*-Algebras*: paywalled, not in the manifest. The sampled locators of §§1.2, 1.3, 2.4, 4.1, 4.2 and 5.9 were not read.
- Blackadar, *Operator Algebras*, and Williams, *Crossed Products of C*-Algebras*: paywalled; their locators were not read.
- Roe, *Lectures on K-Theory and Operator Algebras*, Prop. 10.2 (§2.7): the host bpb-us-e1.wpmucdn.com is in no licence class, so the service refused it.
- Teschl, *Mathematical Methods in Quantum Mechanics*, Thm 2.27 (§6.5): the service refused the mat.univie.ac.at/~gerald URL as not shown to be an author's page.
- Pierrot 2006, Théorème 1.18 (§7.3): the landing page on jolt.centre-mersenne.org is in no licence class. Its content is known only through the Kaad–Lesch erratum.

## Source issues

- none

## For the human reviewers

- Licence: the README links Roe's notes at bpb-us-e1.wpmucdn.com/sites.psu.edu (line 1638). The sources service could not classify this host as the author's page.
- Licence: the README links Teschl's book at www.mat.univie.ac.at/~gerald (line 1644). The service refused it because the URL does not name the author; a human can confirm that it is Teschl's own page.
- Not tested: Raeburn–Williams has the largest share of locators (about 23 of 48). Neither its text nor its table of contents could be read, so the wording and arrangement comparisons were not made against it.
