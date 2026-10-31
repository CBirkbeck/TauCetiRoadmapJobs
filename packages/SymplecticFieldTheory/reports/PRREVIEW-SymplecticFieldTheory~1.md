# Review of SymplecticFieldTheory (pull request #1054 at 28769f0)

**Verdict:** needs changes

Gate at this head: every check passed (`depcheck=0 build=0`). The elaboration of `TauCetiRoadmap/SymplecticFieldTheory/Suggested.lean` gives exactly three `sorry` warnings (lines 72, 80, 93). The pull request changes nothing outside the roadmap folder. One blocking finding (supplier order), two P3 notes.

## R01 (P2) — ImplicitAtlases and GromovWittenTheory are later in the merge order and their supply is invisible to the dependency check

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` lines 65–71 ("ImplicitAtlases, V0–V6 … supplies topological atlas data, orientation sheaves, relative virtual complexes") and 81–83 ("GromovWittenTheory supplies closed-curve comparison targets when S8 has no punctures"); consumed again at S4 (line 247 onward: "For every bounded contact tree type construct all of V1's thickenings … Apply V2–V6") and S7/S8 ("comparison to the closed-GW owner").

Claim: both roadmaps are suppliers of this one.

Witness: `board/merge-order/ORDER.txt` lists SymplecticFieldTheory at line 193, ImplicitAtlases at line 200 and GromovWittenTheory at line 284. The README has no `*Needs:*` line at all (count 0), so the dependency check records no supplier edge for this roadmap and passes vacuously:

```
depcheck: 204 roadmaps, 1407 edges, 0 problem(s)
```

On a scratch copy with one added line `*Needs:* ImplicitAtlases V1, GromovWittenTheory §1, HeegaardFloer F1.4, ContactGeometry CG1, MorseNovikov N1, DGAInfinity §1.` the same check reports

```
moved: SymplecticFieldTheory moved in the merge order from #192 to #283, right after its last supplier GromovWittenTheory (ImplicitAtlases also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 204 roadmaps, 1410 edges, 0 problem(s)
```

so the move creates no cycle (HeegaardFloer line 4134, HamiltonianFloerOperations line 22 and ImplicitAtlases lines 25 and 853 name SymplecticFieldTheory only as a downstream consumer). As the README stands, the roadmap would be merged above two of its suppliers.

Repair (tested on the scratch copy above): state every supplier at the target that uses it on a `*Needs:*` line, by roadmap name and section: ImplicitAtlases V1 at the S4 atlas construction, V2–V6 at the S4/S5 applications, GromovWittenTheory Layer 0–2 at the S7/S8 closed-sector comparison, and likewise ContactGeometry CG1–CG6 (S0/S1), HeegaardFloer F0, F1.1–F1.5, F2 (S2/S3), MorseNovikov N1 (S9), DGAInfinity Layers 0–1 and StablePeriodicCurved Layer 3 (S0), MorseTheory (S6). The check then emits the `moved:` line and the worker places the roadmap after GromovWittenTheory at submission.

## R02 (P3) — README not in TauCetiRoadmap form: no layer/target structure, no Checks, no locators at the claims, process narrative

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` throughout; counts at this head: `# Roadmap:` 0, `## Scope and ownership` 0, `## Conventions` 0, `## Exact supplier contracts` 0, `## Layer` 0, `### k.n` 0, `**Checks.**` 0, `### Examples` 0, `### Dependencies` 0, `## Downstream consumers` 0, `*Needs:*` 0.

Claim: the sections S0–S9 are the roadmap's layers.

Witness: no theorem in S0–S9 carries a locator; the only locators are the section ranges in `## References` (lines 735–755). For example the index formula (line 208) is stated without a citation although it is EGH Proposition 1.7.1 and Pardon (2.50) (pardon15 line 1642); the potential equation (line 364, "`DX(exp(F))=0`") is EGH Theorem 2.3.3 (egh00 line 2600); the derivation of the Maurer–Cartan identity from the p⁺-degree-zero part of the potential equation (lines 578–579) is Latschev §2.5.1 (latschev22 lines 455–463); the good/bad criterion (lines 101–102) is Pardon Definition 2.49 (pardon15 lines 1748–1753). The verification paragraph (lines 712–733) holds the Checks for the whole roadmap in one block instead of per definition. Process narrative: line 13 ("The definitive specification is this README"), line 87 ("No implementation or merger of a supplier proposal is required"), line 133 ("adopt the upstream implementation when available").

