<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13108#issuecomment-6896825174 -->
Red team round 2 pass b (claude) of 0d8cb33

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.1 defines the archimedean representations and asserts their classification without citing the roadmap that owns them

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:487` ("let `D⁺_{κ_v}` and `D⁻_{κ_v}` be the holomorphic and antiholomorphic discrete series of SL₂(ℝ) … it is the only unitary representation with nonzero degree-one (𝔤,K)-cohomology"), the `*Needs:*` of §4.1 (`:498`), the contract `:109–111`, Layer 4 Dependencies (`:559`).

   **Claim.** The discrete series D^±, the unitary principal series π_{κ_v,0} of SL₂(ℂ), and the statement that these exhaust the unitary representations with nonzero cohomology against the coefficient, are available from AutomorphicFormsOnReductiveGroups §1.1 and §§5.2–5.3.

   **Witness.** AutomorphicFormsOnReductiveGroups at its open head: §5.2 defines `HasCohomologyWith` only; §5.3 is the tempered range. Unitary induction is its §2.3, discrete series §2.4, D_k⁺ for k>1 is §6.8 at n=1, and exhaustion ("Every irreducible unitary representation with nonzero … cohomology arises in this way") is §5.4.

   **Repair.** The carrier of the headline cusp-form bound is built from objects with a named owner earlier in the merge order (line 61); cite it.

   - Replace the contract paragraph `### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups` by: "Consume §1.1 for relative Lie cochains; §2.3 for normalized unitary induction from a parabolic subgroup of a real reductive group, applied to the Borel subgroup of SL₂(ℂ) and the unitary character `z↦(z/|z|)^{κ_v}` of its torus to construct `π_{κ_v,0}`; §2.4 for discrete series and temperedness; §6.8 at n=1 (Sp₂=SL₂, integral weight k>1) for the holomorphic discrete series `D⁺_{κ_v}`, with `D⁻_{κ_v}` its complex conjugate; §5.2 for cohomology with specified coefficients; §5.3 for the tempered range, which for `Res_{F/ℚ}PGL₂` gives ℓ₀=r₂ and q₀=r₁+r₂; and §5.4 for the Vogan–Zuckerman modules, which exhaust the irreducible unitary representations with nonzero cohomology in a finite-dimensional algebraic coefficient. The SL₂ product calculation with Fu's weight convention is §4.1 here."
   - §4.1 `*Needs:*` and Layer 4 Dependencies: replace "AutomorphicFormsOnReductiveGroups §1.1; AutomorphicFormsOnReductiveGroups §§5.2–5.3" by "AutomorphicFormsOnReductiveGroups §1.1; AutomorphicFormsOnReductiveGroups §§2.3–2.4; AutomorphicFormsOnReductiveGroups §§5.2–5.4; AutomorphicFormsOnReductiveGroups §6.8".
   - §4.1 proof route: after "coefficient and tempered-range computations" insert "and the exhaustion statement of §5.4".

   Tested on the instances of §4.1: κ_v=2 at a real place is weight k=2>1, inside §6.8's range, and §5.4's own Check gives `D₂^±` with one-dimensional H¹; at F=ℚ(i), n=2: ℓ₀=1, q₀=1, so cohomology of π_{κ,0} in degrees 1 and 2, as `README.md:489` states. The supplier is at merge-order line 61, before this roadmap; no new upward edge.

