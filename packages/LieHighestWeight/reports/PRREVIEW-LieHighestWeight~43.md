# Review of LieHighestWeight (pull request #1220 at ab80440)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

6 findings: 1 P1, 5 P3; 1 blocking. `README.md` and `Suggested.lean` below are the folder's files. Library paths start with `TauCeti/` or `Mathlib/` and are read at the pins of this head's manifest. "Main" is the roadmap repository's main branch.

Nine of the previous review's eleven findings are repaired, one (the LieGroups cycle) is repaired by removal with a wrong owner named (R02), and one is not repaired (R05). The blocking finding is new to this review: the head adds a second two-way supply relation, with ReductiveGroups (R01).

## R01 (P1) — Layer 9 consumes ReductiveGroups, which consumes Layer 7: a supply cycle

**Location:** `README.md:661–662`, "ReductiveGroups Layers 2 and 5P supply the tangent and characteristic-zero closed-subgroup smoothness cut used by Layer 9"; `README.md:2338–2356` (the paragraph "Connected groups and the three different center comparisons"); `README.md:2449` (`*Needs:* … ReductiveGroups Layers 2 and 5P`); `README.md:2745`; `README.md:719–721`.

**Claim:** ReductiveGroups is a supplier of this roadmap.

**Witness:** Main `TauCetiRoadmap/ReductiveGroups/README.md:3111`: "*Needs:* the pinned signed shell construction (supplier contracts); LieHighestWeight Layer 7; 9A.1's Chevalley lattice", and lines 3091, 3265, 3343, 4608 consume "LieHighestWeight Layer 7's Serre comparison", the live target `serreLift_injective_of_base`. Main's LieHighestWeight README does not mention ReductiveGroups, so the reverse edge is new at this head.

This is the same shape as the LieGroups cycle of the previous two reviews: each roadmap needs a layer of the other. The dependency check prints 0 problems for it (it also did for LieGroups); the two edges are at different layers, and the principle is one direction of supply per roadmap.

**Repair:** ReductiveGroups cannot stop consuming the Serre presentation, so the consumed content moves out of here.

- Delete the group-level passage of §9.2: the adjoint actions of a connected reductive algebraic group, "a vector is G-fixed iff its differential is zero", `U(L)^G=Z(U(L))` and `Sym(L)^G=Sym(L)^L` (`README.md:2338–2356`), with the three citations of ReductiveGroups at lines 661–662, 2449 and 2745.
- Keep the three-map list of lines 2358–2367 with `Sym(L)^L` in place of `Sym(L)^G`; it needs no group, and its centre criterion is the pinned `TauCeti.UniversalEnvelopingAlgebra.pbwSymmetrization_mem_center_iff`.
- At lines 719–721 keep the remark that the polynomial model is not ReductiveGroups 10C's contragredient one, and drop "provide the dual/action dictionary when comparing with that model": that dictionary needs 10C, which is later than the layer of ReductiveGroups that consumes Layer 7.
- In Scope say that the connected-group comparison is not a target of this roadmap because ReductiveGroups consumes Layer 7. Name an owner only where a roadmap states it (see R02).

Checked on the consumers: AutomorphicFormsOnReductiveGroups' `gap:reductive-enveloping-centers` (its README lines 55, 351) asks only for the Lie-algebra centre and Harish-Chandra isomorphisms, which stay. No roadmap on main or at an open head cites the group-level passage.

## R02 (P3) — Scope assigns the compact applications to a roadmap that does not state them

**Location:** `README.md:113–114`, "so they follow LieGroups in the order of supply and belong to LieHighestWeight, Part II".

**Claim:** LieHighestWeight, Part II owns self-duality and Frobenius–Schur type on a compact group, the Haar proof of the type-A character identity, the regular extension from U(n), and the centre `P∨/Y`.

**Witness:** The only LieHighestWeightPartII is a board package (not on main, no open pull request). Its title is "highest weight theory, part II — sl₂-triples, weight filtrations and weight patterns", its six layers are about triples and filtrations, and none of the four items occurs in it. The pull-request description says the same: "The Part II roadmap does not yet list them".

The previous review's R01 repair named that roadmap from the merge-order list without reading its package. That instruction was wrong; removing the passages was right.

