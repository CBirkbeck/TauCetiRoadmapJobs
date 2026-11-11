<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13037#issuecomment-6791010785 -->
Red team round 1 pass a (codex) of 9a3e2b3

Verdict: needs_changes

1. **F01** (P2) The adapted-decomposition conditions omit isotropy of J

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:73`, “equivalently a linear isometry”.

   **Claim:** The preceding conditions on the three subspaces characterize the displayed orthogonal standard-form decomposition.

   **Witness:** In the standard symplectic four-space over 𝔽₃, take I=⟨e₁,e₂⟩, V₀=0, J=⟨f₁+e₂,f₂⟩. All listed conditions hold, but ω(f₁+e₂,f₂)=1; the proposed standard form vanishes on J×J.

   **Exact repair text:** “Construct subspaces V₀ and J, with J isotropic, such that V = I ⊕ V₀ ⊕ J, …”. Add the Check: “The complement ⟨f₁+e₂,f₂⟩ to ⟨e₁,e₂⟩ in 𝔽₃⁴ is not admissible: its internal pairing is 1.” This excludes the witness; J=⟨f₁,f₂⟩ has internal pairing 0 and gives the claimed isometry.

2. **F02** (P2) The linear-algebra layer unnecessarily excludes characteristic two

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:73`, “a field k of characteristic not 2”.

   **Claim:** Adapted symplectic coordinates are only supplied away from characteristic two.

   **Witness:** Over 𝔽₂, ω((x,y),(x′,y′))=xy′+yx′, I=⟨(1,0)⟩, J=⟨(0,1)⟩ and V₀=0 satisfy every corrected condition: ω(e,f)=1 and 2=2·1+0. The cited suppliers explicitly cover every characteristic.

   **Exact repair text:** “Let V be a finite-dimensional space over any field k with an alternating nondegenerate form ω, and let I≤V be isotropic.” Add: “Layer 0 holds in every characteristic; the odd-characteristic convention begins with the half-form Heisenberg construction.” The existing basis-extension proof uses no division by two. A pinned direct supplier is `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`, `TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`; negate its second half to match this roadmap’s sign convention. The displayed 𝔽₂ instance then becomes an admitted positive Check.

3. **F03** (P2) The reason for omitting Gérardin’s headline is not a carrier obstruction

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:34` and `packages/MetaplecticAutomorphicFormsPartII/README.md:67`, “neither … exists as a group”.

   **Claim:** §3.3 cannot be stated against the pins because the isometry action on the factor-set extension is absent.

   **Witness:** `Mathlib/GroupTheory/SemidirectProduct.lean:46` accepts any homomorphism to `MulAut`. The action here is the simple coordinate map (t,v)↦(t,gv); its multiplicativity is exactly ω(gv,gw)=ω(v,w). Both carriers already exist.

   **Exact repair text:** Replace the “Not statable at the pins” paragraph by: “Layer 3 states the corrected Gérardin induction theorem, with its quadratic determinant twist, using the coordinate isometry action on the native Heisenberg extension and native finite-index induction.” Add that headline with `sorry`. Retain only the simple definitions needed: the coordinate action (inverse g⁻¹), the subgroup consisting of (h,p) with h’s vector coordinate in I^⊥, and the explicitly defined Weil–Heisenberg operators. State the induced-representation equivalence of README §3.3 for every isotropic I and subgroup P stabilizing I; identify the quotient with a polarized space by an isometry, quantify its normalized Weil representation, and use `TauCeti.indFDRep`/`Rep.ind` and `Representation.Equiv`. These are definitions on native carriers, not missing heavy constructions. The coordinate action belongs to the parent roadmap; its finite specialization here is solely supporting notation for the acceptance test, just as `heisenbergFactorSet` already is.

   Verification of the repair: at I=0 the subgroup is the whole semidirect product, the twist is 1 and induction has index 1. In the 𝔽₅ plane at I=⟨(0,1)⟩, m(2) acts on the inducing line by χ₅(3)=−1, not +1. In 𝔽₃⁴ with dim I=1, the inducing dimension is 3, the index is 3 and the resulting dimension is 9. None requires a new carrier. The parent action is unimplemented, but absence of that bundled definition alone does not satisfy the acceptance-test exception permitting omission.

4. **F04** (P2) The factor-set docstring asserts a commutator law outside its signature

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:57`, “commutator `(ω(v, w), 0)`”.

   **Claim:** The extension defined immediately below has this commutator, without stating the odd-characteristic condition in the declaration’s documentation.

   **Witness:** Take k=𝔽₂, V=k² and ω(e₁,e₂)=1 alternating. Division by 2 gives 0, so the defined extension is abelian: its commutator is (0,0), while the docstring predicts (1,0).

   **Exact repair text:** “For every bilinear form ω this defines the factor set ω/2 and its extension. If ω is alternating and ringChar k ≠ 2, the commutator is (ω(v,w),0).” Keep the actual definition general. The 𝔽₂ witness then lies outside the commutator claim, consistently with README §1.1’s characteristic-two Check; for the 𝔽₃ plane the value is (1,0) as claimed.

