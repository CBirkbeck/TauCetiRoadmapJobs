<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6794691649 -->
Red team round 2 pass b (claude) of c4e8cd3

Verdict: needs_changes

1. **F01** (P2) The standing hypothesis on E is vacuous as typed

   **Location.** README 85–86: "E/ℚ_p is a finite extension containing σ(K) for every embedding
   σ : K ↪ E, and Σ_K is the set of these embeddings, so #Σ_K = d_K."

   **Claim.** (H) makes E a splitting field of K, so that there are d_K embeddings.

   **Witness.** K = ℚ_p(√p), E = ℚ_p: there is no embedding K ↪ E, the condition holds vacuously,
   Σ_K = ∅ and #Σ_K = 0 ≠ 2. Theorem 3.5 then reads Ker(t_D) = 0 against dimension c_n·d_K = 2 at n = 3.

   **Repair.** Replace the sentence by: "E/ℚ_p is a finite extension that contains the image of each of
   the d_K embeddings of K into an algebraic closure of E (equivalently, E contains a Galois closure of
   K over ℚ_p), and Σ_K = Hom_{ℚ_p}(K, E), so #Σ_K = d_K." On the witness the new hypothesis fails
   (√p ∉ ℚ_p), so the instance is excluded. DING25 line 389 states it this way.

2. **F02** (P3) §2.2: surjectivity of f_D uses §1.6 and the supplier's §8.12 (1), neither in Needs

   **Location.** README 663–665 and 668–670: "Surjectivity of f_D is a separate input: it uses Ding
   Lemma 3.5(2) … and dévissage over the constituents"; `*Needs:*` §2.1, supplier §1.7, §8.4, §8.9 (2).

   **Claim.** Lemma 3.5(2) and dévissage give surjectivity.

   **Witness.** n = 1, K = ℚ_p, a line L = Eψ ⊂ 𝔈 = `𝔈_{g′}` in place of 𝒦_D: the push-forward
   𝔈 → Ext¹(χ, χ(1 + ψε)) has rank 2 − 1 = 1 in a space of dimension 1 + dim Ker(ψ ∧ ·) = 2. Only
   𝒦_D ∩ `𝔈_{g′}` = 0 (§1.6) excludes this.

   **Repair.** After "dévissage over the constituents" insert: "; the dévissage uses
   𝒦_D ∩ `𝔈_{g′}` = 0 (§1.6) and that 𝔈/`𝔈_{g′}` embeds in ⊕ Ext¹_G(A, `C(I,s_{i,σ})`)
   (LocallyAnalyticRepresentationsOfLocalGroups §8.12 (1))". Change the Needs line to "*Needs:* §§1.6,
   2.1; LocallyAnalyticRepresentationsOfLocalGroups §1.7 (the covariant long exact sequence), §8.4,
   §8.9 (2) and §8.12 (1); Mathlib `LinearMap.quotKerEquivOfSurjective`." Add the Check: "If 𝒦_D is
   replaced by a line L ⊂ `𝔈_{g′}` the push-forward is not onto: for n = 1, K = ℚ_p and L = Eψ, the
   image of 𝔈 in Ext¹(χ, χ(1 + ψε)) has dimension 1 and the target dimension 2 (the class of
   χ·exp(ψε) modulo ε³ is not in the image); transversality (§1.6) is what excludes this." In §2.4,
   replace "because nonzero coefficient directions are nonsplit and Ding Lemma 3.5(2) controls lifts
   through the constituents `C(I,s_{i,σ})`" by "because 𝒦_D → 𝔈 is injective (so soc = A) and
   𝒦_D ∩ `𝔈_{g′}` = 0 (§1.6; so no copy of A lies in the socle of Π/A)", and add §1.6 to its Needs.