Repair: recast S0–S9 as `## Layer 0` … `## Layer 9` with `### k.n` subsections, put each claim's locator in parentheses at the claim (the four above and the rest of the sampled targets as listed under Verified sound), split the verification paragraph into `**Checks.**` lists under the definitions they test (orbit lines, A(V), the Weyl carrier, the kernel E_W, the twisted operators), add `### Examples`/`### Dependencies` per layer and `## Downstream consumers` (HamiltonianFloerOperations names this roadmap as the owner of contact/Reeb buildings), and delete the three process sentences; the statement of what `Suggested.lean` covers already lives in its module docstring.

## R03 (P3) — The ℤ→ℤ/2 pushforward of a grading is cited as an existing "proposal's fibre-sum construction"

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` lines 128–130 ("push its grading along ℤ→ℤ/2 by the same proposal's fibre-sum construction") and 132–133 ("Construct the missing scoped adapters here in that API shape; adopt the upstream implementation when available").

Claim: a Tau Ceti construction pushing an internal ℤ-grading forward along ℤ→ℤ/2 exists or is proposed under the name "fibre sum".

Witness: at the pinned Tau Ceti, `TauCeti/Algebra/Module/GradedModule/` and `TauCeti/RingTheory/GradedAlgebra/` contain no `ZMod 2`, no pushforward/comap of a grading and nothing named "fibre sum" (grep of both directories). "Fibre-sum construction" is neither a literature term nor defined in the README.

Repair: state the pushforward as a target of S0 in words ("for an internal ℤ-grading G of V, the parity grading whose even piece is the sum of the G.piece 2k and whose odd piece is the sum of the G.piece 2k+1; prove it is internal and that the signed swap relation for G is the signed swap relation for its parity grading"), and drop "proposal", "upstream implementation" and "when available".

## Verified sound

**Principles.** No route-specific shortcut (the contact construction is over ℚ for every closed cooriented contact manifold with nondegenerate orbits, as in Pardon); no re-planned roadmap (nobody on main or in the 433 open pull requests plans contact homology, SFT or a free supercommutative algebra: `roadmaps grep` for "contact homology", "symplectic field theory", "supercommutative", `SignedSym`, `signedSwapRel` returns only ContactGeometry line 266 and this roadmap; DGAInfinity Layer 0 (lines 263–291 on main) plans Koszul-signed multilinear maps and the braiding, not the free graded-commutative algebra); no copied passages; no algorithm; no sorry'd data, no `set_option`; the only import beyond `Mathlib` is `TauCeti.Algebra.Module.GradedModule.Internal`, which exists at the pin.

**Supplier citations resolved** (all on main unless noted): ContactGeometry CG1–CG6 at `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md` lines 59–242; HeegaardFloer F0 = §§2.1–2.9 (lines 1185–1751), F1.1–F1.5 = §§3.1–3.5 (lines 1818–1982), F1.4's `CZ(Ψ)=−μ_RS(graph Ψ,Δ)` at line 1968, F1.5's punctured weighted extension at line 2021, F2 = Layer 4; MorseNovikov N1 heading at line 75 (the link fragment matches); DGAInfinity Layers 0–1; StablePeriodicCurved Layer 3 parity-graded pairs (line 279); MorseTheory; ImplicitAtlases V0–V6 = Layers 0–6 at the head of #974 (its line 853 names this roadmap as a consumer); GromovWittenTheory Layers 0–3 at the head of #990. HamiltonianFloerOperations on main (line 22) records this roadmap as the owner of contact/Reeb buildings.

**Pinned declarations opened** (all present): `TauCeti.InternalGrading` with field `isInternal : DirectSum.IsInternal piece` (`TauCeti/Algebra/Module/GradedModule/Internal.lean` lines 85–90); `TauCeti.IsDGAlgebra` (`TauCeti/Algebra/Homology/AInfinity/Algebra/DG.lean`); `TauCeti.gradedTensorGrading` (`TauCeti/RingTheory/GradedAlgebra/TensorProduct.lean` line 71), `isInternal_gradedTensorGrading` (line 76), its graded-algebra instance (line 145); `TauCeti.isDGAlgebra_gradedTensorGrading` (`TauCeti/Algebra/Homology/DG/Algebra/TensorProduct.lean` line 164), `dgTensorLift` (line 245), `gradedTensorLift` (used line 249); `TauCeti.GradedAlgebra.quotientPiece` and `isInternal_quotientPiece` (`TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean` line 45, for a homogeneous ideal of a `Ring`); Mathlib `SymmetricAlgebra` (`Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean` line 50, unsigned), `GradedTensorProduct` (`Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean` line 73, Koszul-signed, any index with `Module ι (Additive ℤˣ)`), `Int.negOnePow` (`Mathlib/Algebra/Ring/NegOnePow.lean` line 28), `TensorAlgebra.gradedAlgebra` (ℕ-grading only). Mathlib and Tau Ceti have no contact structure, Reeb field, symplectization or punctured-curve carrier (grep of both trees), so the docstring's "not statable" list is right.

**Signatures.** All 7 elaborated types in the worker's signature file compared with the README's S0 statements: generality agrees (integer-graded lane, `InternalGrading ℚ V`, ℚ-linear maps); no binder lost.

**Sources read** (cache ids): pardon15 (arXiv 1508.03873v4), egh00 (math/0010059v1), behwz03 (math/0308183v3), latschev22 (2212.01814v1), hindsiegel24 (2410.19936v1), ishikawa18 (1807.09455v3). The seeded sample (S7.VacuumOperators, S8.NonexactRealization, S9.Admissibility, S9.QuantumMap, S9.RationalContactMap, S9.CompositionAndChoices) carries no locators; each was checked against the text it is drawn from:

- S7.VacuumOperators: Weyl relation `[p_γ,q_γ]=κ_γℏ`, left representation `p_γ=κ_γℏ∂/∂q_γ`, right representation `q_γ=κ_γℏ∂^←/∂p_γ`, `D_H=[H,−]`: egh00 lines 2151–2163, 2247–2249. Curvature `c_Y=H|_{p=0}=H_const`: egh00 lines 2082–2095 (p-free part counts constant/no-positive-end curves). The derived brackets `l_k=[…[Q,m_{f_1}],…,m_{f_k}](1)` and `l_1(f)=Q(f)−(−1)^{|f|}f c` follow from `Q`odd and `m_f` of degree |f| (computed below).
- S8.NonexactRealization: the raw boundary identity and Stokes argument from which the master equations follow: egh00 lines 2175–2190 (Theorem 2.2.2) and 2604–2615 (Theorem 2.3.3 with disconnected curves); the nonexact twisted functoriality and the no-positive-end Maurer–Cartan element: hindsiegel24 lines 1113–1128.
- S9.Admissibility: filtered ground ring, positive filtration degree of the no-positive part, completion before the exponential: latschev22 lines 401–425 and 445–449; the Novikov-type support condition (38) on nonexact potentials: egh00 lines 2522–2537.
- S9.QuantumMap: potential in `(q⁻,p⁺,ℏ)`, `D_W(G)=H⁻G−(−1)^{deg G}G H⁺`, `D_W e^F=0`: egh00 lines 2487–2490, 2572, 2600–2609; `Z_W(1)=exp(a_W)` and the Maurer–Cartan identity as the p⁺-degree-zero part of the potential equation: latschev22 lines 453–461 (Φ(1)=e^{f⁰}, D⁻e^{f⁰}=0).
- S9.RationalContactMap: `|p_γ|=2N−|q_γ|`, bracket of degree −2N, `{p_γ,q_η}=κ_γδ`: latschev22 lines 64–72; twisted Hamiltonian `h^a=h+{h,a}+½{{h,a},a}+…` with MC condition `h^a|_{p=0}=0`: lines 435–439; degree conventions `deg q=CZ+n−3`, `deg p=−CZ+n−3`, `deg ℏ=2(n−3)`, all terms of H of degree −1: egh00 lines 2034–2035, 2073, 2081.
- S9.CompositionAndChoices: pushforward of a Maurer–Cartan element `Φ(e^a)=e^{f_*(a)}` and the twisted morphism `Φ_a=Ψ_{−f_*(a)}∘Φ∘Ψ_a` with `Φ_a(1)=1`: latschev22 lines 471–494; associativity and the three-cobordism law: egh00 lines 3052–3054, 3102–3105 (Lemma 2.5.1, Proposition 2.5.2.4).

Other locators checked: Pardon's smaller compactification without trivial cylinders (pardon15 lines 25–34), the free supercommutative algebra on `o_γ` for good γ (line 140), `|γ|=CZ(γ)+n−3` (lines 457, 1734), vdim = μ − #(symplectization vertices) + dim s (line 1658), the symmetric monoidal functor (1.22) with disjoint union ↦ super tensor product (lines 350–357), §1.8 on stronger (DGA) homotopies and hypertight cylindrical contact homology (lines 484, 595–613); BEHWZ buildings of height k (behwz03 lines 1450–1493); Hind–Siegel §3 compactness, §4 transversality, §5 algebra (lines 201, 423, 633); Ishikawa's Kuranishi construction (ishikawa18 lines 9–23).

**Adversarial pass** (values computed on each side):

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `signedSwapRel`: x⊗y ~ (−1)^{pq} y⊗x | x=y odd (p=q=1); x,y even; p=0,q=5; p=−1,q=3 | x²~−x² ⇒ 2x²=0 ⇒ x²=0 over ℚ; sign +1; +1; (−1)^{−3}=−1 (Int.negOnePow) | correct, odd squares vanish | none |
| `signedSymPiece` | V=0; V=ℚx,\|x\|=1, piece 2; V=ℚx,\|x\|=0, piece 2; empty word | ℚ·1 in degree 0 only; x²=0 so piece 2 = 0; piece 2 = ℚx²≠0; 1∈piece 0 | agrees with README lines 715–720; unsigned `SymmetricAlgebra` gets the odd case wrong | none |
| `nonempty_gradedAlgebra_signedSymPiece` | one_mem, mul_mem, decomposition; V=0 | empty word gives 1; concatenation adds degrees; T(⊕V_p)=⊕ words, relation homogeneous ⇒ quotient graded (`isInternal_quotientPiece`) | true | none |
| `exists_unique_odd_extension` existence | relation compatibility with δx∈piece p+1 | d(xy)=δx·y+(−1)^p x·δy; d((−1)^{pq}yx)=(−1)^{pq}(δy·x+(−1)^q y·δx); supercommuting back gives equality iff \|δx\|≡p+1, \|δy\|≡q+1 | true with hδ | none |
| same, hδ dropped | V=ℚ³ all odd, δx=z, δy=δz=0 | d(xy)=zy, d(−yx)=yz=−zy ⇒ 2zy=0 but zy≠0 in Λ(ℚ³) | ∃! fails without hδ; hδ present | none (negative control worth a Check) |
| same, uniqueness | a=1∈piece 0; products of homogeneous generators | d1=d1+d1 ⇒ d1=0; induction on word length | determined | none |
| `odd_square_zero_iff_generators` | d²(ab) with a∈piece p | d²a·b+(−1)^{p+1}da·db+(−1)^p da·db+a·d²b = d²a·b+a·d²b | d² is an even derivation; zero on generators ⇒ zero | none |
| same, hdeg dropped | V=ℚx⊕ℚy, \|x\|=\|y\|=0, d=y∂_x (ordinary derivation) | d(dx)=dy=0, d(dy)=0, but d²(x²)=d(2xy)=2y²≠0 | iff fails without hdeg; hdeg present | none |
| one-tactic probes | `infer_instance`, `simp`, `⟨inferInstance⟩`, `simp [LinearMap.ext_iff]`, `aesop` on the three theorems | all fail (instance not found / no progress / unsolved goals) | not padding | none |
| degree table | n=1 (EGH Example 2.2.4), n=2, n=3 | \|ℏ\|=2(n−3) = −4, −2, 0; egh00 line 2260 gives −4 for S¹ | agrees | none |
| \|p\|=2(n−3)−\|q\|, bracket degree | {p_γ,q_γ}=κ_γ of degree 0 | \|p\|+\|q\| = 2(n−3) ⇒ bracket degree −2(n−3) | agrees with latschev22 line 69 | none |
| rational brackets degree −1 after regrading \|f\|−d | h of degree d−1, l_k with k inputs | ((d−1)+Σ\|f_i\|−kd)−d = Σ(\|f_i\|−d)−1 | degree −1 | none |
| \|b\|=d, \|a\|=0 | F of degree 0, F=ℏ^{−1}F_0+… | b=F_0\|_{p⁺=0} has degree 0+\|ℏ\| = d; a=ℏ^{−1}b has degree 0 | agrees | none |
| index formula (line 208) | trivial cylinder g=0,k±=1; plane g=0,k⁺=1,k⁻=0; Pardon's one-positive tree | 0+0+CZ−CZ=0; (n−3)+CZ⁺+2c₁; (n−3)(1−k⁻)+CZ⁺−ΣCZ⁻+2c₁ = pardon15 (2.50) | agrees | none |
| vdim subtraction | symplectization vertex | pardon15 (2.52): −1 per symplectization vertex; trivial cylinders absent from the model | README's "genuinely free translation" consistent | none |
| right vs left super derivative `∂R_p m=(−1)^{\|p\|(\|m\|−1)}∂L_p m` | m=p·m′, \|p\|=1,\|m\|=0; \|p\|=0 | m=(−1)^{\|p\|\|m′\|}m′p with \|m′\|=\|m\|−\|p\|; \|p\|(\|m\|−\|p\|)≡\|p\|(\|m\|−1): sign −1; +1 | agrees | none |
| weight w=N+length(I) on exp(F>0) | term ℏ^{−k}F_0^k, k p-factors | w ≥ −k+k = 0; N alone unbounded below | README line 374 ("a single global lower bound on N would exclude exp(F)") right | none |
| contraction preserves w | one Weyl contraction | +1 to N, −1 to p-length | preserved | none |
| genus law g_out=g₁+g₂+k−1 | k=1; k=2 two edges; self-loop | g₁+g₂; g₁+g₂+1; +1 genus and +1 ℏ | agrees (line 397) | none |
| identity kernel `exp(Σ q⁻p⁺/(κℏ))` | g=q⁺ with q⁺=κℏ∂^R_{p⁺}; kernel without ℏ^{−1} | κℏ·q⁻/(κℏ)=q⁻ ⇒ Z=id; without ℏ^{−1}: Z(g)(q⁻)=g(ℏq⁻) | README right; egh00 line 3115 omits ℏ^{−1} (see Source issues) | none |
| `Q⁻Z_W=Z_W Q⁺` from `H⁻E−EH⁺=0` | right ideal W⁺·p⁺ | (E←(a p⁺))\|_{p⁺=0}=0, so Z descends to the Fock space; H⁻(E←g)=((H⁻E)←g)=((E←H⁺)←g)=E←(H⁺g) | holds | none |
| `Z_W(1)=exp(a_W)`, `c^{(−,a)}=T_W(c⁺)` | p⁺=0 evaluation | exp(F)\|_{p⁺=0}=exp(F\|_{p⁺=0}); exp(−a)Q⁻(exp a)=exp(−a)Q⁻Z(1)=exp(−a)Z(Q⁺1)=T(c⁺) | holds; c⁺=0 ⇒ `Q⁻(exp a)=0` derived | none |
| `(Q^{(−,a)})²=0`, `T_W(1)=1` | conjugation | exp(−a)Q⁻Q⁻exp(a)=0; exp(−a)exp(a)=1 | holds | none |
| `l_1(f)=Q(f)−(−1)^{\|f\|}f c`, `l_1(c)=0` | f=c odd | [Q,m_f](1)=Q(f)−(−1)^{\|f\|}fQ(1); l_1(c)=Q²(1)+c²=0 since c odd in a commutative algebra | holds | none |
| `dL_T\|_Z(V_{Q⁺}(Z))=V_{Q^{(−,a)}}(L_T Z)` | odd formal ε, Z+εv | T(e^Z v)=e^{L_T Z}dL_T\|_Z(v) from T(e^{Z+εv}); apply to v=V_{Q⁺}(Z) and use Q^{(−,a)}T=TQ⁺ | holds | none |
| φ_W(q_γ⁺)=κ_γ∂_{p_γ⁺}(F_W)_0\|_{p⁺=0}, multiplicativity | one generator; two generators | T(q)=κℏ∂_pF\|_{p=0}, ℏ⁰ term κ∂_pF_0; T(q₁q₂)=κ₁κ₂ℏ²(∂₁∂₂F+∂₁F∂₂F): first term O(ℏ¹), second = φ(q₁)φ(q₂)+O(ℏ) | holds | none |
| `h^{(−,b)}=h⁻(q,p+κ∂_q b)` and MC `h^{(−,b)}\|_{p=0}=0` | D_b(p_γ)=κ_γ∂_{q_γ}b, D_b(q)=0 | exp(D_b) is the substitution automorphism; p⁺=0 part of h⁻\|_{L_f}=h⁺\|_{L_f} with h⁺ p-free-free gives h⁻(q,κ∂b)=0 | agrees with latschev22 lines 437–439, 459–461 | none |
| composition `T_21=T_2^{[a_1]}T_1`, source/target | expand | exp(−a_21)Z_2Z_1=exp(−a_21)Z_2 m_{e^{a_1}}·exp(−a_1)Z_1; T_2^{[a_1]}Q_1^{(a_1)}=exp(−a_21)Z_2Q_1 e^{a_1}=exp(−a_21)Q_2 e^{a_21}T_2^{[a_1]} | holds; `exp(a_21)=Z_2(exp a_1)` | none |
| gauge transport `ḋ_t=A_t d_t−d_t A_t ⇒ d_tU_t=U_td_0` | U̇=AU | d/dt(U^{−1}d_tU)=U^{−1}(ḋ−Ad+dA)U=0 | internally consistent (sign fixed by the sign of η) | none |
| nonexact regression (lines 725–729) | n=3 (d=0), κ=1, h⁻=θp₁p₂, h⁺=θ(p₁+t)p₂, f=t x₁⁻+Σq⁻p⁺ | d⁻(x_i)=∂_{p_i}h⁻\|_{p=0}=0; d⁺(x₂)=θ(p₁+t)\|_{p=0}=tθ; L_f: p₁⁻=t+p₁⁺, p₂⁻=p₂⁺, q⁺=q⁻ ⇒ h⁻\|_{L_f}=θ(t+p₁⁺)p₂⁺=h⁺\|_{L_f}; b=t x₁⁻, h^{(−,b)}=θ(p₁+t)p₂ ⇒ d^{(−,b)}(x₂)=tθ | regression correct; {h⁺,h⁺}=0 since h⁺ is q-free | none |
| S6 examples (lines 309–313) | da=bc, a odd, b,c even; da=1 | d²a=d(bc)=0; H=m_a: dH+Hd = x−a dx+a dx = x, homology 0; ε(da)=ε(1)=1≠0 | correct | none |
| S0 verification (lines 715–720) | \|x\|=0,\|y\|=1,\|z\|=2, x↦y,y↦z,z↦0; x↦y,y↦0 | d²x=dy=z≠0; d²=0 | correct | none |
| ellipsoid parity (line 317) | E(a₁,…,a_n) irrational, γ_i^k | CZ=(n−1)+2Σ_j⌊k a_i/a_j⌋ ≡ n−1; \|q\|=CZ+n−3≡2n−4 even; n=2,k=1: CZ=3, \|q\|=2 | all even ⇒ d=0 | none |
| good/bad (lines 101–102) | even cover γ^{2k} with #(σ(A_γ)∩(−1,0)) odd | pardon15 lines 1748–1753 | agrees | none |
| morphism direction and potential variables | W from Y⁺ to Y⁻, F(q⁻,p⁺,ℏ) | egh00 lines 2486–2490, 2547–2567 (left W⁻ on q⁻, right W⁺ on p⁺) | agrees | none |
| supplier order | positions in ORDER.txt | SFT 193 < IA 200 < GWT 284; citers of SFT are consumers only | upward as written | R01 |

**Ownership against open pull requests** was checked with `roadmaps grep` over the 433 open pull requests and main (index of 2026-10-31) for the objects above; no second owner of the orbit algebra, the Reeb-end compactification, the contact atlases, the Weyl/Fock carriers or the twisted receiving maps.

## Not verifiable

- None of the sampled targets carries a theorem or page locator, so "the theorem number, the page" could not be checked as such; each was matched to the passage of the cited text that supports it (listed above). R02 asks for the locators.
- The pinned Tau Ceti has no cylindrical-end or contact carrier, so the geometric statements of S1–S9 were checked on paper only.

## Source issues

- **Misprint** in egh00 at §2.5, proof of Proposition 2.5.2, printed page 69 (line 3115): the source says the trivial-cylinder element used in the composition identity (80) is the sum over orbits of κ_γ⁻¹p_γq_γ; it should be ℏ⁻¹ times that sum, since with the normalisation (78) the exponential of the displayed element sends g(q) to g(ℏq) rather than to g(q), and the rational formula (82) carries the same term at the ℏ⁻¹ level; affects nothing (the identity (80) is meant with the ℏ⁻¹).
