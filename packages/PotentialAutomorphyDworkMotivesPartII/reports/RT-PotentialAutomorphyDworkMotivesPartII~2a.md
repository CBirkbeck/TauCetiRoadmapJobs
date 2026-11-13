<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6862931702 -->
Red team round 2 pass a (codex) of b48ff77

Verdict: needs_changes

1. **F01** (P2) The new characteristic-two reduction still uses a lattice with 2 inverted

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:861`, “or of `O₁` above `2`”; `README.md:559`, “`V_B = e_χ R^{N−2}π̃_*O`”.

   **Claim:** The Betti reduction in §§4.7 and 5.5 has rank `n` and supplies the geometric residual image at `λ | 2`.

   **Witness:** With `N=3689`, `n=3`, `λ | 2` in `O₁`, the specified `O=O₁[1/2]`-module satisfies `λV_B=V_B`, hence `V_B/λV_B=0`, not a three-dimensional residue-field space.

   **Exact repair text:** Add to §2.3(5): “For Qian's datum also define the Betti local systems `V_{B,1}=e_χR^{N−2}π̃_*O₁` and `V′_{B,1}` over the two complex parameter lines. Their stalks are finite projective of rank `n`, their scalar extensions to `O` are `V_B` and `V′_B`, and their completions and reductions at every prime of `O₁` agree with the corresponding étale realizations. At primes above 2, §§4.1–4.7 and 5.5 use `V_{B,1}`, `V′_{B,1}`.” Add these forms to §2.7 and the comparison API; replace the old Betti symbols in all characteristic-two reductions.

   **Repair test:** `#H₀=3689^3687` is odd, so the projector acts on integral `O₁`-cohomology. Completion at `λ` gives a free rank-three module and reduction has dimension three. Inverting 2 first instead gives dimension zero. This is a regression in the repair of 1a/F11; the finite matrix-group statements are not refuted by it.

2. **F02** (P3) The rank-three characteristic-two Check gives the wrong order

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:902`, “Here `h∞` and `h₁` are involutions”.

   **Claim:** The displayed rank-three hypergeometric example has involutory monodromy at infinity.

   **Witness:** Over characteristic two, `A=C((X−1)^3)` has `J=A−1`, `J³=0`, `J²≠0`; thus `A²=1+J²≠1` and `A⁴=1`. Its order is four.

   **Exact repair text:** “Here `h₁` is an involution and `h∞` has order four: in the companion model `J=h∞−1` satisfies `J³=0≠J²`, so `h∞²=1+J²≠1` and `h∞⁴=1`.”

   **Repair test:** In the displayed example `n=3`; the computation applies over `𝔽₂` and remains true over `𝔽_{2^120}`. The rank-two dihedral Check in §9.1 instead has `J²=0` and correctly gives an involution.


3. **F03** (P3) The one-prime torsor examples violate the modulus hypothesis

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1061`, “for `n = 3`, `l = 7`”; `README.md:1079`, “`l = 7 ≡ 1 (mod N)`”.

   **Claim:** These are numerical instances of the split one-prime Qian torsor and its repeated-prime disconnected variant.

   **Witness:** Rank three requires odd `N > 400`. The congruence `7 ≡ 1 (mod N)` requires `N | 6`; no such modulus exists. The group order is correct but the stated geometric example is empty.

   **Exact repair text:** In both Checks replace the numerical specialization by: “For `n=3`, `N=401`, `l=3209`, the prime `l` is `1` modulo `N`, and the degree (respectively number of geometric components after repeating that prime) is `3209³(3209²−1)(3209³−1)`.”

   **Repair test:** `3209=8·401+1` is prime, `401>400`, and the residue degree is one. The repeated-prime image is diagonal, of index exactly this group order.

4. **F04** (P3) The same-characteristic Check switches to the wrong residue characteristic

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1042`, “repeating the prime above `3` would give the diagonal, of order `1320`”.

   **Claim:** Repetition of a prime above 3 in the real cyclotomic coefficient ring for `N=5` has image of order 1320.

   **Witness:** `X²+X−1` is irreducible modulo 3, so the real residue field is `𝔽₉`; `#SL₂(𝔽₉)=9(81−1)=720`. The order 1320 belongs to `SL₂(𝔽₁₁)`.

   **Exact repair text:** “Repeating the prime above 11 at which `ζ₅+ζ₅⁻¹` reduces to 3 gives the diagonal, of order `11(11²−1)=1320`.”

   **Repair test:** The two roots modulo 11 are 3 and 7. Repeating the first prime identifies the two factors and gives order 1320; using the prime above 3 gives order 720.

5. **F05** (P2) The local-model supplier is invoked outside its declared range

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1560`, “`1 ≤ m ≤ p − 1`” and “`ρ̄_{2,m,0}` … of LocalGaloisDeformationRings §6.19”; the contract at line 126 omits that supplier's bound.

   **Claim:** The supplied model identifies the nonordinary reduction throughout the stated small-weight range.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:3240` constructs these models under `p > nm`. At `p=3,n=2,m=2`, §9.6 applies but the supplier requires `3>4`.

   **Exact repair text:** In §9.6 keep the induced-representation conclusion for the full range and write: “On inertia this is `θ₂^m ⊕ θ₂^{pm}`, with `θ₂=ω₂⁻¹`. When additionally `p>2m`, on `G_{ℚ_{p²}}` it is an unramified twist of the supplied model `ρ̄_{2,m,0}` of LocalGaloisDeformationRings §6.19.” In the supplier contract prefix the model clause by “for `p>nm`”. If the model identification itself is intended in the larger range, instead declare the extension of that supplier contract as a gap.

   **Repair test:** For `p=3,m=2`, the inertia characters have exponents 2 and 6 modulo 8 and are distinct, so the full reduction theorem remains. The model comparison is used by §9.7 with `m=1,p>2`, where its supplier's bound holds.