3. **F03** (P3) §1.2: the transport (3.18) is used without its supplier section

   **Location.** README 495–496 and 498–500: "Prove that t_F and t_G agree on `𝔈_{g′}` (Ding (3.18)
   and (2.13) with g replaced by g′)"; Needs lists supplier §§9.6–9.7 only on the representation side.

   **Witness.** (3.18) is LocallyAnalyticRepresentationsOfLocalGroups §8.14 (its line "ζ_(w_2) ∘
   (w_2w_1⁻¹) = ζ_(w_1) on Hom_(g′)(T(L), E) ((3.18))"), proved from its §8.8 (2); §9.6 (3) is (3.30),
   a different statement.

   **Repair.** In the §1.2 Needs line write "LocallyAnalyticRepresentationsOfLocalGroups §8.14 (the
   transport (3.18) on `Hom_{g′}`) and §§9.6–9.7". The Layer 1 Dependencies line already covers §8.14.

4. **F04** (P3) Dependencies and contract do not list two sections the targets cite

   **Location.** README 630 and 633 (§2.1 cites the supplier's §6.2), 815 (Layer 2 Dependencies:
   "§§1.7–1.9, 4.1, 6.1, 7.1–7.3, 8.1–8.14"), 211 (contract: "§6.1" only); 1282 (§5.3 cites §8.4
   (1)–(2)), 1356 (Layer 5 Dependencies: "§§1.8–1.9, 7.3, 8.8–8.12").

   **Witness.** §6.2 (exactness of F^G_P in M) is the input of the multiplicity-one argument of §2.1;
   it appears in neither the Layer 2 Dependencies nor the supplier contract.

   **Repair.** Contract bullet: "§§6.1–6.2: the Orlik–Strauch functor F^G_P(M, π) with the U(g)-action
   on F^G_P(M, π) induced from M, and its exactness in M (used in §2.1 for the multiplicity of A in
   PS(w(φ),h))." Layer 2 Dependencies: "…, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14". Layer 5 Dependencies:
   "…§§1.8–1.9, 7.3, 8.4, 8.8–8.12".

5. **F05** (P3) The supplier contracts list sections that no target uses

   **Location.** README 271–273 and 280 (PhiGammaModulesAndIwasawaCohomology §1.2, §§3.4a and 3.6,
   §7.5), 58–59 (the same list in Scope), 247 (TriangulineVarietyAndItsLocalModel §10.6).

   **Witness.** Script scan of Layers 0–5: no `*Needs:*`, proof sketch, Check or Dependencies line
   cites these five sections; they are inputs of TriangulineVarietyAndItsLocalModel §§10.1, 11.1 and
   LocalGaloisDeformationRings §0.4, not of this roadmap.

   **Repair.** Delete "§1.2 (…étale equivalence)", "§§3.4a and 3.6 (…Galois cohomology)" and "§7.5
   (triangulations)" from the PhiGammaModulesAndIwasawaCohomology contract and write the Scope bullet
   as "PhiGammaModulesAndIwasawaCohomology §§1.0, 7.1–7.4 and 7.2a"; delete "§10.6 (the modified
   injection determines the σ-Hodge filtration)" from the TriangulineVarietyAndItsLocalModel contract.
   (Alternatively name the target that needs each and add it to that target's Needs.)

6. **F06** (P3) The rank-one ring is attributed to the supplier for every continuous character

   **Location.** README 296–297: "its rank-one case gives, for a continuous character δ_i of K^×, the
   ring `R_{δ_i}` ≅ `E⟦x_1,…,x_{d_K+1}⟧`"; 1169: "For a continuous character δ = δ_1 ⊠ ⋯ ⊠ δ_n".

   **Witness.** LocalGaloisDeformationRings §1.23 states smoothness and dimensions "For noncritical
   crystabelline `D`", its rank-one Check included. For δ_i not locally algebraic it supplies only
   `PhiGamma.defRing` (End = E), not the power-series form.

   **Repair.** Contract: "its rank-one case gives the ring `R_{δ_i}` = `PhiGamma.defRing` of
   `R_{K,E}(δ_i)` for every continuous δ_i (End = E), and `R_{δ_i}` ≅ `E⟦x_1,…,x_{d_K+1}⟧` for δ_i
   locally algebraic, the case of its hypotheses". In §5.1, after "that both rings are formally smooth"
   add: "(for δ_i not locally algebraic the formal smoothness and tangent dimension 1 + d_K of
   `R_{δ_i}` are proved here from H²(`R_{K,E}`) = 0, PhiGammaModulesAndIwasawaCohomology §7.2, and
   TriangulineVarietyAndItsLocalModel §11.1; only δ = w(φ)z^h and δ = w(φ) are used below)". Tested:
   δ_i = z^k·abs is locally algebraic (supplier case); δ_i = exp(a·log) is not, and H²(R) = 0 still
   gives E⟦x_1,…,x_{d_K+1}⟧.

