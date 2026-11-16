<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6905231039 -->
Red team round 2 pass a (claude) of 5035c84

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) five gap sentences cannot be stated by their suppliers

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:109` "Provide the arbitrary-automorphism
   polarized reciprocity dictionary on isometries with conjugation-paired embedding lifts and possibly
   negative translating signatures"; lines 67, 73, 79, 143; the same slugs in `design/plan.json`.

   **Claim.** Each `needs` sentence says exactly what is missing, with its hypotheses.

   **Witness.** "Translating signatures" and "conjugation-paired lifts" are §5.1's X and w_(cτ)=c∘w_τ;
   "the unitary model" (line 79) and "integral lifts" name no space or class; line 73 names no
   calculation; line 143 no groups; line 67 no rings. Same defect as round 1's 1a/F03.

   **Repair.** Replace the five sentences, identically in the README and in `design/plan.json`:

   - `gap:cm-arbitrary-automorphism`: "For a CM field E Galois over ℚ with Hilbert class field H, a CM
     type Φ, σ∈Aut(ℂ), and a principally polarized complex abelian variety A with O_E-action of type Φ
     whose first homology is an invertible O_E-module L, its Riemann form being Tr_(E/ℚ) of a perfect
     skew-Hermitian pairing into the inverse different: provide a Hermitian O_E-line (X,h), h:X⊗X̄≅O_E
     of arbitrary sign at each real place of E⁺, depending only on σ and Φ, and an isometry
     H₁(σA)≅L⊗_(O_E)X of skew-Hermitian modules of type σΦ, natural in isomorphisms of A and compatible
     with Serre tensor by positive-definite Hermitian lines; and show that arithmetic Artin reciprocity
     sends [X] to ∏_(τ∈Φ)w_(στ)⁻¹σw_τ∈Gal(H/E) for every choice of extensions w_τ:H→ℂ of the embeddings
     τ of E with w_(cτ)=c∘w_τ." (Tested: σ=1 gives X=O_E and the empty product; σ=c gives (O_E,−1),
     type Φ̄ and each factor w_(cτ)⁻¹cw_τ=1, as §5.1's Checks.)
   - `gap:topological-symplectic-hodge`: "With ku, KU and β_Top as in G5.4 and bott=−β_Top: identify the
     group completion of the topological symmetric monoidal groupoid of finite-dimensional Hermitian
     spaces under orthogonal sum with Ω∞ku as Γ-spaces, so that BU→Ω∞₀ku is an equivalence; show that
     for m≥1 the class ch_m∈H^(2m)(BU;ℚ) is primitive for direct sum and takes the value +1 on the
     Hurewicz image of bott^m∈π_(2m)ku, hence (−1)^m on that of β_Top^m; that for m<p it is the image
     of a primitive class of H^(2m)(BU;ℤ_(p)); and that the reduction of that class modulo p^r pairs
     with the Hurewicz image of π_(2m)(ku;ℤ/p^r) by the reduction of the integral pairing." (Tested at
     m=1 on ℂP¹: c₁(β_Top)=−1, c₁(bott)=+1; m=2: ch₂(β_Top²)=(−u)²=+u².)
   - `gap:duality-transfer`: "For a finite extension A⊂B of Dedekind domains with separable
     fraction-field extension, B finitely generated projective over A, and inverse different 𝔡⁻¹: show
     that the transfer K(B)→K(A) carries the involution of K(B) induced by P↦Hom_B(P,𝔡⁻¹) to the
     dualization involution ψ⁻¹ of K(A), through the trace isomorphism Hom_B(P,𝔡⁻¹)≅Hom_A(P,A), so that
     transfer commutes with ψ⁻¹ when 𝔡 is principal; and prove the same with ℤ/q coefficients and after
     Bott inversion for every odd prime power q, the transfer corresponding to corestriction on the
     étale descent edges of §§6.10–6.11." (Tested: A=B gives the identity; ℤ⊂ℤ[i] gives
     Hom_ℤ(ℤ[i],ℤ)≅(1/2)ℤ[i]; ℤ⊂O_q has 𝔡 principal.)
   - `gap:low-postnikov-finite-type`: "For an odd prime p and a spectrum E with π_i(E)=0 for i≤0 and
     finitely generated homotopy groups: show that τ_(≤2p−3)Ω∞E is p-locally equivalent, as an H-space,
     to the product of the K(π_i(E),i), 1≤i≤2p−3; and for n≥1 and A=ℤ or ℤ/p^k show that the map to
     C_*(K(A,n);ℤ_p) from the free graded-commutative differential graded ℤ_p-algebra on x in degree n
     (for A=ℤ/p^k also y in degree n+1 with ∂y=p^k·x) is a homology isomorphism in degrees ≤2p−2, also
     after reduction modulo p^r, compatibly with the coefficient connecting maps." (Tested at
     A=ℤ/p, n=1: ∂(y^j)=jp·xy^(j−1), so H_(2j−1) has order p for j<p, as H_(2j−1)(Bℤ/p); at j=p the
     order is p², outside the range.)
   - `gap:compact-relative-cocycles`: "For a profinite group Γ, a closed subgroup H and a finite free
     ℤ_p-module M with continuous action, with H₁^cts(Γ,H;M) the first homology of the completed
     relative chains of the relative-homology contract: show that it is the inverse limit, over open
     normal subgroups U and n≥1, of H₁(Γ/U,HU/U;(M/p^n)_U); that the limit is exact when these groups
     are finite; and that for a finitely generated ℤ_p-module T the continuous maps α:Γ×M→T that are
     ℤ_p-linear in M, vanish on H×M and satisfy α(gg′,m)=α(g,g′m)+α(g′,m) correspond bijectively to
     the continuous ℤ_p-linear maps H₁^cts(Γ,H;M)→T." (Tested at Γ=C₂, H=1, M=ℤ_p with sign action:
     the finite groups are ℤ/p^n, the limit is ℤ_p, and α(c,m)=m is the identity map, as §7.1's Check.)

2. **F02** (P3) `gap:cyclotomic-p-class-fields` differs between the README and `plan.json`

   **Location.** README:131 "embed their Tau Ceti Hilbert class fields
   `TauCeti.ClassFieldTheory.hilbertClassField` compatibly along the tower";
   `design/plan.json`, slug `cyclotomic-p-class-fields`.

   **Claim.** The gap is declared with one sentence in both places.

   **Witness.** `plan.json` has "embed their Tau Ceti `hilbertClassField`s compatibly" and the unqualified
   `hilbertClassField` F and `hilbertClassArtinEquiv`; string comparison of the 14 slugs: 13 equal,
   this one differs.

   **Repair.** Set the `needs` of that slug in `design/plan.json` to the README's sentence of line 131,
   character for character (the README's fully qualified names are the ones that resolve).

3. **F03** (P3) the poset HU is not ordered "by extension"

   **Location.** README:1013 "Let HU(ℤ^(2g)) be the poset of hyperbolic unimodular sequences in hᵍ,
   ordered by extension".

   **Claim.** The poset with this order is ⌊(g−6)/2⌋-connected.

   **Witness.** mirzaiiVanDerKallen2002 lines 238–240: z lies below wz, so a final segment is smaller;
   the order is refinement. Under prefix extension, ((e₁,f₁)) and ((e₂,f₂)) are minimal in different
   components, so the poset is not 0-connected at g=6.

   **Repair.** Replace "ordered by extension" by "ordered by refinement: one sequence is below another
   when it is obtained from it by deleting entries, in any positions". (Tested: ((e₁,f₁)) and
   ((e₂,f₂)) are both below ((e₁,f₁),(e₂,f₂)), so they are joined.)

4. **F04** (P3) the block-sum product is cited to StableHomotopyKTheory §4.18, which states no product

   **Location.** README:1021 "StableHomotopyKTheory §4.18 (the plus comparison and its block-sum
   product)"; README:1019 "under which the Pontryagin product of BSp∞(ℤ)⁺ is the product … induced by
   block sum".

   **Claim.** §4.18 supplies the compatibility of the plus isomorphism with products.

   **Witness.** StableHomotopyKTheory §4.18 on main states only B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺. The ring
   statement is §4.6 ("Pontryagin homology localization … H_*(Y;k)≅π₀(X)⁻¹H_*(X;k)") and §4.9
   ("all-degree homology localisation").

   **Repair.** In README:1021 replace the last item by "StableHomotopyKTheory §4.18 (the plus
   comparison) and §§4.6, 4.9 (the ring isomorphism π₀⁻¹H_*(BS;k)≅H_*(B(S⁻¹S);k), which on the unit
   component is the block-sum product)"; add "§§4.6, 4.9" to the StableHomotopyKTheory item of the
   Layer 8 Dependencies (line 1071) and to the section list of line 71.

5. **F05** (P3) eleven `*Needs:*` lines use a declared gap without naming it

   **Location.** README:269 "*Needs:* §0.4; ClassFieldTheory Layer 13; ClassFieldTheory Layer 11;
   ArithmeticGaloisDuality R02.2 (Hochschild–Serre and transgression); `groupHomology`."; also lines
   607, 642, 682, 730, 835, 851, 867, 881, 1007, 1063.

   **Claim.** Each Needs line lists the inputs of its proof route.

   **Witness.** ArithmeticGaloisDuality R02.2 at its open head is cohomological (R02.2.1–R02.2.4); the
   homological edge used in §§0.5, 7.3 exists only as `gap:relative-homology-edges`. Lines 254, 915,
   993, 1025 name their contracts; these eleven do not.

   **Repair.** Append to the Needs lines, and to the matching items of the layer Dependencies:

   - §§0.5, 5.3, 7.3 (lines 269, 730, 867): after "ArithmeticGaloisDuality R02.2 (…)" add "and its
     relative-homology contract".
   - §7.1 (835): after "R02.2 (…)" add "and its relative-homology and completed-relative-bar
     contracts".
   - §§7.2, 7.3 (851, 867): add "ClassFieldTheory Layers 11–13 and its cyclotomic-p-class-field
     contract" (nesting of the H_q; the split-at-p identification).
   - §4.2 (607): after the PELModuli items add "and its embedding-atlas contract".
   - §4.4 (642): after "EtaleHomotopyTypes §§6.6–6.9 (…)" add "and its graded Moore realization
     contract".
   - §5.1 (682): after "ComplexMultiplicationAndExplicitReciprocity §1.2" add "and its
     arbitrary-automorphism contract".
   - §7.4 (881): after "EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6 (…)" add "and its
     lisse-integral contract".
   - §8.3 (1007): after "StableHomotopyKTheory §§3.20, 3.34–3.37" add "and its low-Postnikov contract".
   - §8.6 (1063): replace "IntegralIwasawaTheory §12.3 (specialization at arithmetic weights)" by
     "IntegralIwasawaTheory §12.3 and its Bernoulli nonvanishing contract".

6. **F06** (P3) §1.2 has one discriminating Check for its definition

   **Location.** README:323–326, the Checks of the definition KSpᵝ(ℤ;ℤ/q)=KSp(ℤ)∧T_q: "At q=3 an
   iterated v₁ self-map is allowed, whereas associativity of S/3 is not."

   **Claim.** The definition has three discriminating Checks.

   **Witness.** Only the first bullet (q=5, m=8) has a value. Bullets 2–4 state rules and compute
   nothing; no bullet excludes the zero model (the telescope of a nilpotent self-map).

   **Repair.** Replace bullets 2–4 by:

   - "At q=25 a period is a multiple of 2·5·4=40: χ_cyc²⁰ is trivial on (ℤ/25)×, of order 20, whereas
     the period 8 of q=5 gives χ_cyc⁴, and 2⁴=16≠1 modulo 25. One fixed period for the whole tower
     fails."
   - "At q=5 a degree-two periodicity would need χ_cyc trivial modulo 5, and 2≠1; the smallest
     admissible exponent is m/2=4, with 2⁴=16≡1."
   - "Multiplication by p on S/p is null for odd p, so its telescope is contractible and would give
     KSpᵝ=0; a v₁ self-map is an isomorphism on K-theory of S/p, and the telescope of Adams’ map has
     π_*(KU∧T_p)=𝔽_p[bott^(±1)]≠0."

   Keep the q=3 sentence in the body of §1.2, where it already stands.

One P2 finding (five supplier-gap sentences that a supplier cannot state) and five P3 findings. No
statement of the roadmap was found false; the three Lean theorems are true as typed and agree with
the README. All ten findings of round 1 are repaired.

## Round 1 findings at this head

| Round 1 id | Status | Witness at 5035c84 |
| --- | --- | --- |
| 1a/F01 (homology Bockstein is pinned) | repaired | `packages/ArithmeticKTheoryPartII/README.md:39` "The coefficient Bockstein on singular homology is Mathlib’s connecting map `CategoryTheory.ShortComplex.ShortExact.δ` … applied to … `map_simplicialChains`"; line 171 gap asks only for the Künneth Tor value; `Suggested.lean:25-28` names the H-space product and the Künneth identification. Pins read: `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean:36`, `Mathlib/Algebra/Homology/HomologySequence.lean:282`, `HomologySequenceLemmas.lean:56`. |
| 1a/F02, 1b/F01 (Borel comparison owned by ArithmeticKTheory §3.4) | repaired | README:1040 "Apply ArithmeticKTheory §3.4’s borelInvariantFormComparison to G=Sp_(2g), K=U(g) and Γ=Sp_(2g)(ℤ)"; also lines 15, 55, 1038, 1049, 1071. Supplier read at its open head: bijective for 4q<rk_ℚ, law for f:G→G′ with f(K)⊆K′ covers block inclusion. |
| 1a/F03, 1b/F04 (gaps naming this roadmap's objects) | repaired for the three slugs raised | README:141 (`relative-homology-edges`, HN=G stated), 119 (`ppav-embedding-atlases`), 125 (`graded-moore-realization`). The same defect remains in five other slugs: S01. |
| 1a/F04 (auxiliary prime is Dirichlet at the pin) | repaired | README:37 cites `ZMod.isCyclic_units_of_prime_pow` (`UnitsCyclic.lean:206`, hypotheses `p.Prime`, `p ≠ 2`) and `Nat.infinite_setOfPred_prime_and_eq_mod` (`PrimesInAP.lean:431`, `[NeZero q]`, `IsUnit a`); lines 135, 915. |
| 1a/F05 (Qᶦⁿᵗ on BSp∞(ℤ)⁺) | repaired | README:1019 "KSp_i(ℤ)⊗ℤ_p→Qᶦⁿᵗ_i(BSp∞(ℤ)⁺)"; Check at 1034. The section cited for the product is the wrong one: S04. |
| 1b/F02 (stability without a route) | repaired | README:1013, route through HU(ℤ^(2g)). Source read in full: mirzaiiVanDerKallen2002 line 254 gives ⌊(n−usr−4)/2⌋, line 293 gives onto for n≥2i+usr+3 and bijective for n≥2i+usr+4; at usr=2 these are the README's ⌊(g−6)/2⌋, 2i+5, 2i+6. The order of the poset is misdescribed: S03. |
| 1b/F03 (Vandiver criterion statable) | repaired | `Suggested.lean:120-143`, README:919-946. Truth recomputed below. |
| 1b/F05 (pinned class fields attributed to a layer) | repaired | README:51 and 129 "are pinned Tau Ceti declarations"; pins at `RayClassField.lean:241, 246, 262, 293, 306`. The repair left the gap sentence different in `plan.json`: S02. |

New errors introduced by the repairs: S02, S03, S04 (all P3).

## Suggested.lean table

Elaborated types were taken from the worker's `signatures.md` (6 declarations, no lost binder) and
compared with the README; no Lean was run in this read-only pass, and nothing changed.

| Declaration | Context | Instances and values | Result |
| --- | --- | --- | --- |
| `exists_split_prime_with_signs` (§2.3) | explicit p, n, `hp`, `hodd`, `hn`; `K : Type*`; cyclotomic and CM instances; ε on real embeddings of K⁺ | q=3: t=±7, 7=(3+ζ₃)(3+ζ̄₃)=9−3+1; t=2 inert, t=3 excluded by `p ∉ span{t}` | true; FGV line 1263 |
| `conjugateFractionalIdeal` | real body | ℚ(i): (2+i)↦(2−i), product (5)≠(2+i)²=(3+4i) | determines its object |
| `IsSkewCMLine` | real body | ℚ(i): δ=i/2 true; δ=i gives ℤ[i]≠(1/2)ℤ[i] (index 4), false; δ=0 false | zero form and inclusion-only excluded |
| `exists_cm_lines_with_ideal_product` (§2.4) | as the first, plus Φ, `hΦ`, L≠0 | 𝔡=𝔭^e, e=p^(n−1)(n(p−1)−1) odd; π=ζ^(1/2)−ζ^(−1/2), π̄=−π, δ₀=π^(−e); B₁=x⁻¹, δ₁=δ₀t; B₂=L·L̄⁻¹·x, δ₂=δ₀/t; B₂B̄₂=(t), B₁B₂=L·L̄⁻¹, a=1 | true; FGV line 1232 |
| `pHilbertClassField` | `K : Type` (the pin's class field needs the lowest universe), real body | class group C₆ (ℚ(√−26)): p=3 gives degree 3, p=2 degree 2; p=1: K; p=0: Hilbert class field | determines its object; the prime-to-p model gives 2 and 3 |
| `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber` (§7.7) | p, n, `hp`, `hodd`, `hn`, σ, `hσ`, `hK` all in the signature | primes above p: torsor under A=Cl(K)_p; σx₀=bx₀ with c(b)=b⁻¹; ax₀ fixed iff a/c(a)=b; a↦a/c(a) is onto A⁻ with kernel A⁺ (|A| odd); so the fixed set is an A⁺-torsor. q=3: 1 prime, 3∤1. q=37: 37 primes, 1 fixed, h⁺=1. Without `hσ`: x↦x+1 on a plus torsor ℤ/3 fixes none | true; `hσ` and `hodd` needed |

One-tactic probe, by reading: no theorem follows from a pinned lemma (`library-matches.md`: no
same-name hit; no Chebotarev-with-signs or fixed-prime count at the pins); the three definitions
are each used by a headline. No padding. The module docstring names every README headline that is
not stated, with its missing carrier; finite-genus stability (§8.4) is statable on
`Matrix.symplecticGroup` and `groupHomology` and is declared there a supporting target, not an end
theorem of the Summary.

## Adversarial pass: record

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.4 route, usr(ℤ)=2 | (S₁) at (2,5); (S₂); (T₃) | 2+5t=±1 has no solution, so (S₁) fails; sr(ℤ)=2; Sp₆(ℤ) transitive on primitive vectors | usr=2 | none |
| §8.4 ranges | g=6, i=0; g=10, i=2; usr=3 | ⌊0/2⌋=0, ⌊4/2⌋=2; onto from 2i+5, bijective from 2i+6; 2i+7 at usr=3 | matches lines 254, 293 | none |
| §8.4 poset order | prefix order, g≥2 | ((e₁,f₁)), ((e₂,f₂)) in different components | "extension" wrong | S03 |
| §8.4 Hurewicz quotient | τ_(≥1)KSp(ℤ); SL₂(ℤ) | Ω∞ is the unit component; [[2,1],[1,1]]≠[[1,1],[1,2]] | holds on the plus space | S04 (citation) |
| §8.3 range | ΣHℤ/p; Σ²Hℤ; P¹ from degree 1 | Q_(2j−1)(Bℤ/p)=0 for 2≤j≤p−1, ≠0 at 2p−1; Q_(2p)(ℂP∞)=ℤ/p; a stable P¹ joins π₁ and π_(2p−2) | true for 1≤i≤2p−3; Q_i depends on τ_(≤i) only | none |
| §8.5 | q=2, g=8, 9; degrees ≤g of Sp(g)/U(g) | 8≮8; 8<9; polynomial on c₁,c₃,… in degrees 2,6,10 | agrees with borel1974 line 1249 | none |
| §8.6 | n_i odd <p; d=0 | n_i≤p−2, 2n_i≤2p−4; s=1, 2 | inside the Hurewicz range | none |
| §7.7 laws | G abelian, U of p-power index | prime-to-p elements die in G/U | holds | none |
| §7.6 | (p,k,ℓ)=(3,1,2),(5,1,2),(3,1,19) | v₃(3)=1; 3 a 5-unit; v₃(360)=2 against 1 | exponent 2k; ℓ must generate | none |
| §7.3 | (G,G_𝔭), N=Gal(ℚ(p)/K_q); (G_q,D_q) | HN=G (p totally ramified); both sides (Cl/q⊗M_q)_Q; D_q abelian with c=−1 on M_q, so H_*(D_q,⟨c⟩;M_q)=0 | holds | none |
| §7.1 | Γ=C₂, H=1, sign ℤ_p | H₁(C₂;M)=M/2M=0, H₀=0, relative H₁=M | ℤ_p | none |
| §3.4 p-adic table | i mod 4 | ψ⁻¹=(−1)^j on H¹(ℤ_p(j)) and H²(ℤ_p(j)): K_(4k)⁺=0, K_(4k+1)⁺=0, K_(4k−2), K_(4k−1) all plus; K_(4k−3)(ℤ) has no odd torsion | agrees | none |
| §3.4 finite coefficients | i=4, p=3 | K₄(ℤ;ℤ/3)⁺=K₃[3]=ℤ/3=KSp₃[3] | consistent | none |
| §1.1 | L_n(ℤ;−ℤ)=L_(n+2)(ℤ) | ℤ at n≡2 mod 4, torsion or 0 otherwise | agrees with line 99 | none |
| §1.2 | q=5, 25 | m=8, χ⁴=1 mod 5; 2⁴=16≠1 mod 25, period 40 | consistent; Checks thin | S06 |
| §0.1 | π₂ˢ(Bℤ/q₊;ℤ/q) | π₂ˢ⊗ℤ/q=0, π₁ˢ[q]=ℤ/q | ℤ/q | none |
| §0.3 | Br(O′_q)[q]; signs | one prime over p, no real place: 0; H²(μ^(⊗2k)) sign +, H⁰(μ^(⊗(2k−1))) sign − | agrees | none |
| §5.3 | n=1,2,3 | gm−m; [g]⊗g′m−[gg′]⊗m+[g′]⊗m; signs +,−,+,− | agrees | none |
| §5.4 | C₂, H=1, ℤ/5 | c²(m,t)=(m,t+m−m); c(m,2m)=(−m,3m)=(−m,−2m) | agrees | none |
| gap `relative-homology-edges` | HN=G; H=G | cofibre of C_*(Q;C_*(N∩H))→C_*(Q;C_*(N)); relative H₀=0 gives E²_(0,1)=H₁; H=G gives 0=0 | true | none |
| gap `pontryagin-bockstein-cap` | x changed by a reduced integral class | β_d(ρ(x′)×y)=±x′×β_d(y), a cross product, zero in Tor | well posed | none |
| gap `cyclotomic-p-class-fields` | H(K_q)K_(qp)/K_(qp) | unramified abelian, so inside H(K_(qp)) | true; sentence differs in `plan.json` | S02 |
| Auxiliary prime (line 37) | p=3 | 2 has order 6 mod 9 | holds | none |

## Dependency check

```
depcheck: 239 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Verified sound