5. **F05** (P3) Two projective-action Checks do not test the normalized data

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:259` and `:261`, “μ(1) = id” and “§2.2 removes the choice”.

   **Claim:** These are discriminating Checks for §2.1’s normalized choice μ and its factor set.

   **Witness:** The first repeats μ(1)=1 from line 246. For V=0, Sp(V)={1}; the same condition already forces the entire function μ to equal 1 and c(1,1)=1. There is no scalar choice left for §2.2.

   **Exact repair text:** Replace these two bullets by: “Over 𝔽₃, choose the bare Fourier intertwiner μ(J)=Fψ and μ(−1)=R. Then μ(J)²=R, so c(J,J)=1; replacing μ(J) by 2Fψ changes c(J,J) to 4.” And: “On the 𝔽₃ model, Rδ₁=δ₂ and tr R=1. A purported conjugate −R has trace −1 and is excluded; the zero intertwiner is excluded by invertibility.” With the existing order-three rescaling Check, these supply three substantive probes. Both new values follow directly on δ₀,δ₁,δ₂.

6. **F06** (P3) The character calculation is located on the wrong printed page

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:168`, “Lemma 2.1 and its proof, p. 16”.

   **Claim:** The proof of the character-support formula is on printed p. 16 of N02.

   **Witness:** N02 line 81 gives the lemma on p. 16; N02 lines 83–104 put its trace calculation and irreducibility/uniqueness argument on p. 17.

   **Exact repair text:** “(N02, Lemma 2.1, p. 16, and its proof and following discussion, p. 17.)” Apply the same correction wherever the proof is assigned solely to p. 16. The repaired locator contains the translation trace 0 and central trace qⁿψ(t), giving 0 and 3 at the tested 𝔽₃ elements.

7. **F07** (P3) The fully ramified generalizations are attributed to narrower source statements

   **Location:** `packages/MetaplecticAutomorphicFormsPartII/README.md:191`, `:422`; `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:113`, `:128`, `:220`.

   **Claim:** The attached locators support the arbitrary finite-group fully ramified and isotropic-induction theorems as stated.

   **Witness:** S08 lines 571–578 concern skew semisimple characters; lines 1387–1408 concern their parabolic constructions. F21 lines 1234–1249 concern a particular p-adic type. FS25 lines 507–545 assume Heisenberg Fₚ-groups. None states the arbitrary finite-group theorem.

   **Exact repair text:** Add at §1.4: “This general finite-group theorem is derived here from induction, Maschke and character orthogonality by the argument below. S08, Proposition 3.5, p. 14, and F21, Lemmas 7.7–7.8, pp. 30–31, are applications in their respective type-theoretic settings.” Add at §3.4: “This is the general finite-group consequence of §1.4 proved below; S08, Lemma 5.6, Corollary 5.7 and Lemma 5.12, and FS25, Lemma 3.3.4(b), supply the indicated special cases.” Make the same attribution distinction in the three theorem docstrings. Keep the generality and the proof routes. The cyclic-centre example of order p² still has d²=p², and the Q₈ example with θ(−1)=−1 has d²=4=[Q₈:{±1}]; these need the stated general argument rather than an unqualified quotation of the cited special cases.

## Verified sound

Read all 526 README lines and all 307 Lean lines, including all **14 declarations** (six definitions/abbreviations and eight admitted theorems), all **18 numbered target sections**, their APIs and worked examples, and all **67 Check bullets**. The README has no separately bolded milestone names; its bold mathematical labels are the worked examples, included below. Read **22 distinct named source locators** in the four available texts, plus the surrounding sections needed for conventions. Gérardin’s original theorem remains uncertified. Checked **15 distinct supplier-section contracts**: MetaplecticAutomorphicForms §§0.1–0.10 including §0.9a (11 sections), MordellLawrenceVenkatesh §§3.1–3.2, and the two RepresentationTheory subroadmap contracts (the InductionRestriction contract itself covers Layers 0, 2, 4, 5, 7). These counts are coverage counts, not claims that the defects above passed.

The eight Lean theorem propositions survive the instances below; no false theorem proposition or lost binder was found. Their proofs require finite representation theory and are not one-tactic padding. The six definitions support those headlines. No duplicate fully qualified name was found on main, in the board packages, or in the indexed open Lean files. The six represented headline families are §1.3 Stone–von Neumann, §1.4 fully ramified characters, §2.2 normalized Weil existence/uniqueness, §3.4 isotropic invariants, §4.1 fixed-line determinant character and §4.2 tensor compatibility. The seventh headline, §3.3 corrected Gérardin induction, is missing for the reason addressed in R03.

The pins inspected are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Supplied elaborated signatures were compared with all declaration bodies, their section contexts and README statements. No new elaboration or Lean build was run, and no package source was edited.

### Declaration table: contexts and computed instances

Here F(V) means `{k V : Type*} [Field k] [AddCommGroup V] [Module k V]`; FO(V) adds `[Finite k] [FiniteDimensional k V]`, `ringChar k ≠ 2`, alternating/nondegenerate ω and ψ≠1. All representation spaces carry the explicitly stated additive-group, complex-module and finite-dimensional instances. G means `{J : Type*} [Group J] [Finite J]`, H normal, all commutators in H, θ:H→*ℂˣ invariant under J, and the stated nondegeneracy condition. These abbreviations expand the complete contexts; no ambient topological assumptions occur. Write ζ=exp(2πi/3).