**Repair:** End the sentence at "so they follow LieGroups in the order of supply and are not targets of this roadmap", and delete "and belong to LieHighestWeight, Part II". Where an owner exists, name it by section: the type-A character identity is ClassicalGroups Layer 4 (already said in the module docstring); the density and irreducibility halves of the unitary comparison are pinned (`TauCeti/RepresentationTheory/ClassicalGroups/UnitaryTrick.lean`). For the centre `P∨/Y` and the Frobenius–Schur type on the character lattice no roadmap on main or at an open head states them (`roadmaps grep` for `P∨ */ *Y` matches only this roadmap); say nothing about an owner.

## R03 (P3) — "Layer 6F" is dropped and TensorProductCombinatorics cites it

**Location:** `README.md:61–65`, the table "Former layer numbering", which has rows for Layers 1, 2 and 4 only.

**Claim:** Every former identifier that another roadmap cites is mapped.

**Witness:** Main's LieHighestWeight `README.md:870` is "### Layer 6F: Fourier boundary values of the Weyl formula"; this head has no 6F. Main `TauCetiRoadmap/TensorProductCombinatorics/README.md:76` ("its Layer 6F is a consumer of §1.6 and §2.6") and `:2575` ("LieHighestWeight Layer 6F consumes §1.6's localization…") cite it.

The direction also changed: at this head §6.2 consumes nothing of TensorProductCombinatorics (`README.md:97–104`).

**Repair:** Add the row "Layer 6F: Fourier boundary values of the Weyl formula | §6.2 for the finite rational and torus-character identities; the cone-series and boundary-value composition is TensorProductCombinatorics §1.6, which this roadmap does not consume". Two further former identifiers are reused with different content and should have rows for the same reason, although I found no citation that breaks: Layer 0 (the `sl₂` engine, now `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` and `TauCeti.Sl2Std.isInternal_cgSummand`; LieGroups line 795 cites "Layer0's sl₂ strings") and Layer 5 (complete reducibility, now `TauCeti.exists_isCompl_of_isKilling`).

## R04 (P3) — §7.1 states the pinned centre action on isotypic components as its own

**Location:** `README.md:1601–1604`, "the center acts on the `λ`-isotypic component of any finite-dimensional module by `χ_λ`: the eigenspace-of-the-center refinement of the Layer 6 decomposition toolkit".

**Claim:** This is a statement of the roadmap; no declaration is cited for it.

**Witness:** `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isotypic.lean:121` (`isotypicComponent_irreducibleQuotient_le_centerEigenspace`, without finite-dimensionality), `:127` (disjointness for distinct central characters), `:164` (`isInternal_centerEigenspace`), `:180` (`exists_isDominantIntegral_eq_vermaCentralCharacter`).

**Repair:** Cite these four under *From Tau Ceti* and in the bullet, and keep as the target only what that file's docstring says it does not prove: distinct dominant integral weights have distinct central characters. For that target the rational transport of `README.md:1594–1599` is not needed: `TauCeti.sub_dotAction_mem_posRootCone_of_dominantIntegral` (`TauCeti/LinearAlgebra/RootSystem/Weyl/DominantIntegral.lean:251`, over any characteristic-zero domain) applied to `μ = w·λ` and to `λ = w⁻¹·μ` puts both `λ − μ` and `μ − λ` in the positive root cone. Checked in A₁: `λ = 0`, `μ = −2 = s·0` gives `λ − μ = α`, and `μ` is not dominant, as it must be.

## R05 (P3) — The family index still assigns PBW to this roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`, "The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences".

**Claim:** Ado–Iwasawa receives PBW from this roadmap.

**Witness:** `README.md:68–70` of this folder: "AdoIwasawa consumes native ordered PBW directly; this roadmap's additional exports are the central-monic finiteness adapter, the normalized symmetrization and the first-order bracket". Previous R09, not repaired; the description lists it as open. The pull request edits lines 36–39 of the same file, so the file is in its reach.

**Repair:** Replace the sentence by: both roadmaps consume Tau Ceti's PBW basis, filtration, domain and Noetherian theorems; the highest-weight roadmap adds the central-monic finiteness adapter that Ado–Iwasawa uses.

## R06 (P3) — Two sentences of the generated summary describe content the head no longer has

**Location:** pull-request description, block `roadmap-summary`: "while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality" and "general-linear comparisons and applications to compact group centers as targets".

**Claim:** These describe the head.

