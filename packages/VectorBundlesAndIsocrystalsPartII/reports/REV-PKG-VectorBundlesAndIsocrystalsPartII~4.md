<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6783809030 -->
Review (codex) of e8dde6d

Verdict: accepted
Conditional on the announced gaps: `G-HOM`

No findings. Acceptance is conditional on the existing supplier contract `G-HOM`; it does not certify that contract as implemented. The two preceding findings are repaired. The authored README, Suggested.lean, metadata and source manifest were not changed.

## Verified sound

### Previous findings, checked first

Locations in this subsection refer to `packages/VectorBundlesAndIsocrystalsPartII/README.md`.

| Previous finding | Repaired passage | Status and recomputed witness |
| --- | --- | --- |
| F01, forgetting semilinearity versus forgetting the action | Line 40: “Forgetting the Galois action gives isomorphic one-dimensional `ℂ_p`-vector spaces”; also “forgetting only `C`-linearity of morphisms retains the zero continuous additive equivariant Hom group by §0.2.” | **Repaired.** Over finite K/ℚ_p, the invariant spaces of C(1) and C are 0 and K. Equivariant continuous additive Hom is 0; forgetting the action gives Hom_C=C, containing an invertible identity of the underlying lines. |
| F02, coefficient estimate at index zero | Line 626: “The constant coefficient of `A` is 1. For `k ≥ 1`, its nonconstant coefficients”; line 636: “the positive bounds apply only to nonconstant coefficients.” | **Repaired.** At p=3, indices 0,1,2,3,6,9 give valuations 0,1,2,2,4,5. At p=2, indices 0,1,2,3,4 give 0,2,3,5,5. A(0)=1 has valuation 0. The constant coefficient of (A−1)/p, or (A−1)/4, is 0. |

The associated §3.2 Check at line 602 now also specifies k≥1. For all positive k, v_p(k!)≤(k−1)/(p−1) gives the odd-prime bound, and v₂(4ᵏ/k!)=k+s₂(k)≥2 gives the two-adic bound. Both tend to infinity. Thus the repair passes the original counterexample k=0 without changing the unit congruence or tower. The forgetful-action and coefficient patterns were searched throughout the package; no recurrence was found. No finding was marked “not actionable” in the preceding repair report, and none is re-raised.

### Coverage, principles and form

Read all four package inputs, all 62 numbered targets, all 62 Needs lines, their API bullets and Checks, and all seven layer Examples and Dependencies sections. Every target was reconsidered, including sections for which the preceding review provided only prose assurances. An independent full mathematical ledger was retained in review scratch; the compact table below contains the seeded sample, headlines, repaired passages and additional convention controls. The calculations are tests of the proposed general statements, not proofs of them.

This is an extension of VectorBundlesAndIsocrystals' classical finite BC theory. Its arithmetic almost-C theory, sympathetic topological enlargement and period-valued height comparison have separate, explicit ownership boundaries. It neither replans its parent nor restricts to selected primes. In particular, the two-adic exponential and finite cyclotomic character are handled explicitly. Finite K/ℚ_p and the more general complete discretely valued base are distinguished; the arithmetic Lean headlines do not acquire the countability assumptions of sympathetic algebras.

No computational algorithm, copied source passage, sorry'd data, set_option, empty Prop stand-in, forbidden supplier, route-specific shortcut or process residue was found. The mathematical order is forced where necessary: TVS and Pairs precede the disc class, which precedes period comparisons and qBC full faithfulness. The height theory is placed after the enlargement even though CN25 discusses it earlier. No layer is named after a source chapter. A local proof-route reference does not make the source's exposition the organization of this roadmap.