| Declaration; section; context | Instances and values on both sides | Result/change |
|---|---|---|
| `heisenbergFactorSet`; Heisenberg; F(V), arbitrary ω; local trivial action | 𝔽₃ plane: α(e₁,e₂)=2, α(e₂,e₁)=1, commutator coordinate 2−1=1=ω(e₁,e₂). 𝔽₂: α=0 and commutator 0, versus ω(e₁,e₂)=1. Cocycle sides at (e₁,e₂,e₁) are 0=0 in 𝔽₃. | Definition true for arbitrary bilinear forms; docstring R04. |
| `Heisenberg`; Heisenberg; F(V), arbitrary ω | Zero V gives k×{0}, cardinal q=q¹; 𝔽₃ plane gives 27=3³. Symmetric ω(x,y)=xy over ℚ gives an abelian extension, commutator (1−1)/2=0. | Body is native Extension; no alternate carrier or sorry-data. |
| `finite_stoneVonNeumann_exists`; Heisenberg; FO(V) | V=0: E=ℂ, ρ(t)=ψ(t), dimension 1. 𝔽₃²: E=ℂ³, central operator ψ(t)I₃; Tδ₁=δ₀, Mδ₁=ζδ₁. 𝔽₉²: E=ℂ⁹, ψ(i)=1 but ψ(1)=ζ²≠1. | Exists in Type 0 even for universe-large finite inputs, by finite-dimensional coordinates. Zero E excluded by irreducibility. |
| `finite_stoneVonNeumann`; Heisenberg; FO(V), two irreducibles and both central-action laws | V=0: 1²=1 and identity equivalence. 𝔽₃²: 3²=9, tr T=tr M=0, character norm 3·9/27=1. 𝔽₉²: 9²=81 and noncentral modulation sum 3(1+ζ+ζ²)=0. ψ=1 on 𝔽₃² gives nine inequivalent lines, excluded. | All binders retained; `g.right ≠ 1` means v≠0, since the quotient coordinate is Multiplicative V. |
| `fullyRamified_exists`; FullyRamified; G | J=H=1 gives E=ℂ and θ=1. J=H=S₃ with θ=sign gives the sign line, despite J nonabelian. Q₈,H={±1},θ(−1)=−1 gives the two-dimensional quaternionic representation over ℂ, central −I₂. | No odd-prime assumption is lost or required. Existence alone also follows without hnd by induction and Maschke; this is not counted as padding. |
| `fullyRamified_unique`; FullyRamified; G plus two irreducibles and their H-action laws | Q₈: 2²=4=8/2, character (2,−2,0,0,0) on its five classes. S₃,H=S₃: 1²=1 and sign is unique for its scalar action. J=C₃,H=1: nondegeneracy fails, three extensions rather than one. | Statement sound. Cyclic-centre central product at p=3: order81, centre9, d²=9. Attribution R07. |
| `polarizationForm`; Weil; F(X), k and X explicit | X=𝔽₃: ω(e,f)=1 and ω(f,e)=−1=2; ω(e+f,e+f)=0. X=0: form=0 and radical=0. X=𝔽₂: both cross pairings=1 and diagonal=0. | Actual body matches sign convention. No finite-dimensionality is needed to define it. |
| `schrodingerOp`; Weil; F(X), ψ arbitrary, t and v explicit | 𝔽₃: TMδ₁=ζδ₀, MTδ₁=δ₀, so TM=ζMT. On (t,x,y)=(0,1,1), phase at z=0 is ζ². X=0: scalar ψ(t), not 0. ψ=1 gives translations and a proper constant line for X≠0. | Definition correct without irreducibility assumptions; theorem hypotheses supply them. |
| `evenPart`; Weil; only X and `[AddCommGroup X]` retained | X=C₃: eδ₀=δ₀, eδ₁=(δ₁+δ₂)/2, e(δ₁−δ₂)=0, e²δ₁=eδ₁. X=0: e=1. X=C₂: −z=z, so e=1, rather than rank (2+1)/2. | Lost k/module binders are genuinely unnecessary. Odd-cardinality rank formula is used only under FO. |
| `IsNormalizedWeil`; Weil; F(X), ψ, actual group homomorphism W | 𝔽₃ shear W=diag(1,ζ,ζ): det W=ζ²=(det W on S⁺)². Twist by order-three λ: left unchanged, right multiplied by λ. X=0: 1=1². | Explicit predicate fixes normalization; no arbitrary Prop field or conclusion in hypotheses. Finite-dimensional hypotheses are on the headline. |
| `existsUnique_isNormalizedWeil`; Weil; finite odd k, finite-dimensional X, ψ≠1 | n=0: κ=a/a²=a⁻¹, κa=1. 𝔽₃: dimensions 3 and 2, exponent 3−4=−1; the two nontrivial twists fail. 𝔽₅: 5−6=−1, det F=−1 and normalized J operator −F. | Existence and uniqueness survive exceptional Sp₂(𝔽₃). |
| `fullyRamified_isotropicInvariants`; IsotropicInvariants; G, subgroup U with θ(U∩H)=1, irreducible ρ with scalar H | U=1 in Q₈: Q=J, 2²·2=8. Reflection U in D₈ with θ(r²)=−1: Q=⟨r²,s⟩, HU=Q of order4, dim Eᵁ=1, so 1²·4=4. 𝔽₃⁴ line: 3²·9=81. U=H and θ≠1 gives 0·\|H\|≠\|J\|, excluded. | The written invariant-submodule condition plus positive cardinal identity excludes the zero “irreducible” model. `H ⊔ U` equals HU since H is normal. |
| `isNormalizedWeil_lagrangian_fixed`; FixedLine; finite odd k, finite-dimensional X, ψ≠1, normalized W, L⊥=L, gL⊆L, L-fixed f | On 𝔽₅, L=y-axis, m(a) for a=1,2,3,4 has restricted determinants 1,3,2,4 and line eigenvalues +1,−1,−1,+1. 𝔽₉: det(−1)=i² and eigenvalue +1. X=0: determinant1 and W=1. f=0 gives 0=0 in both implications. | Injectivity plus finite dimension makes restricted determinant nonzero, so IsSquare 0 never intervenes. The nonzero line is separately established in README §3.1. |
| `isNormalizedWeil_pi_tensor`; Tensor; finite decidable ι, finite odd k, finite-dimensional family Xᵢ, common nontrivial ψ, normalized W/Wᵢ, actual blockwise hg | Empty ι: both functions equal1. Singleton: both are W₁(g₁)f₁ under coordinate equivalence. Two 𝔽₃ planes, J⊕J on δ₀₀: both are −(1/3)·1. One factor Xᵢ=0 contributes scalar fᵢ(0) on both sides; a zero fᵢ gives 0=0. | All family, finite-dimensional and block-action binders retained. No out-of-range indices or natural subtraction. |

### README target and Check table

Each row records the section’s target and every Check bullet, in their original order (C1, C2, …). Thus all 67 bullets have computed outcomes rather than an unchecked “sound” label. Native fields exclude the zero ring and q=1; finite fields are perfect, so inseparable field extensions cannot supply counterexamples. Topological compactness, nonreduced schemes, covers, DVRs and infinite indexing are absent from these statements, rather than silently assumed.