6. **F06** (P3) The newly owned characteristic-two classification is missing from the headline inventory

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean:12`, “of a finite field of odd characteristic”; line 30, “Not statable at the pins”.

   **Claim:** The module inventories the roadmap's statable and unavailable headline theorems.

   **Witness:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:346` now owns Kantor's characteristic-two classification, including cases T3, T5, T7. Neither that theorem nor its missing exceptional-representation carriers appears in the module inventory.

   **Exact repair text:** Add to the unavailable-headlines list: “Kantor's characteristic-two classification of irreducible groups generated by one conjugacy class of transvections (§0.11(3)): the pins do not supply the exceptional natural representations in cases T5 and T7 (`3·A₆` in dimension three and `3·PΩ⁻₆(3)` in dimension six). Those representations are constructions of this roadmap, not simple definitions in this file.”

   **Repair test:** The rank-six `S₇` example in §0.11 has order 5040, versus 1451520 for `Sp₆(𝔽₂)`, and is outside the odd-characteristic theorem's domain. The revised inventory explicitly accounts for the distinct new classification without substituting a weaker theorem.

7. **F07** (P3) Two constructions lack three discriminating Checks

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:614`, “the real form ... has rank two”; line 1240, “`V_{dR,id,0} = ⊕ ...`”.

   **Claim:** The Checks for the real form (§2.5) and the coefficient-twisted de Rham construction (§7.1) test the definitions rather than repeat their APIs.

   **Witness:** §2.5 repeats its rank/pairing API, notes its denominator, and excludes a parameter. §7.1 repeats the splitting, specialization of its index set, coefficient-action convention and scalar-type declaration. Neither supplies three independent discriminating tests.

   **Exact repair text:** Replace or supplement §2.5's Checks with:

   - “For `N=5,n=2`, identify the two conjugate rank-two summands using ς. On their direct sum the projector is `½[[I,I],[I,I]]`, of rank two and square itself. Omitting ½ gives a matrix whose square is twice itself.”
   - “At `N=5,l=3`, the real residue field is `𝔽₉`, whose multiplicative group has order eight; the eigenvalues of order five appear only after extension to `𝔽₈₁`. Forgetting the coefficient descent therefore changes the field on which the eigenlines exist.”
   - “At `N=5,n=2,q=11`, the untwisted pairing has Frobenius value `11³`; twisting both arguments by 1 changes that to `11³·11⁻²=11`, the claimed target twist −1.”

   Replace or supplement §7.1's Checks with:

   - “For Qian's `N=401,n=3` datum at `t=0`, the identity embedding gives grades `198,199,200`; conjugating coefficients gives `199,200,201`. Using the unchanged character in both components fails this comparison.”
   - “For `N=7,a=(0,0,0,1,3,5,5)`, the three Fermat lines have grades `2,2,3`, so `gr²` has rank two. A rank-three datum alone does not make every graded piece rank one.”
   - “Take the rank-three fibre at `N=401,l=3209`, with coefficient field `E=ℚ_l` and a quadratic base field `K/E`. The representation has E-dimension three and cannot be a K-vector space; its de Rham period module instead has K-dimension three and E-dimension six.”

   **Repair test:** Block multiplication gives `(½S)²=½S` because `S²=2S`. The Fermat sums are `401·199,401·200,401·201`; inverse labels give complementary grades summing to 399. The dimension obstruction is `3/2∉ℕ`.

8. **F08** (P2) The complete-intersection contract drops the cohomological-degree bound

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:116`, “outside the middle degree” and “for `q` even ... free of rank one”.

   **Claim:** Every even degree other than the middle degree has rank-one cohomology for a positive-dimensional smooth complete intersection.

   **Witness:** For `X=ℙ¹` embedded as a line in `ℙ²`, `m=1,q=4,Λ=ℚ₃`, `H⁴(X,Λ(2))=0`, of rank zero. The supplier explicitly requires `0≤q≤2m` in §4.3(a).

   **Exact repair text:** Replace clause (a) by: “For `0≤q≤2m` and `q≠m`, `H^q(X,Λ)` vanishes when `q` is odd, and `H^q(X,Λ(q/2))` is free of rank one when `q` is even, rationally spanned by `h^{q/2}`. For `q>2m`, `H^q(X,Λ)=0`.” Preserve the remaining clauses.

   **Repair test:** The line has ranks one in degrees 0 and 2 and zero in degree 4. This agrees with `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4222` and does not restrict the intended middle-degree Dwork application.

## Verified sound

Read in full: 12 Lean declarations (7 theorems, 4 definitions, 1 structure), 84 numbered README targets, and 323 Check bullets. The tables retain 18 sampled target evaluations, 12 Lean boundary evaluations and 10 convention tests. Twenty earlier findings were individually revisited: nineteen repaired, one partly repaired. Twenty-eight supplier roadmaps were checked; seven declared gaps match. The source ledger below records 51 distinct numbered locators examined in sixteen readable works. These counts describe the audit coverage, not a claim that examples prove the targets.

### Verification of the earlier findings

Identifiers below are those of the two round-one reports. None was marked “not actionable in this package” by the repair report. Quotes are from the current package; they are evidence of the repair, not instructions adopted from the earlier reports.