7. **F07** (P3) §4.1 writes the extension the other way round

   **Location.** README 1035–1037: "let π⁻ and π⁺ be the tautological subextensions of `π_{1,σ}(φ,h)`
   by `Ker(t_{D_σ,F})` ⊗ A and by `Ker(t_{D_σ,G})` ⊗ A".

   **Witness.** README 847–848: "the tautological extension of `𝒦_{D,F_P}` ⊗ A by V" (V the
   subobject); DING25 lines 2505–2506 has the kernel term extended by π_{1,σ}. By that convention the
   quoted sentence makes `π_{1,σ}` the quotient.

   **Repair.** "let π⁻ and π⁺ ⊂ Π be the tautological extensions of `Ker(t_{D_σ,F})` ⊗ A and of
   `Ker(t_{D_σ,G})` ⊗ A by `π_{1,σ}(φ,h)`".

One P2 (the standing hypothesis on E is vacuous as typed) and six P3. No P1. Every round-1 finding is
repaired at this head and no repair introduced an error. Line numbers are those of
`packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md` at c4e8cd3.

## Round-1 findings at this head

| Id | Status | Witness at c4e8cd3 |
| --- | --- | --- |
| 1a/F01 block cutoff | repaired | README 959–962: "The block `M_{i,σ}` is the modification of M_i with the ambient cutoff: it keeps the σ-weights of M_i and gives every weight at τ ≠ σ the value `h_{n,τ}`". Carried into §3.7 (1001), §4.1 (1041–1042), §4.2 (1109–1111). Recomputed: h_τ = (3,1,0), D_1 has (3,1) → (0,0), own cutoff (1,1), twist exponent 0 − 1 = −1; C_1 has (1,0) → (0,0), exponent 0. Agrees with TriangulineVarietyAndItsLocalModel §10.5 Checks. |
| 1a/F02 "canonically" | repaired | README 1320–1322: "The isomorphism is unique only up to the automorphisms 1 + i ∘ f ∘ p of π_min(D) … f ∈ Hom_G(𝒦_D ⊗ A, V) ≅ Hom_E(𝒦_D, E)". (i∘f∘p)² = 0 since p∘i = 0; Hom_G(A, V) = E by soc V = A. |
| 1a/F03 weight sign | repaired | README 90–91: "the cyclotomic character ε has weight +1, so `R_{K,E}(z^k)` has weight `k_σ` at σ". DING25 line 451 normalises the cyclotomic weight to 1; PhiGammaModulesAndIwasawaCohomology §7.2a Check gives Sen label +1 to x·abs and its standing convention gives ℚ_p(1) weight −1. |
| 1a/F04 rank one | repaired | README 119–120: "For n = 1 there is no proper parabolic and F and G are not defined"; 441: "for n = 1 both kernels are zero" (1!·1·(1+d) − 1 − d = 0 on both sides). |
| 1b/F01 R_δ unowned | repaired | README 1169–1170: "define R_δ = `⊗̂_{i,E} R_{δ_i}`, the completed tensor product over E of the rank-one rings `R_{δ_i}` of LocalGaloisDeformationRings §1.23". Residual attribution point: S06. |
| 1b/F02 PhiGamma contract | repaired | README 275–277 lists §7.2 and §7.2a with their uses in §5.1 and §2.6. |
| 1b/F03 Needs lines | repaired | Script scan of all 30 targets: every supplier section named in a target's text is in its `*Needs:*` line. Two inputs used without a section name remain: S02, S03. |
| 1b/F04 End_G(π(φ,h)) | repaired | README 623–624: "restriction gives isomorphisms End_G(π(φ,h)) ≅ End_G(V) ≅ End_G(A) = E", with the multiplicity-one argument (626–632). The Dependencies line did not follow: S04. |
| 1b/F05 gap overlap | repaired | README 315–316: "this gap adds only the completion Ĥ_φ and the isomorphism of Ĥ_φ onto `R_{w(φ),g}`"; `design/plan.json` `gaps[0]` has the same slug, supplier and section. |
| 1b/F06 module for representation | repaired | README 1020–1021: "π_min(M_1) ⊠ π_min(M_2) … where π_min(M_2) is the character `ψz^{h_4}` of K^×". |
| 1b/F07 bare theorem number | repaired | README 327: "Layer 5 reformulates Theorem 1.4 (DING25 Theorem 3.21)". |
| 1b/F08 scope by source section | repaired | README 23–24: "This roadmap owns the comparison between `Ext¹_{GL_n(K)}(π_alg(φ,h), π_1(φ,h))` and the trianguline first-order deformations of D". |