| Target and location | Instances; computed values for the target and Checks | Result/change |
|---|---|---|
| §0.1 adapted coordinates, line73 | C1 I=0: dimensions (0,dim V,0), quotient V. C2 plane: (1,0,1), 2=2·1+0. C3 two planes: (1,2,1), 4=2·1+2, erroneous quotient dimension3≠2. C4 full plane: ω(e,f)=1≠0. Additional J=⟨f₁+e₂,f₂⟩: internal pairing1 rather than0. | Four original Checks true; R01 missing isotropy, R02 unnecessary characteristic restriction. |
| §0.2 standard form, line95 | C1 ordered cross values1 and−1. C2 J(e)=(0,−1), J(f)=(1,0), pairing1=1; native Matrix.J is −J. C3 X=0: radical0 and Sp={1}. Gram matrix in a basis is [[0,I],[−I,0]], determinant1. | Formula and nondegeneracy correct. Coordinate block maps require the basis identification already introduced in Conventions. |
| §1.1 extension, line124 | C1 products (2,e+f) and (1,e+f), quotient (1,0). C2 V=0: orderq, commutator0. C3 char2: 1/2=0, all commutators0. C4 corrected third coordinate 1/2+1/2=1, versus incorrect1/2. Inverse of (t,v) is (−t,−v), product (0,0). | Four Checks correct; specializations of the parent formulas. |
| §1.2 Schrödinger model, line145 | C1 TMδ₁=ζδ₀ and MTδ₁=δ₀. C2 Mδ₁=ζδ₁,Tδ₁=δ₀. C3 X=0: dim1, actionψ. C4 ψ=1 in plane: constants dimension1<q. General composition gives central cross term y′(x), identical on both sides. | Right translation and central character ψ agree with native induction, with no inverse-character mismatch. |
| §1.3 character/uniqueness, lines168–170 | C1 𝔽₉: ψ(i)=1 but sum over k is3(1+ζ+ζ²)=0. C2 n=0: d²=1. C3 ψ=1 on plane: q² inequivalent characters, so uniqueness false outside hypothesis. C4 q=3:9·1²+2·3²=27. Character norm q·q^(2n)/q^(2n+1)=1. | Theorem sound; locator R06. |
| §1.4 fully ramified theorem, line191 | C1 p=3 central product: \|J\|=81,\|H\|=9,d=3, d²=81/9. C2 nonabelian exponent9 group of order27: centre3,d=3, versus exponent3 of standard group. C3 C₃,H=1:3 extensions, all commutators1. C4 J=H: d=1,index1. C5 H(𝔽₃²): d²=9=index. | All five Checks true; source-generalization attribution R07. |
| §1.5 intertwiners, line213 | C1 A=B line over𝔽₃: TAA=3I, square9I. C2 distinct lines: TABTBA=3I, rather than1I or9I. C3 V=0: every sum has one term, composition1I. Nonzero composition proves both maps nonzero. | Nontransverse factor \|A∩B\| included correctly. |
| §2.1 projective action, line246 | C1 μ1=1 gives c(1,g)=c(g,1)=1 by its definition. C2 g of order3, a(g)=ζ,a(g²)=1: new c(g,g)=ζ²c(g,g). C3 V=0: normalized μ is identically1, so there is already no choice. For parity, tr R=1 and scalar-conjugacy aR has trace a, forcing a=1. | Target and rescaling law correct; two Checks require R05. |
| §2.2 normalization, lines267–269 | C1 dim1: a/a²·a=1. C2 dimension3: λ³=1 but λ⁴=λ≠1. C3 dimension5:5−2·3=−1; inverse ratio scales final operator by a². C4 𝔽₃: W(−1)=−R; its +1-space has dimension1 whereas S⁺ has dimension2. | Four Checks correct. Determinant denominator is nonzero because the parity-preserving intertwiner is invertible. |
| §2.3 generators, line291 | C1 𝔽₃: shear diagonal(1,ζ,ζ), det F=−i, W(−1)=−R. C2 𝔽₅: det F=−1, χ(2)=−1. C3 FTF⁻¹=M⁻¹, matching J(e)=−f; F⁻¹TF=M has opposite sign. In both fields F²=R and (det F on S⁺)²=1. | Formulas and fourth-root claim correct. |
| §2.4 semidirect representation, line311 | C1 W(J)TW(J)⁻¹=M⁻¹. C2 V=0: Ω=ψ on k. C3 reversed Ω′: at (h,1)(1,J), the claimed product compares FT with TF; at δ₁,z=0 they give1/√3 and ζ/√3, multiplied by the same nonzero κ. | Correct order π(h)W(g); reversed order fails as claimed. |
| §2.5 special isomorphisms, line331 | C1 j=id,s=id: every (a,k) maps to(a,k). C2 w=e,v=f: conjugation changes central coordinate0 to1, whereas s=1 predicts0. C3 order27 exponent9 cannot be isomorphic to exponent3 group. | Equivariance is explicitly required and excludes inner-automorphism shortcut. |
| §3.1 mixed model, line361 | C1 I=0: index1, invariants dimqⁿ. C2 Lagrangian: quotient0, invariants dim1, support{0}. C3 line in𝔽₃⁴: original dim9, fixed dim3. For I=⟨e⟩,j=f: phaseψ(ω(f,e))=ζ⁻¹, not ζ. | Phase sign correct, including noninjective ψ through scaling by all i∈I. |
| §3.2 parabolic fixed space, lines382–384 | C1 𝔽₅ y-axis: restricted determinant3, χ(3)=−1 on δ₀; x-axis determinant2, χ(2)=−1 on constants. C2 I=0: determinant on0 is1, twist1. C3 I Lagrangian: dim1 and actionχ(det). | Correct quadratic twist. For general P≤Stab(I), prove for the full stabilizer then restrict; P itself need not possess the stated full Levi subgroup. |
| §3.3 corrected induction, line403 | C1 𝔽₃⁴ line: index3 times dimension3 equals9. C2 𝔽₅ line: omitted twist predicts+1 on the unique I-fixed line, actual−1. C3 I=0: Q=whole group,index1, induction identity. | Mathematical formula correct; missing Lean headline R03. |
| §3.4 fully ramified isotropic induction, line422 | C1 U=1: d²\|H\|=\|J\|. C2 U≤kerθ: Eᵁ=E,Q=J, same count. C3 orderp³ Heisenberg: Q=HU of orderp²,1²p²=p². C4 U=H,θ≠1: dimension0,0≠\|J\|; excluded. C5 𝔽₃⁴ line: \|HU\|=9,\|Q\|=81,dim3,3²·9=81, false line-model gives9. | All five Checks correct; character θU and representation ηU are correctly distinguished. Attribution R07. |
| §4.1 fixed line, line454 | C1 V₀=0: second determinant1. C2 𝔽₅ m(2) on constants gives−1, not+1. C3 𝔽₃ −1 gives−1 on every line-fixed space. C4 X=0: determinant1, operator1. C5 𝔽₉:i²=−1, χ₉(−1)=+1 and W(−1)δ₀=δ₀, versus prime-field sign−1. | Every determinant is nonzero; correct field, not prime-field, quadratic character. |
| §4.2 tensor compatibility, lines478–480 | C1 two𝔽₃ planes: dimension9; both lower shears fixδ₀, hence product fixesδ₀⊗δ₀. C2 twistλ on one factor gives determinant ratio λ⁻¹≠1 on dimension9 (even dimension5). C3 ψ₁=ψ,ψ₂=ψ⁻¹,t=1: central tuple scalarζ²≠1. C4 empty family: dimension1. C5 J⊕J: (−i)⁶/3=−1/3=(−i/√3)². | Common ψ and normalization are necessary; no nonempty-family hypothesis is missing. |