| Earlier finding | Status | Repaired passage and current location | Verification witness |
|---|---|---|---|
| 1a/F01 | Repaired; new Check errors S03–S04 | README §5.12: “Repeating one prime”; §5.11: “but not in rank two: `Sp₂ = SL₂`” | At the two primes above 11, projective trace squares are 9 and 5; repeating either gives 1320 elements, versus 1742400 in the product. Rank-two determinant preservation is pairing preservation. |
| 1a/F02 | Repaired | Suggested.lean, `qianGauss` docstring: “when `R` is a domain and `ψ` nontrivial” | Over the dual numbers in characteristic two, `g(0)=1+ε`; over ℂ with `ψ(1)=−1`, `g(0)=1`. The theorem retains `IsDomain R`. |
| 1a/F03 | Repaired | README §0.9: “CFSGBasicProperties T1–T2”; Tau Ceti contract: “Quasiprimitivity ... and ... kernel ... are ... part of §0.9(3)” | Pinned symplectic perfectness covers `Sp₄(𝔽₃)`; its projective order is 25920. The repair correctly avoids the earlier report's erroneous assertion that `C₂(3)` was a valid supplier index. `Sp₂(𝔽₃)` has abelianization of order 3 and stays excluded. |
| 1a/F04 | Repaired | README §0.4: “`h∞ = diag(4, 5)`, `h₀ = diag(1/2, 1/3)`” | Product with `h₁=diag(1/2,3/5)` is identity; displacement has entries `−1/2,−2/5`, rank 2. Spectra `{4,5}` and `{2,3}` are disjoint. |
| 1a/F05 | Repaired | Suggested.lean:73,102: `transvection_group_classification`, `transvection_group_classification_two` | The first permits arbitrary subgroups, not just companion pairs. The second includes the 120-element `SL₂(𝔽₅)` in characteristic 3; subfield alternatives in `𝔽₉` have orders 24 or 720. |
| 1a/F06 | Repaired | README §8.1: “`l = 2` included” and “`V^ℚ_{t,λ}`” | `N=5,t=1/2` over `ℚ₂(ζ₅)` has valuation −1; twisted weights are 0,1 and a nonzero rational size-two monodromy block remains nonzero under ramification scaling. |
| 1a/F07 | Repaired | README §9.5: “`λ ∤ N`”; “no integral `W_λ` is defined” at `λ` above 401 | §2.3(5) supplies the étale lattice at 2. At 401 the rational quotient is zero, not rank 3; this is explicitly excluded. This repair is distinct from the remaining Betti defect S01. |
| 1a/F08 | Repaired by declared gap | README §2.1 and exact contract: “gap:griffiths-residue-hodge-filtration” | Same slug and named supplier in plan.json. DMOS82 line 2177–2195 supplies the pole-order theorem. Cubic poles 1,2 give grades 1,0 with inverse-pullback eigenlabels `(2,2,2)`, `(1,1,1)`. |
| 1a/F09 | Repaired | README §4.4: “No coprimality ... is assumed”; “`B + θ = B`” | `N=9,n=6,B={2,…,7}`; translation by 3 produces `{0,1,5,6,7,8}`, not B. No determinant-only inference remains. |
| 1a/F10 | Repaired | README §6.2: “reduction mod `λ` is the value of `det V[λ]`” | `11³=1331` in characteristic zero reduces to 2 in characteristic 3. The two coefficient objects are now distinguished. |
| 1a/F11 | Partly repaired | README §2.3(5): “`O₁ = ℤ[1/N, ζ_N]`”; §5.1: “`l = 2` included” | The matrix classifications and étale coefficients were extended; the named Betti lattice remains localized at 2 (S01), and the added example has order 4, not 2 (S02). The rank-two dihedral obstruction is valid. |
| 1b/F01 | Repaired by declared gap | README §7.12 and exact contract: “gap:slopes-of-indecomposable-convergent-isocrystals” | Same named supplier and slug in plan.json; DK17 lines 122–126 and 296–297 state the slope bound and dense-open full faithfulness. Slopes `(2,0)` have gap 2 and require decomposability. |
| 1b/F02 | Repaired | README §4.4: “the scalar ... is excluded at zero instead” | Same `N=9,n=6` calculation as 1a/F09. `ζ₉³` has sixth power 1 but fails translation invariance of B. |
| 1b/F03 | Repaired | README §§9.3–9.4 now state “ordinary” and include §8.1 in Needs | Negative valuation at the coefficient prime supplies weights `M,…,M+n−1`; self-dual twisting gives 0,…,n−1 after adjoining `ζ_N` locally. Positive valuation at the auxiliary prime instead uses §7.8. |
| 1b/F04 | Repaired | Exact twisted-modular-curve contract now ends with “geometric mod-p monodromy ... `SL₂(𝔽_p)`” | The unsupported integral good-reduction model is absent in both README and plan.json. A ramified level representation is no longer asserted to extend over the good integral base. |
| 1b/F05 | Repaired at the requested proof-route level | README §0.11: “Kantor ... Theorem II” and the three-step class/normalizer argument | KANTOR79 lines 250–267 classify single-class generated groups; the repair supplies a reduction to that case. In odd characteristic the dimension-two exception has order 120; characteristic-two `S₇` has order 5040. The classification is still a substantial unformalized theorem. |
| 1b/F06 | Repaired | README §5.2: “eigenvalue multiset ... stable under inversion”; §7.13: “ordinarity ... is a property of the reduction” | With norm-one x of order 4, the multiset `{x,x,−1,1,…}` lacks `x⁻¹`. The rewritten paragraphs no longer reproduce the two source sentences. Generic slopes `(2,1,0)` sum to 3; `(3/2,3/2,0)` shows why the generic open is necessary. |
| 1b/F07 | Repaired | README §3.1 defines `ρ_b` by monodromy “`ζ_N^b` on `γ₀`” | For `B={1,2,398}`, cyclic gaps `(4,1,396)` differ from all rotations of `(1,4,396)` for `−B`. The inverse orientation is excluded. |
| 1b/F08 | Repaired | README Kept variants: “lists ... need not be stable under `Gal(M/ℚ)`” | HypergeometricMotives §5.0 constructs cyclotomic data over ℚ; multiplying Qian's B by 2 gives `{2,4,395}`, not B. No identification with that ℚ-coefficient construction is claimed. |
| 1b/F09 | Repaired | README §5.12: symplectic connectedness “is ... §2.14 and is cited, not a target here” | ModularityAndLanglandsExtensions §2.14 API explicitly owns paired trivializations and geometric connectedness. The local integral/Betti enhancement and linear/unitary torsors remain distinct targets. No reverse citation appears in the supplier's Needs. |

### Sampled adversarial record

The full audit covered 84 numbered README targets; 18 sampled rows are retained below, alongside the finding witnesses and Lean/convention tables. Each records computed values, not a proof of the general theorem. Global conventions exclude rank zero and `N<3` in geometric layers; the Lean table tests their total-function values. Fields exclude the zero ring, finite fields have `q≥2`, and smooth finite-type inputs exclude non-quasi-separated spaces and square-zero thickenings.