**Witness:** The type-A stable tensor decomposition was in the removed §5.2; the README has no such statement. `README.md:106–111`: "The compact-group applications of this theory are not targets of this roadmap: … the centre `P∨/Y` of a compact semisimple group". The author's own text below the block says the same.

**Repair:** Regenerate the block from this head. The rest of the description matches: fifteen theorems and one definition, no simplicity binder on the Serre headline, no other roadmap citing the removed §5.2 or §10.2 (checked on main).

## Verified sound

**Previous findings (review of `92ddd24`), checked first.** No repair report was supplied; nothing is settled as not actionable.

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 cycle with LieGroups | `README.md:106–116`, "are not targets of this roadmap"; no `*Needs:*` or contract names LieGroups | Repaired; the owner named is wrong → R02 |
| R02 Cayley–Dickson | `README.md:1817–1832`, "The carrier is native (From Tau Ceti)"; targets at 1837–1853 are what the pin lacks | Repaired |
| R03 Rees algebra | `README.md:870–871`, "is native (From Tau Ceti) and is consumed, not rebuilt" | Repaired |
| R04 affine Weyl group | `README.md:2486`, "The affine engine is native and is consumed, not rebuilt" | Repaired |
| R05 §9.1, CAR, Freudenthal, symmetrization | `README.md:2251–2264`, `2712–2719`, `1616–1618`, `1500–1504` cite the pinned names | Repaired |
| R06 "not statable" claims | five headlines added; docstring lines 44–52 keep four claims | Repaired; the four claims checked below |
| R07 redundant gaps | no `gap:` in the README | Repaired by removal |
| R08 Serre without simplicity | `README.md:1622`, "simplicity of `L` is not assumed"; no `IsSimple` binder | Repaired |
| R09 family PBW sentence | family `README.md:82–84` unchanged | Not repaired → R05 |
| R10 locators | `README.md:1176–1179`, `1252`, `2199–2201` (Etingof Corollary 18.8, p. 99; "derived statement, with no source claim") | Repaired |
| R11 "Zulip house style" | `README.md:126–127`, "State each result at the generality it actually needs:" | Repaired |

**Gate, build, scope.** The worker's gate passes with every counter 0. My rerun differs only in `outside-folder=1` for the family index, which is this pull request's own. The outside-folder diff is otherwise empty. `lake env lean` on `Suggested.lean`: exit 0, fifteen `sorry` warnings, nothing else. Dependency check:

```text
depcheck: 235 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. R01 is found by reading both READMEs; the check does not flag two roadmaps on main that cite each other at different layers.

**Signatures and padding.** The elaborated types of the 16 declarations (the worker's list has a 17th spurious entry `and`) were compared with the README statements one by one; each agrees in generality. The two "lost binder" leads are false: `IsTriangularizable K H L` is in both elaborated types. One-tactic probes on a scratch copy, each run over all fifteen theorems: `simp`, `rfl`, `infer_instance`, `exact?`: 0 closed. `productEnveloping` has a real body.

**Headlines.** Stated and true on the instances below: all fifteen. The docstring's four "not statable" claims hold at the pin: `TauCeti.AlbertAlgebra` is the split carrier only; `TauCeti/Algebra/Lie/E8/Vinberg.lean:81` has the module dimension 248 and no bracket; `Rees/ZeroFiber.lean` has no bracket; no category O. `Ω → P∨/Q∨` injective and the dominant-weight separation are statable but are short corollaries of pinned lemmas, so their absence is correct.

**Library declarations opened at the pin (31).** `LinearAlgebra/RootSystem/Alcove.lean:113,134`; `Weyl/Affine/Basic.lean:211`; `Weyl/Affine/Alcove.lean:258,284,325,379,389` (no closed-alcove uniqueness); `Weyl/ExtendedAffine/Alcove.lean:157,172,208,218` (kernel `= Ω ∩ W_aff`, onto; no injectivity); `Weyl/ExtendedAffine/Wall.lean:201`; `Weyl/DotAction.lean:352,401`; `Weyl/DominantIntegral.lean:251,265`; `Opposition.lean:101,198`; `Algebra/Lie/HighestWeight/Dual.lean:142,156,169`; `CentralCharacter/Isotypic.lean:121,127,164,180`; `CentralCharacter/Isomorphism.lean:84,106,159`; `Algebra/Octonion/Serre.lean:267,397` (surjective only; `Octonion/Simple.lean:29` says injectivity is not proved); `SimplyConnectedRootDatum/SerrePresentation.lean:40` ("No claim is made that … `serreLift` is injective"); `Combinatorics/Young/LittlewoodRichardson/Basic.lean:71` (`LRTableau inner outer μ`, so `LRTableau λ ν μ` is shape `ν/λ`, content `μ`, as the headline uses it); `…/Schur/LittlewoodRichardson.lean:313`; `Algebra/CayleyDickson/Quaternion.lean:312`; `Algebra/Octonion/Basic.lean:767` (Moufang on the split carrier only); `Algebra/Lie/Weights/WeightLattice.lean:100`. A spot check of 60 cited names found each at the pins; the worker's resolver lists none missing.

**Cross-roadmap citations resolved (on main unless said).** RootSystems Layers 1–6 (its own table at line 1136 maps "Layer 4: chambers and the longest element" to pinned declarations, so the citation of Layer 4 in §5.1 stands); ClassicalGroups Layers 2–4; SchurWeyl Layer 7 (line 580); ReflectionInvariantTheory §2 (line 19); CharacteristicClasses C5 (line 1344); LieGroupoidsPoisson G4.6A/B (line 1325: positive bracket `{ℓ_ξ,ℓ_η} = ℓ_[ξ,η]`, and line 1350: `{x,y} = y` for `[e₁,e₂] = e₂`, the same convention and witness as §3.1 here); PseudodifferentialOperators §3.1 (periodic Fourier expansions at line 715); TensorProductCombinatorics §§1.5, 1.6, 2.6 (lines 599, 694, 1191); ReductiveGroups Layers 2, 5P, 10C (lines 1230, 1880, 4223); GroebnerGeometry G4 (line 252); TangentialBordism §9.1 (B3.6), §9.2 (B3.7) at the open head (lines 2701, 2752), named in the merge-order paragraph.

Reverse edges: ClassicalGroups cites this roadmap for the highest-weight classification, which the former-numbering table sends to pinned declarations, so that pair is not a live two-way supply; ReductiveGroups is (R01). SchurWeyl, RootSystems, ReflectionInvariantTheory, CharacteristicClasses and TensorProductCombinatorics have no `*Needs:*` on this roadmap that it also supplies back.

**Overlaps.** #1797 conflicts in both files; the generated merge-order block puts #1797 first and the description says this one rebases on it: no finding. Ownership searches over main and the open heads (`LRTableau`, closed-alcove uniqueness, Moufang, `Der(𝕆)`, the Rees bracket, `serreLift` injectivity) found no second owner.

**Sources (12 sampled subsections).** Etingof's 18.755 notes were read in the MIT edition the README cites (PDF page = printed + 1). The manifest key `EtingofLieGroupsLieAlgebras` now resolves to arXiv v5, whose pages are about eight lower; the README's page numbers are right for the edition it names.

| Sample | Read at | Result |
| --- | --- | --- |
| 0.1 | MIT notes, Theorem 11.16 (line 2459, p. 66), Theorem 11.18 (line 2540, p. 68) | Exact; norms are derived here, recomputed below |
| 3.1, 3.2 | GuttDeformationQuantization lines 924–946, slide 14/28 | Positive bracket `⟨ξ,[X,Y]⟩` and averaged symmetrization; cited for the convention only, as stated |
| 5.1 | MIT notes, Example 32.13 and Proposition 32.14 (lines 6640–6658, pp. 176–177); EtingofRepresentationsLieGroups line 3469 (§17.2, p. 81) | Exact; the source assumes `λ = −w₀λ` and simple `g`, as the README says |
| 6.1 | MIT notes, Proposition 30.4 (line 5898, p. 159), step (3)⇒(2) at lines 5918–5920; Corollaries 30.5, 30.7 (lines 5930, 5945, p. 160) | Exact; the README now cites only the step it uses |
| 6.2 | MIT notes, Proposition 26.3 (line 5127, p. 139), Theorem 26.4 (line 5134, p. 140) | Exact |
| 7.1 | MIT notes, Theorem 24.2, Lemma 24.3 (lines 4763, 4784, p. 130; "any reduced root system" at line 4757; component reduction at line 4772); EtingofRepresentationsLieGroups Theorem 10.1 (line 2153, p. 51), Theorem 13.5 (line 2987, p. 69), Theorem 14.1 (line 3041, pp. 70–71) | Exact |
| 7.2 | Theorem 14.1(iv) (line 3058, p. 71), Remark 10.2 (line 2207, p. 52) | Exact |
| 9.1 | MIT notes, Corollary 18.8 (line 3647, p. 99) | Exact: reductive = semisimple ⊕ abelian |
| 9.2, 9.3 | Theorems 13.5, 14.1(iv)–(v), Example 10.3 (line 2213, pp. 52–53) | Exact; Dixmier §1.6 not readable |
| 10.1 | GarnierAlcoves Theorem 1.3.2 (line 231), Theorem 1.3.5 (line 276, p. 5), Proposition-Definition 2.2.1 (line 389), Corollary 2.2.7 (line 642), Proposition 2.3.1 (line 1161) | Exact; 1.3.5 is the closed-alcove fundamental domain |

**Adversarial table.** Values computed for this review.

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d=0; d=2, i=1; i=d | empty tensor ↦ `X₀⁰X₁⁰ = 1`; `e₁e₀ ↦ X₀X₁`; exponent `d−i = 0` | holds; `Fin (d+1)` prevents underflow |
| 0.1 form and norms | `E†=F` at d=2, i=1; (m,n,r) = (1,1,1), (2,2,1) | `1·binom(2,1) = 2·binom(2,0)`; sum 1+1 = 2, formula 2!/1! = 2; sum 1/2+1/2 = 1, formula 24/24 | agree |
| 0.1 intertwiner | N=2, i=1 | `F e₀ = 2e₁`, coefficient `1!/2!`, value `e₁` | agree |
| `module_finite_of_central_monic_relations` | `L = Kx`, `R = K[x²]`; `R = K`; `L = 0` | `U = R ⊕ Rx`; no monic relation, `K[x]` not finite; `U = K` | holds; hypothesis needed |
| `exists_reesZeroFiberBracket` | `[x,y]=y`; lift `a + ħ·j(z)`; abelian `L` | `t²ι(y) = ħ·j(y)`, bracket `y`; extra term `ħ²·j([z,y])`, quotient `ħ·j([z,y]) ↦ 0`; bracket 0 | well defined; sign fixed |
| 3.1 evaluation identity | ξ(x)=2, ξ(y)=3; sl₂ | `{x,y} ↦ 3`; `{x²,y} = 2xy ↦ 12`; `{e,h²+4ef} = −4eh+4eh = 0` | agree |
| 3.2 | a=0, b=c=1, d=0; `xy`; general p, q | `x⋆y = yx+ħy`; `S_sym(xy) = YX+ħY/2 = S_ord(xy+ħy/2)`; `B_ord − ½y(∂ₓp∂_yq+∂_yp∂ₓq) = ½{p,q}`; mean inversions of `xᵇyᵃ` are `ab/2 = D` coefficient | agree |
| `exists_pbwSymmetrization` | `l = []`; `l = [x,y]`; `p = y` | `e 1 = 1`; `(xy+yx)/2`; `e⁅x,y⁆ = xy − yx` | holds; not multiplicative |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ `V(1)`, `V(2)`; A₂ adjoint; C₂ standard; trivial module | sums 1, 2; 1+1+2 = 4; 3; 0, and a nonzero skew form on `K` is impossible while `(−1)⁰ ≠ −1` | skew, symmetric, symmetric, skew, symmetric; both conjuncts consistent |
| 6.1 inversion | `V(2) ⊕ 2V(0)` | orbit-sum coefficients (1,3), multiplicities (1, 3−1 = 2) | agree |
| 6.2 | GL₂, λ=(1,0), t=(2,3); A₁, weight n | −4 + 9 = 5 = 2+3; `(zⁿ⁺² − z⁻ⁿ)/(z²−1) = χₙ`; `sρ − ρ = −α` | agree |
| 7.1 translation, orbit Check, transport | A₁ | `τ_(−ρ)(h²+2h) = h²−1`; `(h²−1)/3`: 0 at ±1, 1 at ±2; shifted: 0, 0 on {0,−2}, wrong shift 0 and 8/3; `κ(h−2e,f) = −8` | agree |
| 7.1 Casimir | sl₂ | `h²/8 + (ef+fe)/4 = (h²+2h+4fe)/8`; `χₙ(Ω) = n(n+2)` | agree |
| `serreLift_injective_of_base` | rank 0; sl₂ × sl₂; convention | 0 = 0; 6 = 6; `[hᵢ,eⱼ] = αⱼ(hᵢ)eⱼ = A j i · eⱼ`, so the Serre matrix is `Aᵀ` | holds; `hS` forces `eⱼ ≠ 0` since `[eⱼ,fⱼ] = hⱼ` |
| 7.2 carriers | A₁ | `h²+2h` at 1, −1: 3, −1 (not invariant); at 1, −3: 3, 3 (dot invariant); `h²+4ef ↦ h²` | agree |
| Layer 8 dimensions | rank + roots | 2+12 = 14; 4+48 = 52; 6+72 = 78 = 52+26; 7+126 = 133 = 52+81; 8+240 = 248 = 80+84+84 | consistent with the four headlines |
| Layer 8 Cayley–Dickson Checks | i, j, ℓ with the pinned product | `(ij)ℓ = (0,k)`, `i(jℓ) = (0,−k)`; `ℓiℓ = i`, both Moufang sides `k`; `(ji)i = −j = j(ii)` | agree |
| Layer 8 Albert Checks | diag(3,1,1), x₁=1; `D = [L_A,L_B]`; `L_(E₀₀)` | 3 − 1 = 2; `B/4 − B/2 = −B/4`; trace `1 + 16·½ = 9` | agree |
| `isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau` | n=2, λ=μ=(1); n=1; n=0 | counts 1, 1 and 2·2 = 3+1; (1,1) excluded, 1 = 1; 1 = 1 | holds |
| 9.1 reconstruction | gl₂ | standard ↦ (V(1), 1); determinant ↦ (V(0), 2) | agree |
| `exists_productCenterEquiv` | `Z = K`, `S = sl₂`; `Z = S = 0` | `K[t] ⊗ K[C]`, `z ↦ z⊗1`; `K ≃ K⊗K` | holds over any field |
| 9.3 Casimir, CAR | gl₂, μ=(3/2,1/2); staircase; N=2 | 15/4 − 1/4 = 7/2; lowering at t changes the scalar by `−3N+3+4t`, differences `4(t−s)`; `N²/2 = 2`, 16 = 8·2 | agree |
| `eq_of_mem_closedFundamentalAlcove_of_mem_affineWeylGroup` | A₁, coordinate α(x) | orbit of 2/3 under `x ↦ ±x+2k` meets [0,1] in 2/3; orbit of 1 is the odd integers; with `P∨`: 2/3 ~ 1/3 | holds for `W_aff`, fails for `W_ext`, as the Checks say |
| 10.1 diagram automorphisms | A₁, A₂, D₄, E₆, Bₙ | `|Aut|` = 2, 6, 24, 6, 2 = `|Ω|·|Γ_root|` = 2·1, 3·2, 4·6, 3·2, 2·1 | agree |
| §9.2 connected-group comparison | supply edges | this Layer 9 ← ReductiveGroups 2, 5P (`README.md:2449`); ReductiveGroups 9 ← this Layer 7 (main, line 3111) | two-way → R01 |
| Former numbering | identifiers on main and here | main: 0–10, 6F; table: 1, 2, 4; cited from outside: 6F (two lines) | → R03 |
| §7.1 centre on isotypic components | pin | `Isotypic.lean:121,164` | pinned → R04 |

## Not verifiable

- `HumphreysIntroLieAlgebras` (§20.3 at `README.md:1048`), `BourbakiLie78`, `GoodmanWallachSymmetry`: settled uncertified; not read.
- Dixmier §1.6 (`README.md:2382`), Serre, Fulton–Harris, Jantzen, Molev, Humphreys' category O: no readable legal text on this worker; not requested again.
- Layer 8's locators (Schafer, Baez, Garibaldi, Landsberg–Manivel) are outside this round's sample and were not re-read; the previous review read them at the same lines.
- The five closest open roadmaps were searched by object, not re-read in full.
- Completeness of the pinned-duplication sweep: I searched by object for each target of Layers 0, 3, 5, 6, 7, 9 and 10 and for the Layer 8 headlines; the remaining Layer 8 targets (cross product, formally real Albert algebra, complexification APIs) were checked only against `TauCeti/Algebra/CayleyDickson/` and `TauCeti/Algebra/AlbertAlgebra/`.

## Source issues

- none