- Declarations read: 6 of 6 (`Suggested.lean`, all 145 lines), against the elaborated signatures.
  One `import Mathlib` and one `TauCeti.*` module, which exists at the pin; no `set_option`, no
  `lemma`, no sorry'd data, no `#eval`.
- Targets read: all 1083 README lines, every target of its 42 numbered subsections, and the 45 Check blocks.
- Round 1 findings re-verified: 10 of 10 repaired.
- Locators verified this round: FGV lines 271–278, 1232, 1263–1267, 1695–1700, 2026–2042, 2154,
  2190–2194, 2206–2232, 2236–2255, 2295–2317; borel1974 lines 1154, 1246–1249;
  mirzaiiVanDerKallen2002 lines 37–42, 117–125, 185–189, 254, 293 (whole text read). All exact.
- Pinned declarations opened: 14 (those of lines 37, 39, 49, 51 of the README,
  `NumberField.RingOfIntegers.mapRingEquiv`, `FractionalIdeal.ringEquivOfRingEquiv`,
  `NumberField.exists_ideal_in_class_of_norm_le`), each with the hypotheses the README states.
- Sibling citations checked: every section id of the 24 supplier roadmaps resolves at main or at the
  open head (GeneralizedCohomology G5.4–G5.6 are items 4–6 of G5; HermitianKTheoryOfPoincareCategories
  §§4.11, 6.6 are bold items). Content read: ArithmeticKTheory §3.4; StableHomotopyKTheory §§4.6,
  4.9, 4.16–4.18; ArithmeticGaloisDuality R02.1–R02.2 headings.