2. **F02** (P2) gap:canonical-dimension-zero names an invariant its supplier does not define for the rational algebra, at a section before its prerequisites

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:74` ("For a nonzero finitely generated rational Iwasawa module in the semisimple congruence-kernel setting of aw13 §10.12 … canonical dimension zero is equivalent to finite dimension over the coefficient field. Supplier section: §F.1"); `design/plan.json` `gaps[1]`.

   **Claim.** The sentence says exactly what the supplier must add at §F.1.

   **Witness.** NoncommutativeAndEquivariantIwasawa §0.11 defines canonical dimension only "for nonzero finite modules over `R=O[[G]]` or `k[[G]]`" as gldim(R)−j_R(M); §F.1 says it "is defined in §0.11". With that definition the lattice W_k⁰ has value (3m+1)−3m=1, against the Check "For M=W_k, canonical dimension is 0".

   **Repair.** The `needs` is vague in the one word that carries it, takes its hypotheses by reference to a source section, and is assigned to a section that precedes the global dimension (§0.12) the invariant needs. Replace the `needs` sentence, in the README and in `design/plan.json` `gaps`, by:

   "For p odd, G a uniform pro-p group of dimension d (in particular a product of first congruence kernels of SL₂(ℤ_p)) and A=ℚ_p⊗ℤ_p[[G]], which is Auslander regular of global dimension d by §0.12, define the grade j_A(M) of a nonzero finitely generated left A-module M as the least i with `Ext^i_A(M,A)≠0` and its canonical dimension as d−j_A(M), and prove that the canonical dimension is 0 exactly when M is finite dimensional over ℚ_p."

   and "Supplier section: §F.1" by "Supplier section: §0.12" (`section` in the plan entry likewise). Add to the gap's Checks: "For the lattice W_k⁰ over ℤ_p[[G]], whose global dimension is 3m+1, the integral invariant of §0.11 is (3m+1)−3m=1; the rational value is 3m−3m=0. The two normalisations differ by one and the gap is the rational one." Tested on the README's two Checks: M=W_k gives j_A=3m, value 0, finite dimensional; M=A gives j_A=0, value 3m>0, infinite dimensional. aw13 Lemma 10.13 (aw13 lines 3623–3625, p. 77) states the equivalence for KG with d(M) in this normalisation.

3. **F03** (P3) §3.2 chooses p outside the "nonmaximal" primes, which does not put G inside the level

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/README.md:423` ("outside all primes where a product compact open subgroup contained in K_f is nonmaximal. There is a product level K′_f=G K^p⊂K_f") and `:425` ("with maximal factors outside finitely many primes. Replace its p factor by G").

   **Claim.** If the factor at every place above p is a maximal compact subgroup, the product of first congruence kernels G lies in it.

   **Witness.** At v|p split, K_v=g·SL₂(O_v)·g⁻¹ with g=diag(p²,1) is maximal compact; its upper-right entries lie in p²O_v. The element (1 p;0 1) of G has upper-right entry p∉p²O_v, so G⊄K_v.

   **Repair.** `:423`: replace "outside all primes where a product compact open subgroup contained in K_f is nonmaximal" by "outside the finitely many rational primes below a place v at which the factor K_v of a chosen product compact open subgroup ∏_vK_v⊆K_f differs from SL₂(O_v)". `:425`: replace "A compact open contains a product open with maximal factors outside finitely many primes" by "A compact open subgroup of the restricted product contains a product ∏_vK_v with K_v=SL₂(O_v) for all but finitely many v". Add the Check: "A maximal compact factor is not enough: diag(p²,1)·SL₂(ℤ_p)·diag(p²,1)⁻¹ does not contain (1 p;0 1)∈G." Tested on the witness: that place is now excluded, and at an admitted p every factor is SL₂(ℤ_p)⊇G. E7 (`README.md:758`, "outside the nonmaximal primes of a product subgroup") takes the same wording.

Round 2. All 14 findings of round 1 are repaired at this head and no repair introduced a false statement. The second full pass found three new defects (S01, S02 are P2; S03 is P3). No statement of `Suggested.lean` was found false.

## Round 1 findings at this head