| README target | Instances and computed values on the relevant sides | Result / change |
|---|---|---|
| 0.4 | Diagonal negative control: product I, displacement rank 2; common-eigenvalue example has intersection `{1}`; companion spectra `{1}` and `{2,4}` in `𝔽₇` are disjoint. | Repaired Check works. |
| 0.11 | In `𝔽₉`, exceptional rank-two group has 120 elements versus subfield orders 24,720; in char 2, S₇ has 5040 versus Sp₆ order 1451520. | Both exceptional regimes accounted for; inventory S06. |
| 1.4 | Qian `(401,3)` gives `{1,2,398}`, sum 401; `(501,4)` gives `{1,2,3,495}`, sum 501. Non-zero-shaped `(1,1,2,2,4)` at N=5 gives B={0,2}. | Rank alone does not imply sum B=0 or zero avoidance. |
| 2.1 | Fermat cubic exponent triples give grades 0,1 and two lines; `(1,2,0)` gives dimension 0. Quintic count `(4⁵−4)/5=204`. At char5, p-adic étale H¹ of supersingular cubic is 0 instead of 2. | Invertible coefficient prime and inverse-pullback convention matter. |
| 2.3 | Hesse trivial eigenspace has rank 2, other characters rank 0; full quintic rank 204 differs from a rank-2 eigenspace. At λ above2 the old Betti quotient is 0. | Étale constructions consistent; Betti extension S01. |
| 2.5 | N=5,n=2 real rank is 2 and ambient complex coefficient restriction has rank 4; projector denominator `2·125=250` is invertible in O⁺ but not at 2. N=3 violates strict N>n+1. | Real coefficient localization explicit. |
| 4.4 | N=9,n=6: `c=ζ₉³` has c⁶=1 but B+3≠B; Qian rank3 has unique singleton run `{398}`. | Removed coprimality restriction justified. |
| 5.1 | `(N,n,l)=(401,3,5)`: residue degree25; l=3: degree400 with 3²⁰⁰=−1. At `(3689,3,2)`, degree120 but h∞ order4. | SL/unitary separation works; S02. |
| 5.10 | N=5, primes above11 have trace squares9 and5; product order1742400. Repeated prime above3 has order720, not1320. | Main product argument holds; S04 fixes Check. |
| 5.11 | n=2,k=𝔽₁₁: pairing torsor size1320, incompatible determinant2η gives0 points; n=3,l=7 order5630688 but N>400 forbids split degree1. | Pairing compatibility correct; S03 fixes unavailable instance. |
| 6.2 | n=0: empty products1=1. N=5,n=2: determinant11³=1331→2 mod3. Even N=2 permits `g(1)²=−q`; odd N excludes it. | Domain and parity hypotheses retained. |
| 6.3 | N=301,l=3: inversion exponent j≡21 mod42 is odd, incompatible with j≡0 mod4 needed to fix ζ₅; rank2 product still q=5⁴². | Product descent does not require impossible simultaneous automorphism. |
| 7.1 | Qian N=401: id-embedding grades198,199,200; conjugate grades199,200,201. E=ℚ_l,V=ℚ_l,K/ℚ_l quadratic: V has dimension1 over E, while D_dR has dimension1 over K. | Inverse coefficient action and scalar rings distinguished. |
| 7.9 | n=3: `(θ_c²)(θθ_c)(θ²)=(θθ_c)³=ε̄⁻³`; inverse convention gives ε̄³. | Coefficient/base-prime and ramification conventions retained. |
| 7.12 | Decomposable slopes2,0 violate gap≤1; Kummer extension over 𝔽_{p²} has valuations0,2 and degree2, normalized0,1. | Normalization and indecomposability required; declared inputs present. |
| 8.1 | N=5,t=1/2 at2: weights0,1, nilpotency2. Negative control φ slopes1,2 with filtration0,3 has t_H=t_N=3; subline has Hodge0≤Newton1, yet no ordinary weight match. | Consecutive weights genuinely used. |
| 9.6 | p=3,m=2: exponents2,6 mod8 distinct, but supplier bound3>4 false; m=p+1 makes exponents equal modulo p²−1. | S05; main irreducible reduction range valid. |
| 9.12 | `(n,m)=(2,3)` and `(3,2)` both yield weights0,…,5, rank6, determinant ε⁻¹⁵; `(1,2)` gives rank2. Alternating⊗skew-Hermitian is Hermitian, requiring rescaling. | Tensor parity, small branch and avoidance field retained. |

### Lean declarations, complete contexts and boundary evaluations

All twelve declarations have explicit binders; there is no ambient `variable` block. `Type*` universes for distinct field/coefficient parameters are independent. I compared every declaration with the supplied elaborated `#check @name` output and its README section. I did not execute Lean: this review's read-only instruction forbids builds, and the unchanged head already has the worker's elaborated signatures. No signature lost a hypothesis. Field instances imply nontriviality; `[Finite]` is retained wherever used. The finite-domain Gauss definition uses `finsum`, so it does not introduce a missing global `Fintype` binder.