Compared the house form with main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md` and `TauCetiRoadmap/PerfectoidSpaces/README.md`. Each new definition has its API and at least three discriminating Checks; every theorem has a locator and stated hypotheses, and each numbered target has its own Needs line. Each layer ends with Examples and Dependencies. The only identifiers attributed to this roadmap in code spans are the structure and the two theorem declarations actually in Suggested.lean. Mathematical notation is not mistaken for a declaration. Metadata and the ten unique manifest entries agree with the scope and cited works.

### Seeded source verification

All ten manifest works have readable legal cached texts. There are no author-flagged unverified locators, missing works, or uncertified entries to reopen. No source fetch or manifest change was necessary. The following are printed page numbers, checked against the cached page markers. All descriptions are paraphrases.

| Seeded target | Source and locator opened | Support, hypotheses and limits |
| --- | --- | --- |
| 0.6 Finite-length periods are almost C | Fontaine03 Theorem C, p.291, lines 272–274; CN25 p.9, lines 410–414 | Finite K/ℚ_p, finite-length semilinear period representation of length d: almost-C Dimension (d,0). This does not identify the Galois representations C and C(1). |
| 1.3 Cyclotomic data and generalized invariants | CN25 §2.2.2 and footnote 3, p.10, lines 437–449, 474; Fontaine03 §2.1 p.296, lines 475–485, §2.3 p.306, lines 896–902, §2.5 p.308, lines 987–1000 | Correct finite-character correction to exp(log χ), special two-adic normalization, and generalized invariants quantified over all Galois elements. Multiplication by the nilpotent period is not inverted. |
| 1.7 Vanishing into longer truncated periods | CN25 Corollary 2.9, p.10, lines 455–460 | N≥0 and 1≤i<j give both Hom and Ext¹ vanishing. Equal lengths are deliberately excluded. |
| 1.8 Fundamental theorem for an extension of a C-line | Fontaine03 Theorem 4.1, p.329, lines 1816–1824, proof conclusion p.340, lines 2294–2298; FF18 Preface Theorem 2.25, pp.21–22, lines 948–958 | Primary source allows an arbitrary one-dimensional C-representation W. Finite-dimensional V, continuous equivariance and the image inequality imply surjectivity and kernel dimension dim V. FF18's W=C formulation alone would not justify the general W. |
| 1.9 Equivariant analytic realization | FF18 Preface Remark 2.26(i), p.22, lines 972–977; Fontaine03 §1.6, pp.292–294, lines 299–355 | Analytic realization and presentation inputs are present. The package separately owns the induced action, its continuity and compatibility; it does not treat arbitrary chosen lifts as an action. |
| 3.1 Sympathetic disc and translation characters | CN25 §4.2, pp.22–23, lines 1053–1069; Colmez02 Proposition 5.20, p.30, lines 1296–1299, and Proposition 5.23, pp.31–32, lines 1348–1373 | Lifting and translation action, compatible roots, and character values agree. For the normalized Kummer generator, ψ₁=1/p at odd p and 1/4 at p=2. |
| 3.5 Bounded denominators for additive analytic cocycles | CN25 Lemma 4.13, p.24, lines 1155–1168 | Primitive with at most one p denominator. Package corrects the constant's sign and the binomial index in the source proof. |
| 4.3 Reasonable Pairs and same type | CN25 §4.4, p.27, lines 1339–1344; Theorem 4.30, p.31, lines 1560–1584 | Both models of each Pair and both Pairs use the same reasonable branch. No closed-image hypothesis is inserted. Localization, not just presentation squares, defines morphisms. |
| 4.5 A profinite cocycle lies in one compact-type step | CN25 Lemma 4.19, p.26, lines 1249–1258 | Profinite group, invariant Banach steps, compatible continuous isometric actions and a continuous cocycle. Baire and finitely many coset values yield one common step. |
| 4.9 Period comparison without countable type | CN25 §4.3.2, p.26, lines 1259–1271; Proposition 4.22, p.27, lines 1291–1338 | Period-model definition is not restricted to separable models. The printed reduction uses the narrower Proposition 4.18; §4.9 expressly owns the nonseparable extension instead of silently narrowing the result. |
| 4.10 Hom and Ext from B_d | CN25 Proposition 4.22, p.27, lines 1291–1338 | Hom is W[tᵈ], Ext¹ is W/tᵈW, with the specified model topology and period structures. Induction on the torsion exponent and the same-type conditions are preserved. |
| 4.11 Constant-source evaluation and projectivity | CN25 proof of Lemma 4.24, p.28, lines 1383–1418; Proposition 4.25, lines 1419–1431; Remark 4.8, p.22, lines 1044–1052 | No Galois action is present. Evaluation at the initial algebra C gives Hom from constant ℚ_p; Ext¹ vanishes, including localized Pairs. This is not the arithmetic Galois cohomology assertion. |
| 4.16 Full faithfulness for reasonable Pairs | CN25 Theorem 4.30, p.31, lines 1560–1584 | Hom comparison after localization for reasonable Pairs of the same type. The package does not extrapolate an arbitrary-degree Ext comparison from full faithfulness. |
| 5.4 Full faithfulness of reasonable qBCs in TVS | CN25 Corollary 4.31, p.31, lines 1585–1588; Remark 4.6, p.22, lines 1026–1028 | Reasonableness and same type retained, with intrinsic positive and negative BC pieces. No splitting of the defining filtration is claimed. |
| 6.6 Vanishing and exactness in nonpositive curvature | CN25 Lemma 3.26, pp.19–20, lines 921–938 | Ext¹ vanishes for curvature≤0; the height functor is contravariant and exact on that range. The positive-curvature C/ℚ_p control is excluded. |

Also opened the headline and bridge inputs: Fontaine03 Theorem A, p.290, line 213; CN25 Theorem 2.6, p.10, lines 431–436, Proposition 4.10, pp.23–24, lines 1083–1107, and Proposition 3.27, p.20, lines 939–955; Schneiders99 Corollary 1.2.21, pp.24–25, lines 852–864; LeBras18 Theorem 4.1, p.26, lines 1176–1201; TVS25 Definition 3.32 and Theorem 4.1, pp.23–24, lines 1054–1069; AnschutzLeBras25 Corollary 3.8 and Theorem 3.9, pp.3675–3676, lines 972–1008; Fontaine04 Proposition 6.2, p.107, line 4274 and its proof at p.111, line 4396; Colmez12 Theorem 3.1(ii), p.117, lines 294–297. The last extraction is OCR, but the needed density statement is readable. The enriched condensed, sheaf and sympathetic categories are not identified by definition: §§6.2 and 6.4 explicitly own the necessary transport and dévissage.

### Computed adversarial table

C denotes the completed algebraic closure, B_m=B_dR⁺/tᵐ, and V₁ the sympathetic C-line functor. Arithmetic, VS and TVS Hom/Ext are distinguished. All rows passed; no change is requested. Mixed characteristic, prime p, finite arithmetic K where specified, and the stated universes exclude zero fields, p=1 and unbounded category sizes. Nonseparable period models remain included in §4.9. The repaired-convention calculations above supplement this table.

| Statement | Instances tried | Computed values / negative control | Result / change |
| --- | --- | --- | --- |
| Conventions / SemilinearRep | Standard C action, zero, trivial action at 2 and 3 | σ(cw)=σ(c)σ(w); zero 0=0; wrong trivial action requires i=−i or ζ₃=ζ₃² | Laws distinguish actions; no change |
| Conventions / height | Qp,C,C/Qp | (dim,ht)=(0,1),(1,0),(1,−1); adding 1 at both endpoints changes height by 1−1=0 | Signed normalization agrees; no change |
| 0.2 | C,C(1),B₁,B₂,zero | End_G(C)=K in both categories; twist Hom=0; Hom_G(B₁,B₂)=0 whereas action-free period Hom=tB₂ | Full faithfulness consistent; repaired contrast correct; no change |
| 0.5 | Qp→C→C/Qp; C(1)→B₂→C | 1=0+1; 0=1−1; 2=1+1; 0=0+0 | Additivity; no change |
| 0.6 | B₂,C(1),0,Qp | (2,0),(1,0),(0,0),(0,1) respectively; twist Hom still 0 | Almost equivalence is weaker than isomorphism; no change |
| 1.3 | W=0,C,B₂; cyclotomic signs | generalized pieces (0,0),(K,0),(K,Kt′); log(−1)=0; exp(log5)=5 | No inverse of nilpotent t; finite character removed; no change |
| 1.4 | W=C,C(1),B₂ | Cohomology triples (K,K,0),(0,K,K),(0,0,0); d₁d₀=0; wrong character at 5 gives −24t′ | Twist and sign fixed; no change |
| 1.5 | Qp,Qp; C,C(1) | Euler 1−([K:Qp]+1)=−[K:Qp]; 0−[K:Qp]+[K:Qp]=0 | Degree 2 survives, unsigned formula false; no change |
| 1.7 | N=0,i=1,j=2; excluded i=j=1 | d₀=(1,0),d₁=(0,1), all cohomology 0; equal truncations admit identity | Hom and Ext¹ both 0 in allowed case; no change |
| 1.8 | η=(g,1),(g,0) on V⊕C; θ on U₁ | First ker={(v,−g(v))}, dimension h; second image=η(V), kernel includes C; kerθ=Qpt dimension1 | Image inequality essential; no change |
| 1.9 | Finite V; C; C(1) | constant Dimension (0,dimV); End_G(C)=K versus End_BC(V₁)=C; twist fixed points0 | Faithful forgetting is not full; no change |
| 3.1 | E₀; root generator at p=3,2 | E₀=1,ψ₀=0; ψ₁=1/3,1/4; ψ₂=1/2 at2 | Fractional lattices fixed; no change |
| 3.2 | first levels at3,2 | Y₀³=X mod3^(1/3); Y₀²+Y₀=X mod2; Y₁²+√2Y₁=Y₀ at2 | Initial two-adic relation differs; no change |
| 3.3 | n=0 and n=2ʳ | v₂(4⁰)=0; v₂(2ⁿ/n!)=1 at powers of2; v₂(4ⁿ/n!)=n+1; ψ₂/2=1 when ψ₁=1 | Convergence and norm factor2; no change |
| 3.4 | coefficients, tower, eigenline, zero cocycle | At3 k=0,1,2,3,6,9 valuations0,1,2,2,4,5; at2 k=0,1,2,3,4 values0,2,3,5,5; first degrees6·3=18 and2·2=4; inverse norms√3 and2; λ(ψ₁)=1 | Positive estimates start at1; normalized traces divide by nonzero ψ₁(γ); no change |
| 3.5 | constant c,YZ,p-power degree | δ(−c)=c; δ(X²/2)=YZ; v₂(1/2)=−1; v_p binom(pʳ,p^(r−1))=1 | Sign and bounded denominator; no change |
| 3.7 | split,B₂,pushout by a | extension parameters0,1,a; λ_v=vλ_E | Framing distinguishes nonzero classes; no change |
| 4.3 | identity,C→C²,dense T | quotients0,C,nonzero [(pⁿ)] | Same type need not mean strict; no change |
| 4.4 | w=0,1 on C; w=t on B₂,d=1 | classes0,1,0; (tc,−c) maps to0 under b+tc′ | Sign and quotient parameter; no change |
| 4.5 | H=1,S₃,Zp; noncompact direct sum Z | images0,{0,e₂−e₁,e₃−e₁},Zp⊂C; noncompact inclusion ⊕Z→⊕Ce_n has image in no finite stage | Profinite and invariant-step hypotheses matter; no change |
| 4.8 | C^N,c₀,zero tower | constant1 in product not c₀; (pⁿ) in both; lim0=lim¹0=0 | General Fréchet not narrowed to nuclear; no change |
| 4.9 | c₀(I,C) uncountable; B₃,d=2 | f_a(1)=a; pushout parameter a; torsion and quotient lengths2,2 | Full period-model class retained; no change |
| 4.10 | B₃,d=0,2,5 | Hom/Ext lengths(0,0),(2,2),(3,3) | Total exponent0 consistent with B₀=0; no change |
| 4.11 | W=C; dense Pair; arithmetic Qp | Hom=C,Ext¹=0; Pair Hom contains nonzero [(pⁿ)]; arithmetic H¹ dimension[K:Qp]+1 | No action or Hausdorffization inserted; no change |
| 4.16 | B₁→B₂ Module Pairs; dense identity | Hom=tB₂≅C in three categories; identity sends nonzero [(pⁿ)] to itself | Localization not chain-map restriction; no change |
| 5.1 | zero,Qp,pure Pair,C/Qp | heights0,1,0,−1; Qp negative partQp, other pieces0 | Height signed, not middle dimension; no change |
| 5.2 | C/Qp→[0→B₂]; zero-curvature B₁ | restriction tB₂↪B₂ injective, kernel0; End B₁ contains1 | Positive condition essential; no change |
| 5.4 | pure Pairs; p on C/Qp | period Hom preserved; pQp=Qp, inversep⁻¹, ht−1=−1 | Same type maintained; no change |
| 5.5 | LA→C⁰; derivative distribution | nonzero cokernel; Hom=0; derivative on f_n=x·1_(pⁿZp) gives1 while sup normp⁻ⁿ→0 | Derivative class nonzero modulo measures; no change |
| 6.1 | 0,Qp^r,B_m,C/Qp; p map | h=0,BDR^r,0,0; precomposition p reverses arrow, sends1 top | G-HOM uniformity not replaced by elementwise union; no change |
| 6.2 | Qp,V₁; V₁,V₁; B₂ boundary | Ext¹0→0; Hom/Ext¹C→C; boundary1↦1 | Zero comparison excluded; no change |
| 6.4 | Qp,V₁,C/Qp | localized Ext¹0,0,rank1; V₁ system C with zero transitions has colimit0 | No arbitrary colimit commutation; no change |
| 6.6 | C,Qp,Qp⊕C; excluded C/Qp | Ext¹ ranks0,0,0 versus1; dual sequence0→0→BDR→BDR→0 identity | Nonpositive range correct; no change |
| 6.7 | Qp,C,C/Qp,Qp⊕C | ranks(1,0),(0,0),(0,1),(1,0); equations1=1+0,0=0+0,0=−1+1,1=1+0 | Signed correction term; no change |

The sign controls propagate through the arithmetic two-operator complex, disc cocycle, framed pushout and contravariant height construction. In particular, the inverse character gives d₁d₀=0, while the wrong character at χ⁽¹⁾=5 gives −24t′; δ(−c)=c for a constant cocycle; and the relation (tᵈc,−cw) maps to zero in the pushout. For k=pʳ the corrected interior binomial index p^(r−1) has valuation one. Integer computations at p=2,3,5 and degrees through 128 agree with the general valuation calculation. They are review calculations, not roadmap algorithms.

The dense-map control throughout the left-heart theory is T:c₀→c₀, T(x)_n=pⁿx_n. It is injective with dense image but misses (pⁿ), whose only possible preimage is the non-null sequence (1). Thus its algebraic cokernel is nonzero and its separated cokernel is zero. This distinguishes the actual Pair category from the plausible but incorrect Hausdorff replacement. The noncompact counterexample to §4.5 is the discrete group ⊕ℤ with its inclusion cocycle into ⊕Ce_n: its image is in no finite step. In the nonabelian S₃ test, the coboundary g↦ge₁−e₁ instead has three values in a single finite step.

### Headline inventory and Lean acceptance test

The README's summary and end targets give the following acceptance inventory. Locations are in `packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean`.

| Headline | Disposition at the pins |
| --- | --- |
| C-representation full faithfulness, §0.2 | `semilinearRep_equivariant_map_smul`, line 62. |
| Finite-length period full faithfulness, §0.2 | Named at lines 24–25 of the module docstring: native BDeRhamPlus lacks the required canonical topology and Galois action. |
| Almost-C structure and Euler–Poincaré duality, §§0.5, 1.5 | Named at lines 26–28: Banach Galois and almost-C categories and their Ext are missing. |
| Fundamental extension theorem, §1.8 | `fundamental_extension_surjective`, line 85. |
| Disc extension isomorphism, §3.7 | Named at lines 29–32: sympathetic algebras, the left heart and TVS carrier are missing. |
| Reasonable qBC full faithfulness, §5.4 | Named in the same paragraph: period Pairs and qBC carriers are missing. The intervening Hom/Ext comparisons have the same obstruction. |
| Height–rank formula, §6.7 | Named at lines 33–35: sympathetic VS, BC spaces and the period-valued functor are missing. |

The only auxiliary definition is the real-bodied `SemilinearRep` structure at line 46, needed for the two statable headlines. All three own names occur in the README. There is no weakened substitute for an unavailable carrier, no catalogue, and no boundary-case theorem.

Ran the prescribed `lake env lean` on the original Suggested.lean from the content checkout: exit 0, exactly two warnings, at 62:8 and 85:8, both “declaration uses sorry”. Its only import is `import Mathlib`; no TauCeti module build was needed. Ran a separate scratch copy with `#check @` for all three declarations: exit 0 with the same warnings. Compared the elaborated signatures with Conventions, §0.2 and §1.8, and with the worker's supplied signatures. No binder disappeared.