| Round-1 finding | Status | Witness at 0d8cb33 |
|---|---|---|
| 1a/F01, 1b/F03 (LieHighestWeight Layer 0 cited for the sl₂ classification) | repaired | `README.md` has no occurrence of "LieHighestWeight"; `README.md:9` "its sl₂ highest-weight inputs are Tau Ceti's"; §0.3 imports irreducibility and self-duality from LocallyAnalyticDistributionsPartII §5.2 (i), whose proof sketch (its README line 741) uses `TauCeti.exists_isIrreducible_hasPrimitiveVectorWith`; §5.1 uses Tau Ceti `Module.Basis.symmetricPower` (TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:162). |
| 1a/F02, 1b/F01, 1b/F02 (three gaps and the action quotient owned by LocallyAnalyticDistributionsPartII) | repaired | `README.md:82–84` "Consume, for odd p: §0.2 … §2.1 … §3.4 … §3.7 … §3.10 … §4.1 … §4.14 … §5.2 (i) and (iii)". Each section exists at the sibling's head with the stated content (§3.4 flat on both sides; §3.7 exact; §3.10 natural isomorphism; §4.14 every λ∈ℤ_p^m; §5.2 (iii) End_K(W_k)). The README and `design/plan.json` `gaps` both list exactly `skew-rank` and `canonical-dimension-zero`. |
| 1a/F02 (4) (generic cyclic growth has no possible owner upstream) | repaired | New target §0.4 (`README.md:187–200`), checked in full below; the sibling's scope (its README line 28) lists Fu §3 under "Applications outside this roadmap". |
| 1a/F03 (aw14 §5.4 misread as n≥1) | repaired | `README.md:793` "§5.4 assumes `p^n 𝔤=(1/p)R⊗L_G` for an integer n≥0 … the first congruence kernel being the case n=0". Consistent with the sibling's §0.3 (ii) and §4.13. aw14 §4.6 is on p. 11 (aw14 line 473) and §5.4 on p. 16 (aw14 line 730). |
| 1a/F04, 1b/F04 (S_κ(K_f) undefined; unconditional 2^{r₁}) | repaired, with a new defect (S01) | `README.md:487` defines D^±, π_{κ_v,0}, π^ε_κ, m_ε and `S_κ(K_f)=Hom_{SL₂(F_∞)}(π^+_κ, L²_cusp(…)^{K_f})`; asserts Σ_ε m_ε, m_ε=m_{−ε}, and 2^{r₁} only under the unit hypothesis. The mathematics is correct (table below); the archimedean objects have an owner that is not cited: S01. |
| 1a/F05 (§3.3 only for admissible κ) | repaired | `README.md:438` "For every tuple t:Hom(F,ℂ)→ℕ, admissible or not, construct … `V_{t,E}=⊗_σ Sym^{t_σ}(E²)`"; Check at t=(3,0), dimension 4, −I acting by (−1)³. |
| 1a/F06, 1b/F05 (gap:skew-rank asks for what Mathlib has) | repaired | `README.md:44` and `:66`. At the pin: `IsNoetherianRing.strongRankCondition` (Mathlib/LinearAlgebra/InvariantBasisNumber.lean:250), `nonempty_oreSet_of_strongRankCondition` (Mathlib/LinearAlgebra/Dimension/Localization.lean:299, under `[Ring R] [IsDomain R]`), `ore_eq : oreDenom r s * r = oreNum r s * s` (OreSet.lean:61, the left condition), `instance : DivisionRing R[R⁰⁻¹]` (Ring.lean:211), `Module R[S⁻¹] X[S⁻¹]` (Ring.lean:88). No exactness or rank over the Ore localisation exists under Mathlib/RingTheory/OreLocalization or Mathlib/GroupTheory/OreLocalization. |
| 1a/F07 (strong-approximation contract too general) | repaired | `README.md:56` "connected, absolutely almost simple, simply connected group G over a number field F whose archimedean points G(F_∞) are noncompact … never to `Res_{F/ℚ}SL₂`"; the bullet *strong-approximation-sufficiency* exists in AdelicAlgebraicGroups §4.2 on main. |
| 1a/F08 (§5.6 of CompletedCohomologyPartII used but not contracted) | repaired | `README.md:23` and `:462` cite §5.7 only. |
| 1b/F06 (three locators) | repaired | E2 "Remark 5.8, pp. 20–21"; E3 "used in the proof of Theorem 5.1, p. 21 (statement p. 16)"; serre77 "page numbers are the printed pages of the Numdam scan". The repair's refusal of "third edition 1983" stands: the scan's front matter gives 1977. |

## Running table of declarations

`Suggested.lean` has no `variable`, `include` or section-level instance; every binder is in the declaration's own signature. Elaborated types are those of the worker's `signatures.md`, generated at this head; I ran no Lean.

| Declaration | Layer | Binders and instances | README statement | Agreement |
|---|---|---|---|---|
| `embeddingStdRep` (def, real body) | 3 (§3.1) | `{F : Type} [Field F] [NumberField F] (σ : F →+* ℂ) (Γ : Subgroup SL(2, 𝓞 F))` | `README.md:391` | same |
| `weightRep` (def, real body) | 3 (§3.1) | same F; `(Γ) (t : (F →+* ℂ) → ℕ) : Rep ℂ Γ` | `README.md:391` | same; t arbitrary on both sides |
| `finrank_groupCohomology_weightRep_le` | 4 (§4.2) | `(hF : ¬ IsTotallyReal F) (Γ) (𝔞) (h𝔞 : 𝔞 ≠ ⊥) (hΓ : ker ≤ Γ)`; ∃C ∀t ∀i, finite-dimensional ∧ ∀a | `README.md:511` | same quantifier order; C before t, i, a |
| `bianchi_groupCohomology_linear_growth` | 5 (§5.8) | `[IsTotallyComplex F] (hd : finrank ℚ F = 2)`, Γ, 𝔞, h𝔞, hΓ; ∃c C, 0<c, ∃n₀ ∀n≥n₀ ∀i∈{1,2} | `README.md:679` | same |