- Gaps: 14 slugs, same supplier in both files; 13 sentences identical (S02).
- Policy: the pull request changes only `packages/ArithmeticKTheoryPartII/`; no pull-request number
  or process narrative in the README or the Lean file.
- Ownership against open work: by object (p-Hilbert class field, symplectic stability, relative
  group homology, integral indecomposables) nothing new since round 1; `overlaps.md` lists no
  second copy, dropped id or competing revision.
- Wording and arrangement: 14 passages set beside 3 sources (FGV at the locators above for §§2.3,
  2.4, 5.2, 7.3, 7.6, 7.7 twice, 8.1, 8.3, 8.4, 8.6; mirzaiiVanDerKallen2002 for the §8.4 route
  twice; borel1974 for §8.5). The longest shared run is a definition's forced phrase (a basis of an
  isotropic direct summand). Arrangement against FGV's contents (FGV lines 13–21): Layer 3 takes
  Theorem 3.5 from §3, Layer 4 merges §6.1 with Appendix A, §§6–7 are cut into Layers 5–7; the order
  is forced by §2.1→§0.2, §3.1→§§0.1, 1.1, 2.1, §4.5→§3.5, §5.1→§4.4, §6.1→§§4.5, 5.1, §7.2→§6.3,
  §8.6→§7.4.