| Declaration and README section | Retained variables / instances / assumptions | Values computed; signature result |
|---|---|---|
| `transvection_group_classification`, §0.11, line73 | K: Field, Finite; l: prime, CharP K l, l≠2; n>2; G subgroup GL(Fin n,K); closure of its rank-one square-zero displacements equals G; no proper nonzero invariant submodule over AlgebraicClosure K. | G=SL₃(𝔽₃): determinant1 branch; trivial G fixes a 1-dimensional proper subspace and fails hirr. Skew J in odd characteristic has zero diagonal; in odd dimension detJ=−detJ forces detJ=0, so the Sp branch enforces even dimension without a separate binder. |
| `transvection_group_classification_two`, §0.11, line102 | K finite field, prime l, CharP, l≠2; G subgroup GL₂; same generation and absolute irreducibility conditions. | GL rather than SL is harmless: det of every generating `I+u` is1. Exception at l=3 has order120; candidate subfield groups in 𝔽₉ have24,720. No lost determinant assumption. |
| `qianIndexSet`, §1.4, line122 | N,n natural numbers; no instances or arithmetic hypotheses in the total definition. | `(401,3)→{1,2,398}`, `(501,4)→{1,2,3,495}`. At `(0,0)`, `ZMod 0=ℤ` and the value is `{1,2,3,−6}`; at N=1 all values coalesce to `{0}`. Headlines exclude these junk cases by N>100n+100 and n>2. |
| `selfDualIndexSet`, §1.4, line130 | N,n naturals; no ambient variables. | `(7,2)→{3,4}`, `(5,4)→{1,2,3,4}`, n=0→∅; `(0,2)→{0,1}` in ℤ because natural subtraction truncates. Sp headline requires n=2m≥4 and N>2m+1. |
| `ZeroShapedDatum`, §1.4, line135 | N,n naturals; field a:Fin N→ZMod N; proof fields sum0, zero count n+1, injectivity on nonzero values. | N=3,a=0 forces n=2; N=5,a=(1,0,0,0,4) gives n=2 and B={2,3}. N=0 would require0=n+1 and is impossible; N=1 forces n=0. The field counts imply n+1≤N. |
| `ZeroShapedDatum.indexSet`, §1.4, line146 | N,n; `[NeZero N]`; D:ZeroShapedDatum N n. | N=3,a=0 gives B={1,2}, cardinal2; N=1,n=0 gives B=∅, cardinal0; zero never belongs because a has a zero. Complement of negative values, not the values themselves. |
| `qian_hypergeometric_group_eq_SL`, §5.1, line157 | k finite field; prime l/CharP; Odd N, n>2, N>100n+100; primitive ζ; field generated by ζ; no power of l is −1 modN; actual matrices, two characteristic polynomials, rank displacement≤1; arbitrary g. | Identity has det1 and belongs to generated group. Rank-zero displacement would force common eigenvalue1 and cannot satisfy the two characteristic polynomials. N=3689,l=2 is admitted; N=401,l=3 fails hminus. Both directions of the iff concern the same subgroup. |
| `selfDual_hypergeometric_group_conj_Sp`, §5.2, line176 | Independent finite fields k,K; Algebra k K; prime l, CharP K l, l≠2; Odd N,m>1,N>2m+1; primitive ζ; fieldRange k equals closure of ζ+ζ⁻¹; matrices indexed Fin m⊕Fin m; mapped characteristic polynomial and rank≤1. | m=2,N=7,l=3 gives extension degrees3 and6, matrix dimension4. Algebra map is injective for fields. Native Sp's `AJAᵀ=J` equals `AᵀJA=J` for invertible A; at A=I both give J. No row/column mismatch. |
| `qian_hypergeometric_group_conj_SU`, §5.3, line196 | Same finite-field/Qian conditions, with σ:k≃+*k and σζ=ζ⁻¹ replacing hminus; actual pair and charpoly/rank hypotheses. | σ²ζ=ζ; generator hypothesis forces σ²=id. Since N>400, ζ≠ζ⁻¹, so σ≠id. At l≡−1 modN σ is Frobenius; determinant-one is expressly included, excluding diag(x,1,…), norm x=1 but x≠1. |
| `qian_two_prime_hypergeometric_group`, §5.4, line215 | Two independently universed finite fields; prime l₁,l₂ and corresponding CharP; l₁≠l₂,max>10; common N,n and Qian bounds; two primitive generators, field-generation and hminus assumptions; both matrix pairs and both rank conditions; g in product GL. | For5,3209 and N=401 both branches apply. Repeating a pair would give diagonal order #H instead of #H², but fails l₁≠l₂. g=(I,I) gives true↔(1=1∧1=1). |
| `qianGauss`, §6.2, line241 | F finite field; R commutative ring; N natural; χ:MulChar F R, ψ:AddChar F R, a:ZMod N. No domain assumption on the definition. | F=𝔽₂,R=ℂ,ψ(1)=−1 gives g(0)=1. Dual numbers give1+ε. In the zero coefficient ring the actual sum is0=1; the docstring's nontrivial-character premise cannot hold. |
| `zeroShaped_gauss_product`, §6.2, line250 | F finite field; R commutative domain; NeZero N, Odd N; D zero-shaped; orderOf χ=N; ψ primitive. | n=0 and N=1 both give1=1. N=5,n=2 gives `g(2)g(3)=q`, left `q⁵`, right `q²q³=q⁵`. D implies n<N, so N−n does not truncate; odd N makes n(N−n) even. N=2 quadratic χ can give−q and is excluded. |

There are seven theorem declarations, four definitions and one structure, all read in full. Every theorem has `sorry`; no data body does. The one-tactic probe does not identify padding: the two classifications quantify over arbitrary irreducible groups, the four hypergeometric conclusions determine the full generated groups, and the Gauss identity needs the zero-shaped multiplicity calculation in addition to pairwise Gauss identities. `qianGauss` is a simple sign adapter needed to state that identity. Pinned `gaussSum_pow_eq_prod_jacobiSum_aux` is a power identity involving successive Jacobi sums, not this multiplicity/index-set theorem.

Headline inventory: §0.11's classifications; §3.4's Katz comparison; §§4.4–4.6's unipotence and companion realization; §§5.1–5.6,5.8,5.10's residual images and §5.12's torsor irreducibility; §6.2's determinant identity; §§7.4–7.13's Hodge, crystalline, ordinary, compatible-system and generic-slope results; §8.1's infinity ordinarity; §§9.3–9.4,9.10–9.12's switches and auxiliary systems. The seven statable finite-data headlines are present. The geometric headlines are listed as unavailable with actual missing cohomological/sheaf/period carriers. S06 records the additional characteristic-two classification omitted from this inventory.

### Conventions and definitions audit

| Convention | Positive computation | Wrong convention / excluded boundary |
|---|---|---|
| Inverse pullback on Fermat cohomology | Cubic `(1,1,1)` gives grade0, `(2,2,2)` gives1. | Pullback on `Ω/F` has character `(1,1,1)` but grade1; exchanging the action exchanges the labels. |
| Geometric Frobenius and Tate twist | `ℚ_l(1)` gives q⁻¹; elliptic H¹ determinant q. | Arithmetic Frobenius inverts these values. |
| Hodge weights | Twist1 sends `{1,2}` to `{0,1}`; ε has weight−1. | Supplier HT convention gives ε weight+1, explicitly translated. |
| Fundamental characters | Over unramified quadratic extension, `θθ^p=ε̄⁻¹`; ramification e=2 at5 sends residue unit2 to cyclotomic value4. | Omitting e gives2 instead of4. Restriction to ramified extensions is not replacement by their fundamental characters. |
| Hermitian matrix convention | In `𝔽₉`, `B(1,i)=−i`, `B(i,1)=i`; conjugation exchanges them. | Bilinear xy gives i in both slots and fails the conjugate-symmetry law. |
| Loops and matrix order | `B⁻¹·BA⁻¹·A=I`. | Using `A⁻¹B` in that middle position generally leaves the commutator `B⁻¹A⁻¹BA`. |
| Normalized Gauss sum | Over 𝔽₇, cubic determinant eigenvalues −J,−J̄ give9 points. | Removing the sign gives trace+1 and7 points. |
| Coefficients | `401^399` is a unit in M_λ but not O_λ at401; 2 is a unit in O. | Rational reduction and the old O-Betti reduction at2 both give zero. S01 addresses the latter. |
| Real coefficient field | N=5,l=3: degrees2 and4, fields9 and81. | ζ₅ has order5, impossible in the 8-element multiplicative group of 𝔽₉. |
| Tensor pairing | alternating sign−1 times skew-Hermitian sign−1 gives Hermitian sign+1. | Skipping the nonzero trace-zero scalar in §9.12 when n is even gives the wrong pairing type. |