### Remaining API, convention and worked-example computations

These rows cover identities and constructions not fully recorded by the headline/Check rows. Spaces are finite-dimensional over the specified finite odd field unless a wider definition is explicitly mentioned.

| Statement | Instance and computed sides | Result/change |
|---|---|---|
| Conventions: noninjective ψ still detects nonzero k-linear functionals | k=𝔽₃(i), Tr(i)=0 so ψ(i)=1; scaling i by i gives i²=−1, Tr(−1)=1, hence ψ(−1)=ζ≠1. | Correct; no assumption ψ injective. |
| Conventions: isometry multiplication is composition | On the 𝔽₃ plane, J·u(1) sends e to J(e+f)=e−f; u(1)·J sends e to−f. The values differ, verifying the noncommutative order. | Matches subgroup of LinearEquiv and Egorov. |
| Conventions: J versus native Matrix.J | J(e)=−f; native Matrix.J(e)=f. Pairing before and after either isometry is1; the operators are different, F versus F⁻¹ before scalar correction. | Sign convention explicitly distinguished. |
| Conventions: parity and dimensions | On 𝔽₃: R fixesδ₀ and exchangesδ₁,δ₂, so trace1, dimensions2 and1. On 𝔽₅: dimensions3 and2. On a point:1 and0. | No zero-dimensional odd summand is asserted irreducible here. |
| Conventions: Lagrangian orthogonal | In the plane, ⟨e⟩⊥=⟨e⟩; 0⊥=V≠0 for V≠0; V⊥=0≠V. Both directions of the Lagrangian criterion distinguish these. | Correct at rank0 as well:0⊥=0. |
| §0.1 quotient projection and transport | In two planes, I=⟨e₁⟩, I⊥=⟨e₁,e₂,f₂⟩; projection kills e₁ and sends e₂,f₂ to themselves, with pairing1=1. Swap the two planes: I′=⟨e₂⟩ and quotient basis becomes e₁,f₁. | Quotient is intrinsic, complement is not. |
| §0.2 nondegeneracy and two standard Lagrangians | Pair (a,b) with f to get a, with e to get−b; both zero iff a=b=0. X-axis and y-axis each pair internally0 and together give all k². | Correct, including char2. |
| §0.2 isometries m(A),u(C) | Over𝔽₅, A=2 gives m(A)=diag(2,3) with pairing2·3=1; u(1)e=e+f,u(1)f=f, pairing1. | Symmetry of C is the right hypothesis. |
| §1.1 scalar-to-rank-one coordinate comparison | For e,f over𝔽₃, half-form product central2 becomes z=2+1/2=1; native product z=1. For reversed product central1 becomes z=1+1/2=0; native reversed product z=0. | Correct in both multiplication orders. |
| §1.2 evaluation map from induced functions | (0,z,0)(t,x,y) decomposes as (t+y(z)+y(x)/2,0,y)(0,z+x,0). At z=0,t=0,x=y=1 over𝔽₃, both group products have central coordinate0; the inducing-subgroup coordinate is2, giving covariance factorψ(2)=ζ². | Confirms central character rather than its inverse. |
| §1.2 change of polarization and scalar ambiguity | On the 𝔽₃ plane Fourier intertwines translations with opposite modulations; F and2F both intertwine and are distinct, but have the same projective class. | No claim of a distinguished intertwiner. The “after §1.3” clause supplies the deferred proof. |
| §1.3 isotypy and Schur | Direct sum Sψ⊕Sψ has dimension6, character6ψ(t) on centre and0 off centre; multiplicity2, whereas End(Sψ) has dimension1 and scalars exhaust it. | Isotypy does not assert arbitrary representations are irreducible. |
| §1.4 perfect commutator pairing | Q₈/{±1}=C₂²: pairings at (iH,jH) and reversed are−1=−1, diagonal1. Four quotient elements give four distinct characters. C₃ with H=1 gives constant pairing1 and is degenerate. | Correct beyond odd-order groups. |
| §1.4 vanishing via conjugation | In Q₈, jij⁻¹=−i; θ(−1)=−1, hence trρ(i)=−trρ(i) and trace0. At−1 trace−2=2θ(−1). | Central/off-central formula consistent. |
| §1.5 averaging normalization and isometry naturality | Transverse lines over𝔽₃: inner sum1+ζ+ζ²=0 off intersection; at intersection it is3, giving3I. Plane-swap isometry bijects the three summands, so total3 remains3. | No triangle-composition normalization silently imposed. |
| §2.1 cocycle orientation | μgμh=c(g,h)μgh implies c(g,h)c(gh,j)=c(h,j)c(g,hj). With μg=a(g)Wg, a(g)=2,a(h)=3,a(gh)=1, factor6 on both sides of μgμh=6μgh. | Matches native IsProjectiveRep. N02’s displayed c uses the reciprocal convention; the derived κ here accounts for it. |
| §2.2 κ-coboundary and independence | Scalar rescaling μ↦2μ in dimension3 sends detμ↦8detμ and squared even determinant↦16 times itself; κ↦κ/2 and κμ unchanged. For cocycle scalar c=2, exponent3−4=−1 givesκgκh=κgh/2. | Correct orientation, denominators invertible. |
| §2.3 Fourier determinant and scalar | 𝔽₃: unnormalized Vandermonde determinant−3√3i, divide by(√3)³ gives−i; square ofκ gives−1, matchingχ₃(−1). 𝔽₅:κ=−1, κ²=1=χ₅(−1). | Independent matrix calculation agrees. |
| §2.4 model-change covariance | Conjugating π,W by A gives AπhWA⁻¹=(AπhA⁻¹)(AWA⁻¹); with A=2I, both factors and product unchanged. Parity is transported, so determinants remain unchanged. | Exact conjugacy, no residual scalar. |
| §2.5 semidirect pullback | j=id,K=1 givesρ(a)=π(a); K=Sp givesΩ. With K acting by conjugation by e and s=1, image of f has central coordinate1 rather than0, so map fails multiplication and is excluded. | Equivariance is an actual hypothesis, not presumed from quotient identity. |
| §3.1 quotient kernel and model dimension | 𝔽₃⁴ line: K has order81, H(V₀) order27, kernel order3; induced dimension3·3=9. At nonzero j, some i givesψ(ω(j,i))=ζ orζ², forcing F(j)=0. | Kernel is {(0,i)}, not the entire centre. |
| §3.2 Levi/radical action | On the 𝔽₃⁴ line case, Levi m(−1) on I and identity on V₀ acts as−I₃ on invariants. Radical elements have determinants1 and quotient action1; in the mixed model their phases at0 areψ(0)=1. | Full-stabilizer computation then restriction to arbitrary P gives the statement. |
| §3.3 nonzero reciprocity map and surjectivity | For 𝔽₃⁴ line, invariant inclusion has rank3>0; the induced map has nonzero image stable under H(V), hence rank9; both domain and target dimension9, so kernel0. | Uses the existing irreducibility and finite-index induction contracts. |
| §3.4 θU and double orthogonal | D₈ with H=⟨r²⟩,U=⟨s⟩: θU(s)=1,θU(r²)=−1,θU(r²s)=−1. Q=HU has4 elements, Q/HU=1, smaller representation dimension1, induction index2 gives dimension2. | θU is a character on HU, not the generally higher-dimensional representation. |
| §3.4 invariant-space irreducibility as typed | For U=1,Q₈: invariant space ℂ², Q-stable subspaces only0 andℂ². For D₈ reflection U: invariant line, subspaces only0 andline. With U=H,θ≠1: invariant0 but dimension equation0=\|J\| fails. | The written disjunction alone would allow0, but the combined conclusion excludes it. |
| §4.1 flag determinant multiplication | 𝔽₅ in two planes, L=⟨e₁,e₂⟩, I=⟨e₁⟩, g acts by2 on each eᵢ: det on L=4, χ(4)=1=(−1)(−1). If both blocks are unipotent, determinants1 and scalar1. | “Both squares” is sufficient, not asserted necessary; the product can be square with both nonsquare. |
| §4.2 determinant of tensor parity blocks | Two three-dimensional factors: dim even parts2, odd parts1; if αᵢ=det even=det odd, tensor even determinantα₁³α₂³, full determinantα₁⁶α₂⁶=(even determinant)². | Correct including zero configuration factors, whose Schrödinger dimension is1. |
| §4.2 pure tensor nonvanishing | Two nonzero vectors v₁,v₂ with ℓ₁(v₁)=ℓ₂(v₂)=1 give (ℓ₁⊗ℓ₂)(v₁⊗v₂)=1, so tensor≠0. Empty tensor evaluates1. | Requires field coefficients, supplied by ℂ. |
| Worked example: upper-unipotent invariant constants, line502 | An upper shear fixes the x-axis pointwise, restricted determinant1; W fixes constants. In two factors the product function1·1=1 is fixed and nonzero. | Distinct from lower shears’ δ₀ fixed vectors, correctly distinguished. |
| Bold worked examples: 𝔽₃ plane, line514 | T³=M³=1, TM=ζMT, even basisδ₀,δ₁+δ₂ gives dimension2; twisted determinant sides differ byλ. | Recomputed. |
| Bold worked examples: 𝔽₅ plane, line515 | κJ=−1; m(2)δa=−δ2a, restricted determinant on y-axis3 withχ(3)=−1. | Recomputed. |
| Bold worked examples: centre orderp², line516 | p=3: central product order(27·9)/3=81, centre9, quotient9, unique dimension3, centre acts by a primitive ninth root. | Not a standard Heisenberg group: its centre is cyclic order9, unlike additive𝔽₉ of exponent3. |