Headline theorems of the README: Fu's local homology theorem (§2.6); the sharp cusp-form bound with its ordinary-cohomology form (§4.2); two-sided Bianchi growth (§5.8). Stated: the ordinary-cohomology forms of §4.2 and §5.8. Named as not statable, with the missing carrier: §2.6, the S_κ form of §4.2 with §§4.3–4.4, and the cuspidal, interior and compact-support forms of §5.8. None of the three is statable at the pins. Padding probe: neither theorem follows from a library lemma; both definitions are used by both theorems; nothing to delete.

## The pass: statements, instances and values

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `embeddingStdRep` | F=ℚ(i), γ=(i 1;−1 0) | det=0+1=1; traces i and −i under the two embeddings | determined; same-embedding model gives E₁-trace i²=−1 against i·(−i)=1 |
| `weightRep` | t=0; ℚ(i), t=(1,0), (n,n); cubic field | dim 1 (three one-dimensional factors, not 0); −I acts by −1 and by (−1)^{2n}=1 | agrees with §3.1 |
| `finrank_groupCohomology_weightRep_le` | F=ℚ (excluded): k=10, 22; 𝔞=⊤; t=0; ℚ(i), t=(n,0); t=(1,0) with −I∈Γ; i=0; i>3d | 2·1+1=3, 2·2+1=5 against constant C; kernel=⊤ so Γ=SL₂(O_F); Betti≤C; a=1 forced, bound C(n+1); 0; dim H⁰≤1; 0 | true as typed; `hF` needed |
| `bianchi_groupCohomology_linear_growth` | ℚ(i), Γ=SL₂(ℤ[i]): n=0, 99, 100 | H¹(Γ,ℂ)=0, so n₀≥1; (5/24+1/8)·100=33.3; (5/24−1/8)·101=8.4 | true as typed; c≤1/12 from base change |
| §0.1 B_c | m=3, c_∅=2, c_{0,2}=3, x=(2,5,4); m=1; m=2, c_{1}=7, x=(1,t) | 2+3·2·4=26; constant; 7t | correct |
| §0.2 | proper s, j∉s, 1≤a≤x_j | ∏_{i∈s}x_i≤D/x_j≤D/a; diagonal degree ≤m−1 | correct |
| Casimir | highest weight k; k=0, 1 | ef·v=hv=kv; ½k²−k+2k=½k(k+2); 0, 3/2; reversed order ½−1=−½ | agrees with the sibling's Conventions item 6 |
| Untwisting Check | p=3, g=(1 3;0 1), h=(1 0;3 1) | gh=(10 3;3 1), hg=(1 3;3 10); g⁻¹(0,1)=(−3,1) | correct |
| §0.3 | k=(1,2); k=0; p=3, m=1, k=1 | 6, quotient 36; 1; e, f, ef=E₁₁, fe=E₂₂ span M₂(ℚ₃) | correct; ownership now cited |
| §0.4 statement | m=1: δ=h, e, e³, ∏_{j≤N}(h−j); δ=0; m=2, δ=Δ₁−Δ₂ | dim Hom=dim ker(δ on W_k): ≤1, 1, min(3,k+1)≤6, ≤N/2+1≤2(N+1); k+1 unbounded (not generic); (n+1)² (not generic: zero in Û_(λ,λ)) | holds; genericity needed |
| §0.4 filtration rank | d=1; d=2; d=(1,2) | monomials e^a f^b h^c, c≤1, a+b+c≤d: 4; 6+3=9; 4·9=36 | ∏(d_i+1)² as fu24 Lemma 3.3 |
| §0.4 injectivity step | e∉pÛ°_k, δ=p^jδ′, j<n_δ | eδ′≠0 mod p (domain), so eδ≠0 mod p^{n_δ}; F_k(U°_k/p^n)≅E°_k/p^n as both free of rank ∏(k_i+1)² | step holds at the stated generality (ℤ_p, p odd) |
| §0.4 telescoping and strips | a_i=k_i+1, b_i=a_i−α_i; α=(3,3), k=(1,t); m=2, k=(4,4), α=(1,1) | a²−b²=α(2a−α)≤2αa; 2(t+1)≤3(t+1)≤6(t+1)+12; (625−256)/25=14.76≤20 | correct |
| §1.1 | M=A | Hom_A(A,W)=W; H₀(G,A⊗W*)=W*, dual W | correct |
| §1.2 | M=A/Aδ, δ=1; δ=0 | 0 on both sides; D(k+1), excluded | correct; uses sibling §§3.7, 3.10, 4.14 as they are stated |
| §1.3, §2.1 | ℚ_p[X,Y], (X,Y); A/Aδ | rank 1, two generators, kernel rank 1; a=0, ℓ=1 | correct |
| §2.2–§2.5 | exact sequences | ≤aD+U_T; ≥ℓD−(ℓ−a)D−U_N=aD−U_N; H₁=H₀(N)−ℓD+H₀(M)≤U_N+U_M | correct |
| §2.6 | p=2, g=−I | (1−g)(1+g)=0 in the rational group algebra | p odd used |
| §3.1 | (0,1), κ=6; (1,1), κ=(4,6); κ_v=2 real | t=(2,2), 9, Δ=36, min x=3; t=(2,2,2), 27, 144; κ−1=1≥κ/2=1 | correct |
| §3.2 | γ=(1 1;−3 −2); ℚ(i), p=5, q=3; K_v=diag(p²,1)SL₂(O_v)diag(p²,1)⁻¹ | det −2+3=1, trace −1, order 3, unipotent mod 3; 5 split, 3 inert; (1 p;0 1)∉K_v | S03 |
| §3.3 | F=ℚ(i), t=(3,0); t=0 | dim 4 in both realizations, −I ↦ −1; constant system | correct |
| §3.4, §4.2 route | Q(x)≤(Σc)D(x)/min x | D≤Δ, min x≥min κ/2, so ≤2(Σc)Δ/min κ | correct |
| §4.1 definition | r₁=0 (ℚ(i)); r₁=1 (ℚ, Γ(3), κ=4); r₁=2; partially trivial κ | one pattern; trace of Γ(3) elements ≡2 mod 3, so no eigenvalue −1; dim S₄(Γ(3))=3(0−1)+1·4=1, H¹_cusp=2; four patterns in two conjugation orbits; a cuspidal π has no trivial archimedean component (strong approximation) | correct; owner missing: S01 |
| §4.1 tempered range | Res PGL₂, signature (r₁,r₂) | ℓ₀=r₁·0+r₂; 2q₀+ℓ₀=2r₁+3r₂, q₀=r₁+r₂=q | degree q is the bottom degree |
| §4.3 | (1,1) | κ³/κ=κ² | correct |
| §5.1 | z=(1,i), n=2; n=0 | det(1 1;i −i)=−2i; (9,18,9), ranks (8,8), cohomology (1,2,1); (1,2,1) | correct |
| §5.2 | long exact sequence | defects ≤b_i and ≤b_{i−1}; max(2c,2c)≤3c | correct |
| §5.3 | N=1, k=12, 2; N=2, k=6, 8, three types; N=3, k=4, σ=ω | 11/12−6/12+3/12+4/12=1; 0; (0,1,0) total 1 and (0,0,1) total 2, against k/2−2=1, 2; 3/12+1/4=½ | correct with σ^ι≃σ |
| §5.3 amalgam formula | Mayer–Vietoris for ℤ/4∗_{ℤ/2}ℤ/6, −I trivial | dim H¹=dim W−dim W^{ℤ/4}−dim W^{ℤ/6}+dim W^G | correct |
| §5.4 | values against fgt10 lines 1357–1396; ℓ=3 supercuspidal; ω₃(−1) | all agree; S₄-trace 2(−1)⁰=2 and Q₈ in the kernel; (−1,±3)₃=(−1/3)=−1, parity +1 | correct |
| §5.5 | principal component; ℚ(i); ℚ(√−3) | Z−νh/2−Σ+Σ=Z−νh/2; ℒ empty, 0 and ½; (0,0,½) | agrees with fgt10 Propositions 4.10–4.11 |
| §5.6 | u=1, 2, 5; general | A/B=(5/24)/(1/8)=5/3, (3/8)/(1/8)=3, (5/4)/(1/4)=5; (16/24)(5/2)3^{s−1}=(5/3)3^{s−1} | correct |
| §5.7 | Γ′ of level 𝔞𝔭𝔮, Q=Γ/Γ′ | root of unity of p-power and q-power order is 1; dim H²(Γ)≥dim H¹_!(Γ′)^Q | correct |
| gap:skew-rank | division ring; ℚ_p[X,Y]; M₂(ℚ_p); left versus right | a; 1, 1, 0; zero divisors excluded; Mathlib's Ore condition is the left one, matching left noetherian | precise and minimal |
| gap:canonical-dimension-zero | W_k and W_k⁰; A | rational 3m−3m=0, integral (3m+1)−3m=1; 3m | S02 |