In particular, the first theorem retains finite K, both finite C-dimensions, both module topologies, continuity and equivariance. The second retains completeness of E, finite dimension of V, the line condition, continuity and joint continuity, surjectivity and kernel of q, equivariance of q and η, and the image inequality. `finrank C W=1` excludes infinite-dimensional W, whose finrank would be zero. Continuous additive q is ℚ_p-linear by density, so its signature is not weaker than the prose in a harmful way. The action structure does not itself assume separation or finite dimension; the theorem signatures provide their required module topology and dimension hypotheses.

Probed **both** sorried theorems in a scratch copy with independent one-tactic attempts `simp`, `rfl`, `infer_instance`, and the stronger `simp_all`. Each failed to close either theorem; the probe exited 1 with unsolved goals. Opened the library near-matches below and found no single existing lemma proving either statement. Neither theorem restates a definition, mirrors a Check, or treats only a boundary case. All Lean processes finished; nothing was left running.

### Pinned-library duplication audit

The checked commits agree with the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths in this table are relative to the respective pinned library root.

| Opened declaration and file | What was checked |
| --- | --- |
| `CategoryTheory.Functor`, `Mathlib/CategoryTheory/Functor/Basic.lean:40`; `LinearMap`, `Mathlib/Algebra/Module/LinearMap/Defs.lean:84`; `AddMonoid.End`, `Mathlib/Algebra/Group/Hom/Defs.lean:975` | Native functor, linear map and additive endomorphism objects; the last is generated from Monoid.End. None supplies the sympathetic category or semilinear action theorem. |
| `TopModuleCat`, `Mathlib/Algebra/Category/ModuleCat/Topology/Basic.lean:41` | Topology, topological addition and continuous scalar multiplication; no separation or completeness field. The roadmap does not infer these missing axioms. |
| `ContinuousLinearMap.exists_preimage_norm_le` and `ContinuousLinearMap.isOpenMap`, `Mathlib/Analysis/Normed/Operator/Banach.lean:162` and `:229` | Open mapping and norm-lifting hypotheses include the complete normed spaces in scope. They do not prove the nonarchimedean model extension statements. |
| `Submodule.torsionBy`, `Mathlib/Algebra/Module/Torsion/Basic.lean:177` | Kernel of scalar multiplication, matching W[tᵈ], including d=0. |
| `BDeRhamPlus`, `BDeRham`, `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88`; `WittVector.fontaineTheta`, `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166` | Ring constructions and theta exist. They do not provide the topological Galois period representation or sympathetic period-valued functor. |
| `Abelian.Ext`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; `Ext.mapExactFunctor`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:126` | Ext requires the appropriate abelian/derived setting; exact-functor transport does not construct the missing categories. |
| `PadicAlgCl`, `PadicComplex`, `Mathlib/NumberTheory/Padics/Complex.lean:54`, `:137`; valued instance at `:145` | Native algebraic closure and completion, with prime p. |
| `krullTopology`, `Mathlib/FieldTheory/KrullTopology.lean:134`; `spectralNorm_eq_of_equiv`, `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451` | Topology of the Galois group and norm preservation justify the supplier's completion action. |
| `UniformSpace.Completion.map`, `Mathlib/Topology/UniformSpace/Completion.lean:477`, restriction law at `:488` | Native completion map is used directly; its restriction law requires uniform continuity. The supplied isometry provides it. No second completion action is owned here. |
| `IsModuleTopology`, `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133` | Equality with the module topology, not an arbitrary topology on finite-dimensional headline carriers. |
| `TauCeti.ExactStructure`, `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241`; `IsConflationExact`, `TauCeti/CategoryTheory/Exact/Functor.lean:74` | Exact-category and additive conflation-preserving interfaces exist; no VS or TVS exact structure is already constructed there. |

Opened the near-matches rather than treating their search ranking as duplication: `ContinuousSemilinearMapClass` at `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean:79` concerns maps, not actions or automatic C-linearity; `IntermediateField.finiteDimensional_left/right` at `Mathlib/FieldTheory/IntermediateField/Algebraic.lean:54` and `:55` transport dimensions; `CondensedMod.LocallyConstant.fullyFaithfulFunctor` at `Mathlib/Condensed/Discrete/Module.lean:145` is about discrete condensed modules; `TauCeti/FieldTheory/Galois/SemilinearDescent.lean:17` begins finite-Galois algebraic descent. None proves either headline. Object searches of both pins found no existing Banach–Colmez, sympathetic TVS, almost-C or qBC carrier hidden under another declaration name.

### Cross-roadmap ownership and supplier resolution

Read the board package index before searching for owners. Used the supplied open-head index with `roadmaps grep` by objects and `roadmaps show`, together with searches of main and board packages. All cited supplier headings were resolved afresh. This was not an audit based solely on remembered names. The following file locations are actual roadmap README lines, not extraction-header offsets.

| Supplier / consumer | Resolved file and evidence |
| --- | --- |
| VectorBundlesAndIsocrystals, open #1205 | `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md`: sympathetic VS 1287, finite BC presentations 1310, exact faithful realization 1333, Dimension 1341, standard Dimensions 1349, curvature orthogonality 1414, tilted heart 1422, Le Bras equivalence 1445, HN decomposition 1477, filtration 1491, Artinian property 1525, morphism calculus 1541, untilt torsion 1553, curvature zero 1561, torsion-period Hom 1569, HN support 1577, torsion subobject height 1601, nonpositive extension 1617. All 18 named Layer 5 headings exist; their content is imported. The parent's finite classical BC theory does not duplicate the enlargement here. |
| PadicPeriodRings, open #940 | `TauCetiRoadmap/PadicPeriodRings/README.md:91`, `:105`, `:217`, `:272`, `:417`, `:449`, `:470`: §§1.1–1.2 completion action/fixed field, §1.5 topology, §2 general base, §§4.1–4.3 carriers/functors/maps. The package consumes the action rather than reconstructing it. The supplier distinguishes separate from joint continuity of global period multiplication. |
| PadicHodgeTheory, open #1062; FiniteFlatGroupsAndIntegralPadicHodgeTheory, open #879 | `TauCetiRoadmap/PadicHodgeTheory/README.md:894` (§4.4); `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1596` (§R07.P7.2): rational Sen theory, including the general semilinear scope and labelled operators. Neither owns Fontaine's automatic-linearity theorem. |
| LocallyAnalyticDistributions, open #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:939`, `:957`, `:1081`, `:1097`, `:1107`, `:1125`, `:1135`: left heart, tensor/completion and §0.2 functional extension, Fréchet/limit/compact-type interfaces. Its finite-K compact-type scope and finite-dimensional cohomology condition are retained. §§4.6 and 4.8 here own the C and general inverse-limit extensions. Distribution inputs remain supplied by its §§0.3 and Layer 1. |
| ArithmeticGaloisRepresentations, open #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:779`, §1.1: continuous finite-dimensional representations. The Banach ambient category and semilinear structure here are distinct. |
| ArithmeticGaloisDuality, open #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700`, `:1190`, `:5392`: §R02.1.3 rationalization, §R02.2.1 discrete-coefficient Hochschild–Serre, §D7.4 local Tate duality. Discrete Hochschild–Serre is not cited as a theorem for arbitrary topological period coefficients. |
| PerfectoidSpaces on main; PerfectoidTowers, open #816 | `TauCetiRoadmap/PerfectoidSpaces/README.md:3563`, `:8150`, `:13830`: P1, P3, P6; almost purity P3.13 at 8746. `TauCetiRoadmap/PerfectoidTowers/README.md:2171`, `:2457`, `:2480`: profinite Galois tower, P9.6 descent, almost cohomology and derived-limit condition. The §3.4 tower is over ℚ_p before base change, as that supplier requires. |
| AlgebraicVectorBundles on main | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:27`, `:388`, `:416`, `:472`, `:499`: Scope, Layers 1–2, pullback/tensor and internal Hom. The citation uses existing layer numbers and defers ordinary vector-bundle foundations. |
| CstConjectureForDaggerVarieties, open #1759, consumer | `TauCetiRoadmap/CstConjectureForDaggerVarieties/README.md:7` and `:102`: scope and contracts import this package's Pairs, qBC and height theory. No reverse supply or shared ownership. |
| CohomologyComparisons, open #1064, consumer | `TauCetiRoadmap/CohomologyComparisons/README.md:863`–§4.11 at 922: named comparison direction, with general-base/countability scope at 865. This package does not consume that downstream work. |

The overlap facts list no conflicting head, dropped cited id, incoming lost id, or id defined only by an open revision. Inspected all five closest heads: #1759, #1205, #1062, #940 and #854. Their ownership boundaries agree with the table. Searches of additional relative Fargues–Fontaine and pro-étale curve material found geometric/classical BC consumers, not a second owner for the reasonable-Pair or qBC construction. No fully qualified declaration in Suggested.lean collides with a readable roadmap. No ownership move or numbering migration is needed.

The board-index packages AnalyticNumberTheory (#123), LawrenceVenkateshMethod (#345), and LogicAndDefinabilityInNumberTheory (#164) were included in the ownership search; none supplies a competing object. Open-roadmap ownership was checked using the supplied indexed heads, not guessed from titles.

### Supplier contract and mechanical checks

`packages/VectorBundlesAndIsocrystalsPartII/README.md:100` and `packages/VectorBundlesAndIsocrystalsPartII/design/plan.json:2925` agree on `G-HOM`, its supplier VectorBundlesAndIsocrystals, and the Layer 5 section. The requirement is precise: every VS map from a classical BC W to B_dR has image in t^(−N)B_dR⁺ for one N≥0 independent of the sympathetic algebra Λ. The quantifiers are uniform in Λ, not one bound per evaluation. The parent's torsion-source vanishing at `TauCetiRoadmap/VectorBundlesAndIsocrystals/README.md:1569` does not supply this all-BC bounded-image theorem. No pin or earlier owner found in the audit already provides it. Thus the gap is minimal and properly declared, not an unowned prerequisite or an invented extra condition.

The prescribed dependency check exited 0 with this exact output:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier citation was also read manually. The citation resolver exited 0 and reported no cross-roadmap citations or Lean names found nowhere; its library-pin limitation was covered by the explicit pinned-file audit above. No merge-order or tooling change was made.

## Not verifiable

- No cited text in this review was inaccessible; no missing-reference request is needed.
- This is a review of planned mathematics and target signatures, not verification of future proofs. In particular, the expanded normed descent and Banach-coefficient bound (§3.4), non-nuclear and nonseparable extensions (§§4.8–4.9), and VS/sheaf comparison and pseudocoherence transport (§§6.2–6.4) require the proofs expressly assigned to those targets. The cited shorter arguments alone do not establish these extensions. Their hypotheses, interfaces and counterexample controls were checked; the successful sorry build is not evidence of their truth.
- The declared G-HOM supplier theorem is not implemented by this review. Acceptance is conditional on that named contract, as allowed by the review brief.

## Source issues

These are issues in the read sources, not package findings: the roadmap corrects the formulas or owns the missing steps. Source line locators are included for quick verification.

- **Misprint** in FF18 at Preface Remark 2.24(i), p.21 (line 940): the source says cohomology vanishes in degrees at least two; it should be degrees greater than two, since H²(G_K,ℚ_p(1))=ℚ_p; affects a stated result.
- **Misprint** in FF18 at Preface Proposition 2.28(i), p.23 (lines 1012–1017): the source says the unsigned Ext dimension sum equals the negative height product; it should be the alternating sum with factors (−1)ⁱ; affects a stated result.
- **Misprint** in CN25 at Corollary 2.10 proof, p.11 (line 479): the source says the generalized weight-one piece uses the impossible interval 0≤j≤j−1; it should be 0≤j≤k−1; affects the proof.
- **Misprint** in CN25 at Remark 4.3, p.21 (line 971): the source says Schneiders Corollary 1.2.20 supplies the localization model; it should be Corollary 1.2.21, as verified in Schneiders99 lines 852–864; affects nothing.
- **Gap** in CN25 at Definition 4.4 discussion, p.21 (lines 1004–1005): the source says Theorem 4.30 also implies the displayed Ext comparisons are isomorphisms; it should restrict that deduction to Hom or prove the additional Ext comparisons; affects the proof.
- **Gap** in CN25 at Lemma 4.9 proof, p.23 (lines 1070–1082): the source says its first exponential equation applies uniformly in the prime; it should use exp(4X) and the quadratic initial relation at p=2; affects the proof.
- **Misprint** in CN25 at Lemma 4.13 proof, p.24 (lines 1155–1168): the source says restore the constant cocycle by adding it to the primitive; it should be subtracted, since δ(c)=−c; affects the proof.
- **Error** in CN25 at Lemma 4.13 proof, p.24 (lines 1155–1168): the source says choose i=pʳ for r=v_p(k); it should be i=p^(r−1), which lies below k and has binomial valuation one; affects the proof.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, pp.25,27 (lines 1215, 1282): the source says the pushout uses a positive-positive relation with the displayed endpoint maps; it should use opposite signs or negate the kernel framing; affects nothing.
- **Gap** in CN25 at Proposition 4.18 proof, p.26 (lines 1227–1248): the source says the reasonable Fréchet case follows from an argument treating nuclear Fréchet spaces; it should include the general inverse-limit comparison; affects the proof.
- **Gap** in CN25 at Proposition 4.22 proof, p.27 (lines 1291–1338): the source says reduction to Proposition 4.18 covers period models without a separability assumption; it should include the nonseparable graded-piece comparison; affects the proof.
- **Misprint** in CN25 at Lemma 4.24(i), p.28 (line 1378): the source says Ext¹_TVS(U_d,W) is W; it should be zero, as the surjective boundary computation in lines 1414–1415 establishes; affects a stated result.
- **Gap** in CN25 at Lemma 4.29 proof, p.30 (lines 1500–1524): the source says linearity holds for all integral scalars after treating only units; it should extend to nonunits using c=(1+c)−1 and additivity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e8dde6d40630181eb688112978700fb83530b5f8", "job": "REV-PKG-VectorBundlesAndIsocrystalsPartII~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