Numerical probes independently evaluated every pair of Heisenberg operators in the planes over 𝔽₃ and 𝔽₅, generator covariance, F²=R, the determinant identity, and tensor J⊕J over 𝔽₃. Maximum residual was below 7·10⁻¹⁶ for the plane identities and 3·10⁻¹⁶ for the tensor identity. These supplement, rather than replace, the exact computations above.

### Source-locator audit

| Source locator read | Text witness and comparison |
|---|---|
| N02, §2; Lemma2.1, pp.16–17 | N02 lines64–81 define the same half-form group and Schrödinger action. Lines83–104 give support, irreducibility and uniqueness: central traceqⁿψ(t), off-centre0. Page discrepancy is R06. |
| N02, Theorem3.3, p.18 | N02 lines131–158 supply u(C),m(A),J generation; the roadmap’s matrices have the same signs. |
| N02, Theorem4.1, pp.19–20 | N02 lines185–225 give shear phase−zᵀCz/2, inverse pullback A⁻¹ and positive-phase Fourier, sending (x,y) to(y,−x). |
| N02, Theorem4.2, pp.20–22 | N02 lines230–295 give parity preservation and the two constituents; the roadmap uses preservation and dimensions, not irreducibility of the zero odd space at n=0. |
| N02, Theorem4.3 and following computations, pp.22–23 | N02 lines298–349 giveκ=detμ/(detμ⁺)², κu=1,κm=quadratic determinant andκJ=detF. N02 uses the reciprocal projective-factor convention. |
| N02, Example4.4, pp.23–24 | N02 lines351–372 give q=5 andκJ=−1; direct matrix computation agrees. |
| FS25, Example3.1.6, p.11 | FS25 lines391–395 give coefficient-first half-form multiplication in odd characteristic. Prime-field scope is explicit. |
| FS25, Lemma3.3.1, p.14 | FS25 lines507–514 give uniqueness and square-root dimension for Heisenberg Fₚ-groups, including p=2; arbitrary finite k uses N02 or the roadmap’s argument. |
| FS25, Lemma3.3.4, p.15 | FS25 lines540–559 give induction and invariants. The source’s displayed action phase has the sign issue recorded below; the roadmap’s ω(j,i) is correct. |
| FS25, Construction3.4.2, p.17 | FS25 lines626–632 give the symplectic splitting, linearization and exceptional three choices for Sp₂(𝔽₃). It does not itself identify the exceptional choice by parity determinant; N02 supplies that normalization. |
| FS25, Remark3.4.3, p.17 | FS25 lines633–640 give the obstruction on all centre-fixing automorphisms; the roadmap’s equivariance excludes the inner-automorphism example. |
| FS25, Definition3.4.4, p.17 | FS25 lines646–650 define special isomorphisms by their quotient identification. |
| FS25, Definition3.4.5, pp.17–18 | FS25 lines651–668 require extension to the semidirect product and transport the central character accordingly. The roadmap explicitly uses Sψ∘j. |
| F21, Lemma7.6, p.30 | F21 lines1178–1195 give the tensor carrier and the constituent statement for a type, with empty tensor dimension1. |
| F21, Lemma7.7, pp.30–31 | F21 lines1197–1232 construct a specific Heisenberg p-group quotient and handle n=0; centre orderp, not arbitrary cyclic order. |
| F21, Lemma7.8, p.31 | F21 lines1234–1249 use Heisenberg uniqueness and factor a particular type; generalization attribution R07. |
| F21, Lemma7.10 and proof, pp.32–34 | F21 lines1262–1345 give the parabolic fixed-space argument and tensor construction. Line1326 includes the quadratic character; the roadmap’s determinant formulation makes its vanishing on unipotents explicit. |
| F21, footnote3, p.33 | F21 lines1346–1349 report the missing twist in Gérardin2.4(b). The 𝔽₅ fixed-line test independently confirms the need for it. |
| S08, Proposition3.5, p.14 | S08 lines571–578 state uniqueness and square-root index for the specified semisimple character; not the arbitrary finite-group statement. |
| S08, Lemma5.6, pp.29–30 | S08 lines1241–1267 give isotropic subspaces, a perfect residual pairing and an orthogonal sum in that setting. |
| S08, Corollary5.7, p.30 | S08 lines1268–1274 define θP and give irreducible induction. |
| S08, Lemma5.12, p.33 | S08 lines1387–1408 give the classical-group analogue, its invariant-space realization and tensor decomposition. |