## Adversarial pass: values computed

`Suggested.lean` has no declaration (one module docstring, an empty namespace, `import Mathlib`); its
table is the list of the eight headline entries of the docstring, each checked against the README
target it names and against the pins (below). README targets:

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| (H) Σ_K | K = ℚ_p(√p), E = ℚ_p | literal hypothesis vacuous, #Σ_K = 0 vs d_K = 2 | S01 |
| 0.1 families | n = 1, 2, 3, 4 | n=1 both {id}; n=3: (1 2 3) sends 3→1 (start), (1 3 2) sends 3→2 (neither); n=4, i=2: j=1 → (2 4), j=3 → (1 2), j=2 → (1 2); w_jw(n) = w_j(i) ∈ {1,n} | holds |
| 0.1 coset | c(n) = 1 | (c∘w)(n) = c(n) = 1; (n−1)! each | holds |
| 0.2 block tuples | j = 0, n; n = 3, j = 1 | (b,b,b), (a,a,a); (a,b,b); dim H_j = 2(1+d), dim H_Z = 1+d; H_j ⊂ Hom_{P_j,g′} (dim n + 2d ≥ 2 + 2d) | holds |
| 0.3 telescoping | n = 1, 2, 3 | coordinate i: v_n + Σ_{j≥i}(v_j − v_{j+1}) = v_i; (a,b,c) = (c,c,c)+(a−b,0,0)+(b−c,b−c,0); (2n−1)(1+d) vs n(1+d): 10 vs 6 | holds |
| 0.4 kernels | n = 1; n = 2; n = 3, d = 1 | 0, 0; 2+d, 2+d; 36−10 = 26, 36−9 = 27; dim Ext¹_0 = (n−1)(nd−2)/2: 0, 0 (d=1) or 1 (d=2), 1 | holds |
| 1.1 c_n | n = 0..5 | 0, 0, 0, 1, 5, 16; c_{n+1} − 2c_n = n(n−1)/2: 0, 0, 1, 3, 6 | holds |
| 1.2 gluing | sign (b, −b) vs (b, b); weights (3,1,−2) | t_F(b) − t_G(b) = 0 vs 2t_F(b); h¹ = (3,1), h² = (1,−2) | holds; S03 on Needs |
| 1.3 transport | n = 3, w = (2 3) | j=1: w_1 = (2 3), w_1w = id; j=2: w_2 = (1 2), w_2w: 3→2→1; w_j fixes block tuples, so ζ_{w_jw}κ_{w_jw} = ζ_{w_jw}w_jκ_w = ζ_wκ_w | holds |
| 1.4 t_D | n = 1; uniqueness | t_D = κ⁻¹ζ⁻¹ on Hom(K^×,E); R_D onto ⇒ unique; s_D onto ⇒ surjective | holds |
| 1.5 dim Ker | n = 1..5, d = 1; n = 3, d = 2 | (2,2,0), (5,5,0), (10,9,1), (19,14,5), (36,20,16); (17,15,2) | holds |
| 1.6 transversality | n = 3, ℚ_p | six 6-dimensional 𝔈_w in dimension 10, line meets each in 0 | holds |
| 2.1 π_min, End | n = 2; n = 3; control Ã | 𝒦_D = 0 ⇒ π_min = V; A once in π(φ,h); Ã has ε ≠ 0, ε² = 0 | holds |
| 2.2 f_D | n ≤ 2; n = 3, ℚ_p; control n = 1, L = Eψ | identity; dim Ext¹(A, 𝒦⊗A) = 1·4; control: rank 1 in dimension 2 | S02 |
| 2.3 | n = 3, ℚ_p; n = 2, d = 2 | 9 and 6; Ext¹_g: 1 + n(n−1)d/2 = 4 vs 3, 3 vs 2 | holds |
| 2.4 characterisation | n = 2; n = 3 line L ≠ 𝒦_D with L ∩ 𝔈_{g′} = 0; split | Π = V; Ker f = L ≠ Ker t_D; socle A^{⊕2} | holds |
| 2.5 χ_D | n = 1, 3; λ_σ = (2,0), λ_τ = (5,1) | η(x,…,x) = abs^N; exponent of χ_Dε^{−N} at σ: Σλ − N = Σh; tuple (2, 6) | holds |
| 2.6 HC variable | n = 2, h = (3,1) | λ = (3,2), λ+ρ = (7/2,3/2), e = (5, 21/4); s·h = (0,4) gives e_2 = 9/4; s·(3,2) = (1,4), +θ = (1,3); ρ − θ = (n−1)/2·(1,…,1); Jacobian x_1 − x_2 | holds |
| 3.1 block kernels | (2,1), (3,1), (2,2); general | 0, d, 0; dim 𝔈_{F_P} − dim Q_{F_P} = d·Σ(2^{n_i} − 1 − n_i(n_i+1)/2) = dΣc_{n_i} from the two suppliers | holds |
| 3.2 | P = B, G; n = 4 (3,1) | V, π_min(D); multiplicity d vs 5d | holds |
| 3.3 | n = 3; general | (n + 2^n − 1) − (n + n(n+1)/2) = c_n; supplier value 1 + (d−1)n(n−1)/2 + n² − (1 − n + dn(n−1)/2) = n + n(n+1)/2 | holds |
| 3.5 | n = 3, d = 2 | 1 + 1 = 2; ⊕(𝔈_σ/𝔈_g): (5−2)+(5−2) = 6 = 8 − 2 at n = 2 | holds |
| 3.6 cutoff | n = 3, d = 2, h_τ = (3,1,0) | D_1: (0,0) vs own (1,1), k_τ = −1; t^{k}N ≅ N ⊗ R(z^k) with R(z) of weight +1 | holds |
| 3.7 | n = 2, 3 | 5 = 2 + 3; 3 + 7 − 1 = 9 = 3 + 6 | holds |
| 4.1 | n = 3; general n | dim E⁻_F = n + 2^{n−1} − c_{n−1} = n + 1 + n(n−1)/2 = 7; dim ℒ_Π = 2 + n(n−1)/2 = 5; 14 = 9 + 5; unrestricted 20 − 9 = 11 | holds; S07 on wording |
| 4.2 example | a = 2, 3 | normals (1,−1,1), (1,−1,2); dot products 0; diag(x,x,z)(1,2,1) = (x,2x,z) ∦ (1,3,1); diag(1,1,1/2) maps plane to plane: (1,2,1/2)·(1,−1,2) = 0 | holds |
| 4.2 twist | h_τ = (3,1,0) | D_1: 0 − 1 = −1; C_1: 0 | holds |
| 5.1 A_D | n = 3, d = 1 | tangent of fibre product (Ext¹ ⊕ Hom_sm)/Ext¹_g = Q; dims 10, 7, 3, 11 | holds; S06 on attribution |
| 5.1 R_{δ,g} | n = 2, ℚ_p | 4 and 2; smooth 1 + 𝔪_A-valued characters are unramified (torsion-free target) | holds |
| 5.2–5.4 action | x ∈ Q^∨ on U_w | x∘t_D on 𝔈_w equals (x∘a_w∘κ_w⁻¹)∘ζ_w⁻¹, the image of x in Q_w^∨ ≅ H_T^∨ | holds |
| 5.5 | n ≤ 2; n = 3, ℚ_p | U[𝔪] = V; one copy of A vs ten | holds |
| gap | generic φ | stabiliser of w(φ) in the Bernstein Weyl group is trivial iff the φ_i are distinct, which genericity gives; so the completion statement needs exactly "generic" | precise, minimal |