## Dependency check

Run as in the brief on the README at this head:

```text
moved: ArithmeticLocallySymmetricSpacesPartII moved in the merge order from #180 to #199, right after its last supplier LocallyAnalyticDistributionsPartII; checked as moved (the worker moves it there when it submits)
depcheck: 245 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The S01 repair adds sections of a supplier already named (merge-order line 61) and changes no edge.

## Verified sound

- **Declarations read: 4** (2 definitions with real bodies, 2 theorems). Compared with the elaborated types; no binder lost; no `set_option`, `lemma`, `#eval`, sorry'd data, `True` placeholder or hypothesis containing the conclusion. One Mathlib import and one Tau Ceti module, which exists at the pin.
- **Targets read: 31** numbered targets (§§0.1–0.4, 1.1–1.4, 2.1–2.7, 3.1–3.4, 4.1–4.4, 5.1–5.8), 2 gap contracts, 10 source corrections, every Check.
- **Locators verified this round: 27** against the cached texts: fu24 13 (Theorems 1.2, 1.4, 1.5, Corollary 1.3, (2), the p. 4 remark; generic elements and Lemma 3.1, p. 8; Theorem 3.2, p. 8 and proof, p. 11; Lemma 3.3, p. 9; Proposition 3.4 and Remark 3.5, pp. 10–11), fgt10 10 ((1.6)–(1.8); (3.9); (4.4); Propositions 4.10–4.11; Theorem 4.17; Proposition 4.18; Lemma 4.19; Corollary 4.20), aw13 2, aw14 2. (1.8) is on p. 4, inside the cited "pp. 4–5". None wrong.
- **Checks tested: about 70** by computation; values in the table. None false.
- **Sibling citations checked: 52 section ids** in 10 roadmaps, all present at the open heads or on main. Statements read this round: LocallyAnalyticDistributionsPartII §§0.2, 0.3, 2.1, 3.4, 3.7, 3.8, 3.10, 4.1, 4.14, 5.2 and Conventions items 5–6; NoncommutativeAndEquivariantIwasawa §§F.1, 0.5, 0.8, 0.11, 0.12, 0.14, 0.15, 1.12; CompletedCohomologyPartII §§5.7, 6.3; ArithmeticLocallySymmetricSpaces §§ALS.0.11, ALS.1.5, ALS.5b.4, ALS.5b.5 (with its Γ₁(5) Check); AutomorphicFormsOnReductiveGroups §§2.3, 2.4, 5.2, 5.3, 5.4, 6.8. One mismatch (S01).
- **Pinned declarations checked: 25** (18 Mathlib, 7 Tau Ceti; `Finset.prod`, `Finset.powerset`, `MvPolynomial` and `OreLocalization` taken as known), each in the file the README names.
- **Ownership.** Searched main and the open heads by object for the SL₂(ℝ) discrete series, the SL₂(ℂ) principal series, the Ore rank, Fu's generic growth and the four Lean names. No other `Suggested.lean` declares any of the four names; the sibling's `exists_surjective_algHom_end_symPower` realises W_k with the same Mathlib and Tau Ceti carriers under a different name. §0.4 has no other owner. Found: S01.
- **Policy.** The pull request changes only the package folder. No pull-request number, process narrative or `lemma` in the README or the docstrings. Every target has a locator.
- **Gaps.** `gap:skew-rank` is precise, minimal and declared in both places. `gap:canonical-dimension-zero`: S02.