### Supplier and ownership audit

| Supplier / object | Verified contract and boundary |
|---|---|
| MetaplecticAutomorphicForms §§0.1–0.10, including0.9a | At the indexed head, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:77` begins bilinearFactorSet; :120 has halfForm_commutator; :128 centre; :136 extensionIsometry; :154 extensionIsometryAction; :172 polarization_cocycle; :180 Lagrangian complements; :194 polarizationEquiv. Names and hypotheses agree. No dependency on local or adelic Stone–von Neumann is taken. |
| MordellLawrenceVenkatesh §§3.1–3.2 | `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1331` begins dimension criterion; :1343 begins prescribed-basis extension, explicitly in every characteristic, importing the parent complement. The pin now also has that basis extension in `TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`. |
| RepresentationTheory/InductionRestriction on main | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:213`, :268, :503, :607, :721 are Layers0,2,4,5,7. Their transitivity, characters/reciprocity, intertwining, Clifford and projective content exists with the stated finite-complex specialization. No new dependency is taken on a revision of that existing roadmap. |
| RepresentationTheory/CharacterTheory on main | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:174` imports the native orthogonality/Hom-dimension results. Its character theory is not replanned here. |
| Native group carriers | `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:180` gives Extension as the two-coordinate type and :210 onward the twisted multiplication. `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:183` gives the subgroup of LinearEquiv; :196 spells out preservation. `Mathlib/GroupTheory/SemidirectProduct.lean:46` takes a homomorphism to MulAut. |
| Native finite-group induction | `TauCeti/RepresentationTheory/LinearCharacter/Basic.lean:162` bundles a unit-valued character. `TauCeti/RepresentationTheory/Induction/FiniteDimensional/Basic.lean:259` is right-coset/right-translation induction; :375 indFDRep, :381 forget equivalence, :640 dimension=index·dimension. These fit §§1.2,3.1,3.3,3.4. |
| Native character theory | `Mathlib/RepresentationTheory/Character.lean:144` requires finite group, invertible group order and algebraically closed field. `Mathlib/RepresentationTheory/FinGroupCharZero.lean:90`, :121 give scalar endomorphism and character-norm tests. `Mathlib/RepresentationTheory/Maschke.lean:159` supplies invariant complements. All coefficient hypotheses hold over ℂ. |
| Native quadratic/additive characters | `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:83`, :257 give primitivity and scaled sums. `Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:134`, :159 give the IsSquare alternatives (the first needs a≠0). :267 and `QuadraticChar/GaussSum.lean:37` supply the named −1 and2 evaluations. |
| Native linear algebra | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:240` is the finite-dimensional nondegenerate dimension formula. `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357`, :365 give a basis and even dimension over every field. `Mathlib/LinearAlgebra/Determinant.lean:164` defaults to1 outside finite free modules; finite-dimensional theorem contexts exclude that junk case. `Mathlib/LinearAlgebra/Pi.lean:110` supplies coordinate inclusion. |
| Native projective convention | `TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97`, :133 use μgμh=c(g,h)μgh and rescaling a(g)a(h)/a(gh). This is exactly the roadmap’s convention. |
| Native rank-one Heisenberg comparison | `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:58`, :89, :116 give the ring triple, cardinality and commutator. The +xy/2 coordinate correction gives the same product on e,f and on f,e. |
| Closest open work | Read the vocabulary/ownership hits and scope contracts for ExceptionalThetaCorrespondencesForG2, HalfIntegralWeightModularForms and the base MetaplecticAutomorphicForms. ExceptionalThetaCorrespondencesForG2 consumes local oscillators; HalfIntegralWeightModularForms consumes the discriminant-module representation. Neither owns these finite symplectic-group representations. |
| Other ownership searches | Searched objects (Heisenberg, finite Weil, fully ramified, parity determinant, isotropic coordinates, special isomorphisms) through `roadmaps grep`, main/Completed, and board packages. No competing owner of the new finite representation theorems was found. The parent’s bilinear extension remains imported, while the finite adapted-decomposition adapter is this roadmap’s extension. No fully qualified declaration collisions found. |