## Dependency check

```text
depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for this roadmap.

## Verified sound

- **Read.** README 1442 lines, all 30 numbered targets (0.1–0.4, 1.1–1.6, 2.1–2.6, 3.1–3.7, 4.1–4.2,
  5.1–5.5), 118 Checks, all read; every Check with a numerical or two-term content was recomputed
  (table above). `Suggested.lean` 59 lines: 0 declarations, one `import Mathlib`, no `sorry`, no
  `set_option`, no `lemma`; the docstring names all eight README end theorems with the carrier each
  lacks. No headline is statable at the pins: the pinned Tau Ceti has locally analytic distributions on
  ℤ_p (`TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`) but no locally analytic
  representations, Robba ring or (φ,Γ)-modules; the pinned Mathlib has none. No padding (nothing is
  declared). No Lean was elaborated, and the `#check` comparison has no input.
- **Pins.** `TauCeti.hcProjection` (line 437) and `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection`
  (line 403) of `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean`, under
  `[CharZero K] [IsKilling K L] [IsTriangularizable K H L]` as the README says;
  `LinearMap.quotKerEquivOfSurjective`, `LinearMap.finrank_range_add_finrank_ker`,
  `Submodule.finrank_sup_add_finrank_inf_eq`, `LinearMap.prod`, `TrivSqZeroExt`, `DualNumber`,
  `IsLocalRing`, `CategoryTheory.Abelian.Ext` exist in the pinned Mathlib.