All 323 README Check bullets were read alongside their sections. The sampled target, Lean and convention tables retain discriminating computations, including rank0/1, characteristic2/3, nonreduced coefficients, empty products, ramified inertia, small-field exceptions, repeated primes, identity matrices, total-function junk values, both directions of the matrix-membership iff statements and nonabelian S₃ examples. They do not certify every deep theorem by example. The final Hesse, Qian `(401,3)` and self-dual `(5,2)` worked examples were also compared with these computations.

### Suppliers, declared gaps, ownership and order

The seven plan gap slugs match the seven README contracts, each with a named earlier supplier. None has supplier `none`. They concern tame specialization, curve companions, twisted modular curves over number fields, algebraic infinity types, existence of ordinary/supersingular prime-field curves, Griffiths residues and generic convergent-isocrystal slopes. No finding is raised merely because these declared targets have not yet been delivered. Examples fixing their scope are respectively `d=2` giving `2 log T`; a rank-one constant companion; r=3,p=2 prime-to-r monodromy; pairs `(2,0),(1,1),(0,2)`; traces0 and1 at every prime; cubic poles1,2; and the forbidden indecomposable slope gap2.

Supplier sections were resolved against the readable main/open heads, not against remembered numbering. The following table gives the inspected ownership interfaces; source file names here mean `TauCetiRoadmap/<Name>/README.md`.

| Supplier | Sections / declarations inspected | Boundary or ownership distinction |
|---|---|---|
| CFSGBasicProperties | T1–T2, ordinary/twisted indices | Derived central quotients; excluded C₂(3) is not silently imported. |
| ClassicalArithmeticCompletion | 2.46,2.60 | Companion subdiagonal convention and monic minpoly/charpoly. |
| HypergeometricMotives | 3.1,3.2,3.4; 5.0 | General-field Levelt already owned; toric cyclotomic ℚ-coefficient sheaf differs from Qian's nonstable character lists. |
| EtaleCohomologyFoundations | F.0.2,F.0.A2,F.2.1,F.2.4–F.2.7,F.3,F.4.2,F.4.5,F.6 | Finite étale/lisse adapters and geometric exact sequence; annihilator invertibility only where needed. |
| ComplexComparisonPartII | C5.2,C5.3,C6.5,C6.6 | Relative Betti and Hodge bundles; residue filtration is a declared extension. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.0.T2,IG.0.T3,IG.1.3 | Named trace formula exists in supplier, not at pin; tame boundary specialization distinguished from local-point gap. |
| FourierDeligneTransform | 2.3,2.6 | Inverse-character torsor convention gives ω, not ω², at q=7,x=3. |
| CharacterSumsOverFiniteFields | 2.4 | Multiple Jacobi sums and diagonal counts; package adds eigenline application. |
| DeligneWeightsAndPurity | 0.1,3.2,7.15,8.19 | q>1; purity and geometric, not arithmetic, semisimplicity. |
| EtaleDualityAndPerverseSheaves | 0.5,0.6,4.3 | Integral Ext term; outside-middle generators and torsion-freeness. The omitted degree bound is S08. |
| LefschetzPencilsAndVanishingCycles | 0.5,0.8a,1.1,1.6,2.4,2.7,2.8 | Ordinary quadratic point hypotheses; monodromy excludes dimension0; local specialization is separately declared. |
| ArithmeticGaloisRepresentations | 2.4 | WD adapter with `ρ=exp(Nt_l)`. |
| PadicHodgeTheory | 3.2–3.4,3.6,6.1,6.4,8.1–8.2 | Weight signs and coefficient/base field distinction; consecutive-weight criterion. |
| LocalGaloisDeformationRings | 1.7,6.8,6.19,6.25 | Ordinary flags, connection relation, local models; S05 records dropped `p>nm`. |
| PadicDifferentialEquationsAndRigidCohomology | RD.2.3,3.34,3.37,3.43,5.8,7.7 | Overconvergent/convergent functors and their full faithfulness; slope/companion gaps explicitly separate. |
| SchemeAndStackFoundations | 1.15,1.16 | Finite group torsors and twisting, not coherent Hom as an étale cover. |
| AbelianSchemesAndArithmeticModuli | A6.30,A6.31 | Finite separable restriction splits into conjugate factors. |
| AlgebraicModuliForArithmeticGeometry | 3.4 | Relative Hom/Weil restriction and base change. |
| ArithmeticGaloisDuality | R02.4.6 | Algebraic-closure-valued roots; package derives finite-residue-field roots. |
| BelyiMaps | 5.2,5.6 | Peripheral order `p₁p₀p∞=1` is explicitly converted. |
| Chebotarev | Layer10 | Density #C/#G; not density-one irreducibility as large image. |
| ModularCurves; ModularCurvesPartII | 5C;5.14 | Existing ℚ-twists/compactification; arbitrary-number-field contract declared. |
| EllipticCurves | Layers3–4 | Ordinary/supersingular reduction and torsion criterion; existence gap specifies every prime. |
| GlobalNumberFields | Layers9–10 | Hecke character and purity carriers; prescribed infinity-type existence declared separately. |
| PotentialModularityAndCompatibleSystems | 1.1,1.3,1.4,1.7,1.9,1.11,2.14–2.18,2.20 | All-member indexing, tensor/induction, nested fields, prescribed completions and jointly surjective specialization. |
| ModularityAndLanglandsExtensions | 2.9–2.12,2.14,2.18 | Fibre realization, semistable comparison/ordinary criterion, symplectic torsor connectedness and auxiliary elliptic primes. |
| PotentialAutomorphyInfrastructure | 2.20 | Density-one crystalline large image, rank2 and strong irreducibility. |

Object searches used `roadmaps grep` on Dwork eigensheaves, hypergeometric sheaves, transvection-generated groups, Griffiths/pole-order Hodge theory and indecomposable slopes, across open heads and main. Existing ownership is preserved by the Levelt, MLE, Kummer, complete-intersection, finite-classical-group and Hecke contracts above; the new relative eigensheaves and noncyclotomic hypergeometric lists explain this package's ownership. No duplicate fully qualified name of its twelve declarations was found in the readable sibling files. The overlap lead identifies the source roadmap pull request mirrored by this package, not a second copy on content main; no dropped target id or revision-only section was reported. No forbidden supplier name occurs in the package's supplier list.