The scope diff has only `packages/MetaplecticAutomorphicFormsPartII/README.md`, `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean` and the existing package repair report. The Lean file uses one Mathlib root import and three individual existing Tau Ceti modules, has one module docstring and the correct namespace, uses `theorem` rather than `lemma`, and contains no `set_option`, `#eval`, `#print axioms`, sorry-data or algorithmic milestone. The local trivial action is exactly the required extension action on coefficients, not an accidental instance. The distinction between p=2 in the generic fully ramified theorem and the odd-characteristic half-form Weil theory is mathematically sound.

Dependency gate output, run against the supplied order and current content:

```text
depcheck: 237 roadmaps, 2144 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. No supplier gaps are declared. Internal headline proof flow is §1.2→§1.3→§2.1→§2.2→§2.3→§3.2→§3.3, with §1.4→§3.4 independent; §4.1 and§4.2 have the necessary earlier results. The parenthetical anticipated API consequences at §1.2 (intertwiners after §1.3) and §2.2 (W(−1) from §2.3) are not used to prove their predecessors, so no mathematical cycle was inferred from those cross-references.

## Not verifiable

- **Gerardin77, Theorem2.4:** original text is settled as uncertified/paywalled. It was not fetched or requested again. The correction is verified only through F21 footnote3 and the independent finite-field calculations; no claim is made to have read Gérardin’s proof or matched his exceptional Sp₂(𝔽₃) normalization directly.
- **Fresh elaboration:** prohibited by this read-only pass. Used the supplied elaborated types for all14 declarations, inspected the pinned source definitions and checked all binders manually. Proposed repairs have mathematical instance checks, not a new Lean compilation.
- **Open work beyond the supplied/indexed heads:** not searched independently. Ownership checks cover the supplied local/indexed copies and board packages; they cannot certify unpublished or subsequently changed work.
- **OCR-dependent typography in N02:** the mathematical identities were recomputed. Garbled symbols in the extraction were not treated as new source errors without an unambiguous surrounding argument.

## Source issues

- **Misprint** in N02 at the computation after Theorem4.3, printed p.23 (N02 lines343–344): the source says the cycle on the nonzero field elements is even while assigning sign −1; it should be odd, since its length q−1 is even; affects the proof.
- **Misprint** in FS25 at equation(3.3.3), printed p.14 (FS25 line522): the source says the pairing of the x and y cosets uses the commutator of x and z; it should be the commutator of x and y; affects a stated result.
- **Error** in FS25 at the proof of Lemma3.3.4, printed p.15 (FS25 lines557–559): the source says positive translation accompanies the phase ψ(ωB(v₊,x)); it should be ψ(ωB(x,v₊)) in compatible polarized coordinates, to recover the stated central character and commutator; affects the proof.
- **Error** in Gerardin77 at Theorem2.4(b), original printed page uncertified, reported at F21 footnote3, printed p.33 (F21 lines1346–1349): the source says to induce the smaller Weil–Heisenberg representation without the isotropic determinant character; it should be tensored with that quadratic determinant character before induction; affects a stated result.

For the additional FS25 phase error, a short independent witness is v₊=e,v₋=f over𝔽₃ with ω(e,f)=1. The printed formula gives Aφ(z)=ζᶻφ(z), Bφ(z)=φ(z+1); hence AB=ζ⁻¹BA. The group commutator is central1 and must act byζ. Swapping the pairing order gives Aφ(z)=ζ⁻ᶻφ(z), hence AB=ζBA as required. README §3.1 already uses this corrected order; no package repair is required for that source error.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a3e2b348ee658d6e8e4b6648484ad41b63cde06", "job": "RT-MetaplecticAutomorphicFormsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