Wording was compared at the 27 locators and at 9 further passages: the §0.4 statement and route against fu24 lines 385–409 and 530–554; §2.7 against fu24 lines 142–143; the §4.1 definition against fu24 lines 79–87 and fgt10 lines 155–166 and 978–979; the gap sentence against aw13 lines 3617–3628; §5.3 against fgt10 lines 1340–1349; §5.4 against fgt10 lines 1357–1396; §5.5 against fgt10 lines 1194–1216; §5.6 against fgt10 lines 1288–1308; the module docstring against fu24 lines 89–98. No run of more than five consecutive shared words outside formulas and standard names. Arrangement: fu24's sections are 2 algebra, 3 growth, 4 comparison, 5 specialisation, 6 local, 7 global; here its §3 is one section of Layer 0, §§4–5 are supplier material, §6 is split over Layers 1–2, §7 over Layers 3–4, and Layer 5 comes from fgt10. The order Layer 0→1→2→3→4 is forced by the `*Needs:*` lines of §1.2 (§0.4), §1.4 (§§1.1–1.3), §2.2 (§1.4), §3.4 (§2.6) and §4.2 (§3.4). Reuse: the trace values of §5.4 are stated as targets to prove, in prose, with locators; no table or figure is taken over.

Source independence: 36 passages compared with 4 sources, none shared; largest share fu24, 33 of 51 locators; contents compared with fu24: independent.