The citation leads for `VanishingCycles.etaleTraceFormulaFinite`, `finiteEtaleGaloisCategory` and `lisseMonodromyEquiv` resolve to the named suppliers' prose declarations. `ZeroShapedDatum.indexSet` is declared here; `injOn_nonzero` is a structure projection. Their absence from pinned library declarations is not supplier drift.

The required dependency checker was run read-only on this README at this head. Exact output:

```text
depcheck: 239 roadmaps, 2171 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` lists eleven changed files, all inside this package folder. README and Suggested.lean contain no pull-request numbers or process directives; Suggested.lean has exactly `import Mathlib`, the prescribed namespace, no `set_option`, no `lemma` declaration and no admitted data. No computational algorithm is a roadmap target.

### Source locators and expression

The following ledger counts named source items once even when several package targets cite them. “Verified” means the locator, hypotheses and use were compared, not that an erroneous source statement was accepted. Corrections are recorded below. Pagination follows the versions explicitly identified in the README, not the journal pagination where those differ.

| Source | Numbered items examined (51 total) | Text witness and comparison |
|---|---|---|
| QIAN23 | Lemmas 3.1,3.4,3.6,3.8–3.10; Corollary3.5; Proposition3.7 (8) | Lines465–521,628–815,950–1042. Index-set rigidity, companion orientation, determinant products and coefficient-twisted Hodge filtration match the intended objects. The package separately justifies its extensions beyond the source's coprimality and coefficient exclusions. |
| QIAN21 | Theorem1.1, Remark1.2, Theorem1.4, Proposition1.5, Lemma4.2 (5) | Lines44–76,98–117,919–926. The package imposes zero-shaped data and consecutive weights where the two broader source assertions fail. |
| BCGNT25 | Theorem4.2.1; Lemma4.2.4; Propositions4.2.5–4.2.6; Definition4.3.1; Remark4.3.3; Lemma4.3.4; Proposition4.4.2; Remark4.4.3; Lemma4.4.4; Theorem6.2.4 (11) | Lines2029–2185,2310–2348,2388–2450,3160–3325. Normalizations, determinant restrictions, generic-open argument and auxiliary-system proof were compared. The full-GU and inertia-sign corrections are necessary, not cosmetic. |
| BLGHT11 | Lemma4.6; Corollaries4.7–4.8; Lemma5.1 (4) | Lines1182–1282. The symplectic trace-field argument and two-prime Goursat proof are used with their rank and characteristic conditions; the infinity Frobenius formula needs the corrections below. |
| KATZ09 | Theorem5.3; Corollary8.7; Lemma8.8 (3) | Lines493–514,1223–1254. The comparison is up to a constant twist. Lemma8.8 concerns the indicated invariant family; it is not by itself a theorem for every exponent vector. The general local-monodromy input is the separately cited KATZ90. |
| DK17 | Theorems1.1.5,1.3.3,2.2.3 (3) | Lines122–126,210–233,296–297. Generic, degree-normalized slopes and dense-open full faithfulness are essential. The first and third are declared supplier contracts; the lisse consequence is derived here. |
| BLGGT14 | Theorem3.1.2; LemmaA.2.4 (2) | Lines1852–1882,4110–4145. The symplectic switch uses the prescribed negative-valuation opens; the infinity-type existence condition is constant conjugate pair sums. |
| DMOS82 | Propositions7.4,7.6,7.10 (3) | Lines2140–2153,2176–2207,2300–2337. Fermat eigenlines, residue Hodge grades and Gauss products were compared, including inversion of pullback labels. |
| BH89 | Proposition3.3; Theorem3.5; Proposition6.1 (3) | Lines280–312,809–822. Irreducibility, simultaneous companion conjugacy and the invariant bilinear-form condition are used with disjoint spectra and the correct generator order. |
| BER10 | Théorème3.2.1(1) (1) | Lines617–646, with §1.3 at365–386. The representation convention is dualized for cohomological weights. The full small-weight reduction range is larger than the local-model supplier's range (S05). |
| CEGS | §1.4, fundamental-character convention (1) | Lines211–237. The product of residue-field characters has to be raised to the ramification degree to recover cyclotomic inertia. |
| ACC23 | Theorem7.1.11, proof (1) | Lines8416–8468. Twisted-curve local points use actual torsion identifications and good ordinary/supersingular curves, not an integral model of every twist. |
| ACAMPO24 | Definition2.1.2; Lemma2.5.3; Proposition2.5.7 (3) | Lines307–318,913–915,972–983. Infinity blocks justify the non-zero-shaped negative control. The even-degree claim at the other puncture is false and is not imported. |
| DICKSON01 | §260 summary (1) | Lines10079–10125, printed285–286. The subgroup alternatives support the rank-two binary-icosahedral exception after the central lift. |
| WATERHOUSE69 | Theorem4.1 (1) | Lines616–650, printed536. For q=p, traces0 and1 provide supersingular and ordinary curves, including p=2,3. No computational construction is demanded. |
| KANTOR79 | TheoremII (1) | Lines250–267, printed352–353. It classifies a group generated by one conjugacy class; that restriction and the characteristic-two exceptional representations must remain visible. |

For wording, the target statements at these 51 locators were compared with the corresponding source statements or proof steps. In addition, the following five prose passages were compared separately: §0.11's proof plan against KANTOR79 lines250–267; §2.1's residue proof plan against DMOS82 lines2176–2207; §5.2's rewritten inversion argument against BLGHT11 lines1182–1247; §7.13's rewritten ordinary-open argument against BCGNT25 lines2131–2185; and the `qianGauss` docstring against QIAN23 lines776–788. No remaining passage in these comparisons reproduces distinctive source prose or its clause sequence. Shared formulas, standard group names and forced hypotheses are not treated as copied expression. No source figure, exercise list or numerical table is reproduced in the package.

The locator-share count uses explicit author-attributed citation callouts before the bibliography, retaining repeated callouts and counting a parenthesis containing several locators once. There are 189 such callouts: QIAN23 55; BCGNT25 45; BLGHT11 45; BLGGT14 9; KATZ09 6; DK17 4; KATZ90, DMOS82 and BH89 3 each; QIAN21, CEGS and ACC23 2 each; BER10, ACAMPO24, LEWIS82, KM74, KIS99, ARTIN55, ZS76, DICKSON01, WATERHOUSE69 and KANTOR79 1 each.