- **Locators.** The DING25 locator of each of the 30 targets checked against the text (every theorem,
  remark and display of pp. 47–59 that a target cites, lines 2032–2619), and 14 further ones:
  §2.1 pp. 9–10 lines 388–451, Proposition 2.5
  line 560, Example 2.9 line 617, Lemma 2.11 line 698, Proposition 2.12 line 801, (2.21) line 873,
  Corollary 2.38 line 1367, §3.1.1 line 1416, §3.1.2 line 1465, (3.12) line 1670, (3.16) line 1711,
  the paragraph after (3.30) line 1895, Proposition 3.13 line 1909, (3.33) line 2004. CEGGPS16
  Lemma 3.22 is at line 1921, p. 47. The twelve README Source corrections were re-read against the
  text and hold (Corollary 2.14's sign at line 860); of the entry on (3.12), (3.15) and (3.33), the
  display (3.15) was not re-read.
- **Sibling citations.** 78 cited sections exist under the cited numbers
  (LocallyAnalyticRepresentationsOfLocalGroups 39, at the board package; TriangulineVarietyAndItsLocalModel
  24, PhiGammaModulesAndIwasawaCohomology 10, LocalGaloisDeformationRings 2, PadicHodgeTheory 2,
  SmoothRepresentationsOfLocalGroups 1, at their open heads). Contents compared with the README's use
  for LocallyAnalyticRepresentationsOfLocalGroups §§1.7–1.9, 4.1, 6.1–6.2, 7.3, 8.1–8.14, 9.1–9.7,
  10.1–10.7 (every numbered sub-item the README cites, such as §8.8 (2), §8.12 (1)–(3), §9.6 (3)–(4),
  §10.5 (2)–(3), exists with that content), TriangulineVarietyAndItsLocalModel §§10.1, 10.5, 10.8,
  11.1–11.8, 12.2, 12.4, 12.6–12.7, 13.8, 13.13–13.16, PhiGammaModulesAndIwasawaCohomology §§7.1–7.4,
  LocalGaloisDeformationRings §1.23 (the four `PhiGamma.*` names are its API bullets),
  PadicHodgeTheory §§4.5, 5.2.
- **Conventions across roadmaps.** The permutation action (u·ψ)_i = ψ_{u⁻¹(i)} is the same in
  DING25 lines 695–697, LocallyAnalyticRepresentationsOfLocalGroups Convention 6 and
  TriangulineVarietyAndItsLocalModel §11.3 (both give (a_1,a_2,a_3) ↦ (a_3,a_1,a_2) for (1 2 3)), so
  ζ_{w_2}κ_{w_2} = ζ_{w_1}κ_{w_1} on the g′-subspaces; ψ ↔ δ(1 + εψ) on both sides; ε = N·abs and
  abs(ϖ_K) = p^{−f} on both sides; the dimensions of 𝔈, 𝔈_w, 𝔈_{g′}, 𝔈_{F_P}, 𝔈_σ, 𝔈_{σ,F_P} and of
  Q, Q_w, Q_{g′}, Q_{F_P}, Q_σ computed from the two suppliers agree with the README.
- **Gap.** `gap:principal-series-bernstein-completion`: same slug in `design/plan.json` and in the
  README under the supplier's subsection; one statement, hypotheses stated (finite E, generic φ), not
  provided by the supplier's SR.3.2 (complex coefficients) nor by the earlier `gap:ordered-character-map`.
- **Ownership.** `roadmaps grep` for π_min, the title and this roadmap's name over the open heads and
  main, and a grep of the board packages: no other roadmap states t_D, π_min(D), π_fs(D), A_D or the
  recovery theorem; LocallyAnalyticRepresentationsOfLocalGroups and TriangulineVarietyAndItsLocalModel
  name this roadmap as the owner of the comparison.
- **Policy.** The pull request changes only this package folder (README, Suggested.lean, design/plan.json,
  three reports). No pull-request number, process word, `lemma`, `set_option` or machine path in the
  README or the Lean file; every target has a locator; no layer is named after a source chapter.

## Not verifiable

- TriangulineVarietyAndItsLocalModel §§10.2 (beyond its first paragraph), 10.3, 10.6, 10.7, 12.1,
  PhiGammaModulesAndIwasawaCohomology §§1.0, 1.2, 3.4a, 3.6, 7.5, LocalGaloisDeformationRings §0.4
  and SmoothRepresentationsOfLocalGroups §SR.3.2 beyond its opening: headings confirmed, contents not
  compared line by line with the README's one-phrase descriptions.
- §3.2 (ii): whether `⊠̂_i π_min(M_i)` twisted by `ε^{−1}` ∘ θ^P lies in the category Rep^(zla.c) of the
  Levi on which LocallyAnalyticRepresentationsOfLocalGroups §7.3 defines `I_{P⁻}^G`; DING25 Remark 3.28
  (line 2372) asserts the injection without proof and the README gives no route for it.
- §5.3: that the closed induction of the universal character extension has all of PS_1(w(φ),h) as
  subobject rests on DING25 Lemma 3.35's argument, read but not reproved.
- The arrow layout of the diagrams (3.52) and (3.54), flattened in the extraction; terms and dimensions
  were checked.
- Elaboration of `Suggested.lean` (read-only pass; the file has no declaration).

## Source issues

- **Misprint** in DING25 at (3.43), proof of Theorem 3.21, p. 49: the source says the character space of the torus is the direct sum of the maximal-Levi-centre character spaces and the centre's; it should be their sum, not direct for n ≥ 2 (dimensions (2n−1)(1+d_K) against n(1+d_K)); affects nothing.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, p. 58: the source says the radical operator ends in the w-part of the universal extension; it should be the full universal extension, no w being fixed; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34, first paragraph, p. 56: the source says "only if" follows from Corollary 3.32(1) and "if" is the induction; it should be the reverse labels; affects nothing.
- **Error** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, p. 56: the source says the two middle terms are the full σ-Ext groups into π⁻ and π⁺; it should be the images of the parabolic σ-Ext groups, as in (3.52) (at n = 3: 10 + 10 against 7 + 7); affects the proof.
- **Misprint** in DING25 at the proof of Theorem 3.34, after (3.54), p. 56: the source says the relation obtained after replacing the module is that of D_σ; it should be that of D′_σ; affects nothing.
- **Misprint** in DING25 at the definition before Proposition 3.26, p. 51: the source says the exponent of the determinant character is one sum over i and σ; it should be the tuple indexed by σ of the sums over i; affects nothing.
- **Gap** in DING25 at the proof of Proposition 3.26, p. 51: the source says the tangent map of the Harish-Chandra map is bijective because the invariants are a polynomial algebra; it should use regularity of h (nonvanishing Vandermonde); affects the proof.
- **Gap** in DING25 at the paragraph after (3.45), p. 50: the source says surjectivity of the push-forward follows from Lemma 3.5(2); it should also invoke Lemma 3.23 (the kernel meets the self-extensions in zero) and the exact sequence (3.12); affects the proof.
- **Misprint** in DING25 at Lemma 2.11, proof, p. 16: the source says the last parameter of the displayed triangulation has algebraic factor of weight h_1; it should be h_n; affects nothing.
- **Misprint** in DING25 at the definition before Corollary 2.38, pp. 31–32: the source says the third argument of the relation is an undefined module with index 2; it should be C_{1,σ}; affects nothing.
- **Misprint** in DING25 at (3.12) and (3.33), pp. 38 and 46: the source says the labels I are subsets of {1,…,n−1}; it should be subsets of {1,…,n} of size i, which the stated dimensions require; affects nothing.
- **Misprint** in DING25 at the paragraph after (3.30), p. 43: the source says the endpoint inductions are from the first and second maximal parabolics with the cyclotomic twist on the first factor; it should be from the (n−1)-th and first, with twists on the last factor; affects nothing.
- **Misprint** in DING25 at Corollary 2.14, proof, p. 19: the source says the quotient paraboline space has dimension d_K·dim(B ∩ L_P) − n; it should be d_K·dim(B ∩ L_P) + n (for P = B this is n(1 + d_K)); affects nothing.
- **Misprint** in DING25 at (3.36), Proposition 3.19(2), p. 47: the source says the target Ext group is taken into the representation indexed by λ; it should be indexed by h, as everywhere else; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c4e8cd3b68fb011235bd875f4b61c10593d1857c", "job": "RT-PadicHodgeParametersInLocallyAnalyticRepresentations~2b", "model": "fable", "worker": "chris-x10"} -->