## Not verifiable

- Elaboration of `Suggested.lean`: not run (the brief forbids builds); the elaborated types are the worker's, and the repair report records a clean elaboration with two `sorry` warnings.
- The dyadic trace values of §5.4 (ν₂=2, 3): compared with fgt10 Lemma 4.19 only.
- The summation of fgt10 Theorem 4.17 that the source omits: only the leading coefficients and the ℚ(i) values were recomputed.
- aw13 and aw14 inequality signs: the extractions print "≥" as ">" (aw13 line 3602 "m> 0"); the reading n≥0 rests on the internal evidence the repair report gives and on the sibling's §0.3.
- marshall12 and serre77 locators: not reopened this round; round 1 verified them and the text is unchanged.
- ModularForms §10C and Chebotarev Layer 10: headings confirmed, statements not read against their use.
- Whether a field with r₁≥2 and a level with unequal m_ε exists: not exhibited; the README asserts only what its proof gives.

## Source issues

- **Gap** in fu24 at Theorem 3.2, proof, p. 11: the source says the bound follows from the case where every coordinate of the weight is at least that of the filtration index; it should also treat the infinite strips with a small coordinate, bounding by the dimension of the representation; affects the proof.
- **Misprint** in fu24 at Theorem 1.2, p. 2: the source says the minimum runs over indices up to the degree of the field; it should run over the archimedean places that index the weights; affects a stated result.
- **Error** in fu24 at equation (2), p. 2, and Corollary 1.3, p. 3: the source says the cusp-form dimension is that of compactly supported cohomology; it should be the cuspidal or interior subspace; affects a stated result.
- **Error** in fgt10 at Proposition 4.18, p. 25: the source says the multiplicity formula holds for every representation of the right central parity; it should assume the representation isomorphic to its conjugate by diag(−1,1), since level 3, weight 4 gives one half; affects nothing.
- **Misprint** in fgt10 at Proposition 4.18, p. 25: the source says the order-three coefficient is a symbol it never defines; it should be the periodic coefficient of display (4.7); affects nothing.
- **Misprint** in fgt10 at Theorem 4.17, p. 25, last display: the source says the CM factor is indexed by a letter not otherwise in the statement; it should be indexed by the weight parameter of Proposition 4.11; affects nothing.
- **Misprint** in fgt10 at Corollary 4.20, p. 27, sentence after the statement: the source says it suffices that the leading coefficient is non-negative; it should be strictly positive, which the formula gives; affects nothing.

## For the human reviewers

- **Licence.** aw14 and aw13 are read from the authors' university pages (`sources.toml`, `licence_class = "author-page"`); the README's page numbers are those of these versions, not of the journals.
- **Scope.** `design/plan.json` node entries still list four gap slugs that its top-level `gaps` no longer has (repair report, "For the maintainer"); only the `gaps` list may change at this stage, so the intake reads two gaps.
- **Scope.** This roadmap now sits after LocallyAnalyticDistributionsPartII (merge-order line 199, from 180); the dependency check reports the move, and no roadmap cites this one.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0d8cb33eae60e28948f7c6114429a97e7481ef65", "job": "RT-ArithmeticLocallySymmetricSpacesPartII~2b", "model": "fable", "worker": "chris-x79"} -->