QIAN23 has the largest share. Its section inventory is §1 introduction, §2 preliminary lemmas, §3 Dwork motives, §4 proof of the main theorem (QIAN23 lines15,202,441,1043). The roadmap's ten layers do not map one-to-one onto that sequence: Layer0 combines finite-group inputs from several sources; Layers1–7 separate geometry, eigen-cohomology, hypergeometric comparison, monodromy, residual images, determinants and local Hodge theory that QIAN23 places together in §3; Layer8 imports the separate semistable-ordinarity route of QIAN21; Layer9 combines Qian's switch with the BCGNT25 auxiliary constructions. The dependencies §4.5→§5.1→§5.5→§5.12→§9.3 and §§6.2,7.2→§7.8→§9.3 force the relevant mathematical order. BCGNT25's contents at lines15–42 were also compared: moving finite groups before geometry, extracting determinants and retaining the independent self-dual branch prevent a matching run of its sections.

## Not verifiable

- LEWIS82 §4; KM74 Theorem2; KIS99 Theorem5.1; KATZ90 Chapter8, Theorems8.4.11 and8.12.2(1a); ARTIN55 Theorem2; and ZS76's main theorem remain settled **uncertified** citations. Their original text was not available in the supplied legal cache. No new request for these texts was made. Readable secondary applications were checked where supplied; they do not certify the unavailable original wording.
- No Lean command was run and no proof was completed. All twelve existing elaborated signatures were compared with the current source. This checks binder retention, not truth or future provability. The seven `sorry` theorems remain unproved.
- The seven declared supplier gaps remain contracts. Their existence, stated hypotheses and ownership were checked; future implementations and proofs cannot be verified at this head.
- Numerical instances and source comparisons cannot certify all extensions of published proofs, notably the integral characteristic-two geometry until S01 is implemented. The classification reduction in §0.11 is a proof plan; it is not a formal proof of the three-step reduction.
- The report certifies the locators enumerated above and the supplied version identifiers. It does not certify unpublished corrections or unseen later versions. No unknown source host or external formalization reuse was identified.

Source independence: 56 passages compared with 16 sources; no remaining expressive copying found in those comparisons; largest share QIAN23, 55 of 189 citation callouts; contents compared with QIAN23 and BCGNT25: no one-to-one source arrangement. Six settled uncertified works were not available for wording comparison.

## Source issues

The following are source-text issues, not additional package findings. Several are already corrected in this package. No published correction was verified.

- **Misprint** in QIAN23 at the convention before Lemma3.9, arXiv v1 p.19 (QIAN23 line978): the source says the chosen embedding sends ζ_N to an n-th root; it should be the primitive N-th root; affects the proof.
- **Error** in QIAN23 at §4, arXiv v1 p.22 (QIAN23 line1128): the source says n divides the residue-field multiplicative order; it should be the prime-to-l part of n when l divides n; affects the proof.
- **Misprint** in QIAN23 at §4, arXiv v1 p.22 (QIAN23 line1132): the source says the determinant of the symmetric power of elliptic H¹ is the positive cyclotomic power; it should be the negative power; affects the proof.
- **Error** in QIAN21 at Remark1.2, arXiv v1 p.2 (QIAN21 line57): the source says any zero exponent implies maximal unipotence at infinity; it should require a single surviving Jordan block, as zero-shaped data provide; affects a stated result.
- **Error** in QIAN21 at Lemma4.2, arXiv v1 p.20 (QIAN21 line919): the source says maximal monodromy implies ordinary; it should additionally impose the consecutive labelled Hodge weights used in the application; affects a stated result.
- **Misprint** in BCGNT25 at Lemma4.2.4, arXiv v3 p.41 (BCGNT25 line2058): the source says the norm exponent is N−n; it should be N−n−1; affects a stated result.
- **Misprint** in BCGNT25 at the proof of Lemma4.2.4, arXiv v3 p.42 (BCGNT25 line2064): the source says the duality twist of V is 1−N; it should be 2−N; affects the proof.
- **Misprint** in BCGNT25 at the proof of Proposition4.2.6, arXiv v3 p.43 (BCGNT25 line2149): the source says the unit-trace assertion holds for every point of T₁; it should quantify over the open subset U₁ just introduced; affects the proof.
- **Error** in BCGNT25 at Definition4.3.1, arXiv v3 p.45 (BCGNT25 line2312): the source says SU is the multiplier kernel; it should intersect that kernel with determinant one; affects a stated result.
- **Misprint** in BCGNT25 at Remark4.3.3, arXiv v3 p.45 (BCGNT25 line2322): the source says the scaled pairing equals minus its own conjugate with unchanged argument order; it should interchange the arguments on one side; affects a stated result.
- **Error** in BCGNT25 at Lemma4.4.4, arXiv v3 p.48 (BCGNT25 line2436): the source says the fundamental-character exponents are positive; it should negate them with its stated reciprocity and cohomological conventions; affects a stated result.
- **Misprint** in BCGNT25 at the proof of Lemma4.4.4, arXiv v3 p.48 (BCGNT25 line2442): the source says the Fermat eigenspace is in degree N−1; it should be degree N−2; affects the proof.
- **Error** in BCGNT25 at the proof of Theorem6.2.4, arXiv v3 p.67 (BCGNT25 line3312): the source says the auxiliary residual image is full GU; it should be the actual arithmetic image containing SU, with prescribed cyclotomic multiplier and determinant; affects the proof.
- **Error** in BLGHT11 at Lemma5.1(2), author pp.34–35 (BLGHT11 lines1269–1273): the source says the untwisted eigenvalues start at ±1 and use the ground residue cardinality; it should use the extension's residue cardinality and include the Tate factor of exponent (N−1−n)/2; affects a stated result.
- **Misprint** in ACAMPO24 at Definition2.1.2, arXiv p.8 (ACAMPO24 line310): the source says the complementary list starts at s₁; it should start at s₀ to have d−n entries; affects a stated result.
- **Error** in ACAMPO24 at Proposition2.5.7, arXiv pp.19–20 (ACAMPO24 lines980–983): the source says puncture-one monodromy is unipotent and trivial in even degree; it should be a rank-one reflection of determinant −1 in even degree, consistent with Lemma2.5.3; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b48ff77abe8c56ce859050f0b0884a6b34792e8f", "job": "RT-PotentialAutomorphyDworkMotivesPartII~2a", "model": "gpt-6-astra", "worker": "chris-10"} -->