Source independence: 14 passages compared with 3 sources, none shared; largest share FGV, 97 of 103 locators; contents compared with FGV: independent (order forced by the Needs lines above, layer scopes differ from the source's sections).

## Not verifiable

- charney1987, §4 and Corollary 4.5: uncertified. The route of §8.4 was checked against
  mirzaiiVanDerKallen2002, whose Theorem 4.1 gives no proof of its own.
- The order of the poset O(V) is defined in a paper mirzaiiVanDerKallen2002 only cites; S03 rests on
  that source's own use of it (lines 238–240).
- Elaboration of `Suggested.lean`: taken from the worker's signatures; no Lean was run.
- Supplier section contents other than those listed were checked by heading only.

## Source issues

- **Gap** in FGV at Theorem 8.4 and its proof, printed p. 50 (FGV lines 2312–2316): the source says the truncation through degree 2p−2 splits as a loop space; it should be through degree 2p−3, the delooping's first k-invariant reaching degree 2p; affects a stated result.
- **Error** in FGV at Theorem 8.1, printed p. 48 (FGV lines 2218, 2223): the source says a prime at least the largest part makes each Chern character p-integral; it should be strictly larger than every part; affects a stated result.
- **Misprint** in FGV at Remark 7.9, printed p. 44 (FGV lines 2036–2037): the source says Vandiver's conjecture is equivalent to the set of primes above p being one element; it should be its conjugation-fixed subset; affects a stated result.
- **Misprint** in FGV at footnote 13, printed p. 47 (FGV line 2193): the source says the invariants are for the (2k−1)-st power of the cyclotomic character; it should be the 2k-th power; affects nothing.
- **Misprint** in FGV at Theorem 8.4's proof, printed p. 50 (FGV line 2304): the source says the model algebra of a cyclic Eilenberg–Mac Lane space has the differential of y equal to x; it should be p^k times x; affects the proof.
- **Misprint** in FGV at Definition 7.3, printed p. 37 (FGV line 1699): the source says the section followed by the projection, written in the opposite order, is the identity of M; it should be the projection after the section; affects nothing.
- **Misprint** in FGV at Lemma 4.8, printed p. 28 (FGV line 1264): the source says S is the set of real embeddings of the cyclotomic ring; it should be those of the integers of the real subfield; affects nothing.

## For the human reviewers

- **Licence.** FGV is read from the 64-page author copy (`sources.toml`, id `FGV`, `licence_class = "author-page"`); every locator uses that copy's numbering, not the pagination of Inventiones 230.
- **Licence.** charney1987 is paywalled and uncertified; mirzaiiVanDerKallen2002 is cited in its arXiv v1 numbering, and its Theorem 4.1 refers to Charney's §4 for the proof.
- **Scope.** 97 of the README's 103 source locators are to one article (FGV, Inventiones 2022); §§8.3 and 8.6 are deliberately narrower than its Theorems 8.4 and 8.1, for the reasons under Source issues.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5035c8420207e4fbca022515770de3d2849274b8", "job": "RT-ArithmeticKTheoryPartII~2a", "model": "fable", "worker": "chris-x55"} -->
