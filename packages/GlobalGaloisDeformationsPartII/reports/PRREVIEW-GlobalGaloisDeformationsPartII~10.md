# Review of GlobalGaloisDeformationsPartII (pull request #1837 at 3a70e41)

**Verdict:** needs changes

This is a full review of head 3a70e41. The head is unchanged since the previous review. The gate passes and so does the dependency check. All 15 seeded targets match their sources. Three findings remain: one is new and blocking (R01), one is new and not blocking (R03), and one is carried from the previous review (R02).

## R01 (P1) — The headline theorems assume semisimplicity of Mathlib's `GroupLieAlgebra`, but the proof route runs through Lazard's L(G), and nothing identifies the two

**Location.** The hypothesis appears in three places:
- `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:907`: "whose Mathlib `GroupLieAlgebra`, the tangent space at the identity with the bracket of left-invariant vector fields, satisfies `LieAlgebra.IsSemisimple` over `ℚ_p`".
- `README.md:174`: "differentiates to a Lie action of 𝔤=Lie(G) on V".
- `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean:128` and `:146`: the binder `[LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra 𝓘(ℚ_[p], Fin d → ℚ_[p]) G)]`.

**Claim.** The §4.4 route (README.md:913) applies the Whitehead lemmas and the Casimir argument to the 𝔤 of NoncommutativeAndEquivariantIwasawa §0.13a, items 2–5. That 𝔤 acts on V⊗ℚ_p, and its cohomology computes H^n(U,V⊗ℚ_p). The route treats it as the Lie algebra whose semisimplicity the theorems assume. But that 𝔤 is Lazard's L(G)=ℚ_p⊗Log H, not the tangent space at the identity. Nothing says the two Lie algebras are isomorphic: no target here, no supplier section, no declared gap and no pinned declaration. So the step from the stated hypothesis to the route is unowned.

The same gap affects the source as cited. FKP19 Lemma B.1 states its hypothesis for Lazard's 𝔤 (its footnote 13 points to Lazard65 V (2.4.4); FKP19 line 2876). The README and `Suggested.lean` restate the hypothesis on a different carrier without giving the comparison.

**Witness.** NoncommutativeAndEquivariantIwasawa §0.13a item 1 defines 𝔤=L(G)=ℚ_p⊗Log H and never mentions tangent spaces. Lazard65 V (2.4.1)–(2.4.2), pp.174–175 (Lazard65 lines 6409–6456), sets the tangent-space definition aside. Neither pin relates `GroupLieAlgebra` to Log H.

Supporting checks:
- A search of main and the 458 open heads finds `GroupLieAlgebra` only in real and complex roadmaps.
- The header of `Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` lists even the real-case comparison with derivations as a TODO.

**Repair.** Add to §4.4 a target that this roadmap owns, since no other roadmap mentions `GroupLieAlgebra` over ℚ_p. Suggested wording:

> For a compact group G with a ℚ_p-analytic Lie group structure of dimension d (Mathlib `LieGroup 𝓘(ℚ_[p], Fin d → ℚ_[p]) ω G`), prove that Mathlib's `GroupLieAlgebra` is isomorphic as a ℚ_p-Lie algebra to the Lie algebra L(G)=ℚ_p⊗Log H of NoncommutativeAndEquivariantIwasawa §0.13a item 1; in particular one is semisimple exactly when the other is.

Then:
- Give the target an exact locator in a legal text you have read. Lazard65 V (2.4.1) does not prove the comparison; it only remarks that the classical definition could be transcribed.
- Add three Checks:
  - SL₂(ℤ₃) gives sl₂(ℚ₃) on both sides.
  - ℤ₃ gives the abelian ℚ₃ on both sides, which is not semisimple.
  - A finite group gives 0 on both sides.
- List the target on the §4.4 *Needs:* line, and cite it in the route sentence that invokes Whitehead and the Casimir.
- In the NoncommutativeAndEquivariantIwasawa contract (line 174), write L(G) instead of Lie(G).

Alternatively, if the comparison should live next to the definition of L(G), declare it as a contract on NoncommutativeAndEquivariantIwasawa §0.13a item 1, with a matching entry in the plan's `gaps`.

The repaired statement holds on SL₂(ℤ₃):
- Mathlib side: the tangent space at I of {det=1} is the trace-zero matrices. The left-invariant field of X is g↦gX. With Mathlib's `VectorField.lieBracket` (fderiv W·V − fderiv V·W, `Mathlib/Analysis/Calculus/VectorField.lean:59`), the bracket at g is gXY−gYX, which is XY−YX at I.
- NoncommutativeAndEquivariantIwasawa side: item 1's congruence description gives the ℚ₃-span of log(SL₂(ℤ₃)∩(1+3M₂(ℤ₃))), which is sl₂(ℚ₃) with the commutator bracket.
- Both are sl₂(ℚ₃), which is semisimple.

## R02 (P3) — The Whitehead and generator citations follow main's Tau Ceti pin, not this branch's

**Location.** `README.md:64` cites:
- "`LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and `LieModule.Cohomology.exists_d₁₂_eq` in `TauCeti/Algebra/Lie/Whitehead.lean`";
- "`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`".

The two Whitehead lemmas are named again on the *Needs:* line of §4.4 (line 924).

**Claim.** These declarations exist at the pinned Tau Ceti.

**Witness.** `lake-manifest.json` pins Tau Ceti 358314d. Neither cited file exists there, no file declares `exists_eq_lie_of_d₁₂_eq_zero` or `exists_d₁₂_eq`, and the generator lemma is at `UniversalEnveloping/Augmentation.lean:82`. Main's pin 2fd255d has `Whitehead.lean:105`, `:113` and `Augmentation/Basic.lean:82`.

This is r9 R01, not repaired (the head is unchanged). No repair report marks it not actionable.

**Repair.** Merge `origin/main` into the branch, so that the manifest pins Tau Ceti 2fd255d and Mathlib 1b1ccf4. The folder is new, so the merge has no conflicts there. The r8 review recorded that `Suggested.lean` elaborates against those pins with only the two `sorry` warnings; this review can run Lean only at the branch pins, so that was not re-checked here. If the merge is deferred, say in the description that the README's Tau Ceti citations follow main's pin 2fd255d, and name the two files. No README text changes under either option.

## R03 (P3) — §4.4 rebuilds Tau Ceti's Casimir-injectivity theorem instead of citing it

**Location.** Two passages claim the argument for this roadmap:
- `README.md:15`: "Section 4.4 owns only the uniform finite-coefficient torsion application, including its universal-coefficient step and the Casimir invertibility argument."
- `README.md:64`: "Section 4.4 combines them into the invertibility of the Casimir on a finite-dimensional module without invariants".

The route at line 913 and the *Needs:* line at 924 cite four component lemmas: `TauCeti.exists_isHighestWeightVector_and_lieSpan_eq_top`, `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top`, `TauCeti.casimirScalar_eq_zero_iff` and `TauCeti.isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible`.

**Claim.** The step "on each irreducible constituent with nonzero action, the Casimir acts by a nonzero scalar" is this roadmap's own argument, assembled from those lemmas.

**Witness.** `TauCeti.representation_casimirElement_injective_of_isIrreducible_of_not_isTrivial` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:127`, at both 358314d and 2fd255d) proves exactly this. Its setting is a characteristic-zero, algebraically closed field and `IsKilling`. Its conclusion is that the Casimir is injective on every finite-dimensional, irreducible, non-trivial module. Its proof is the four-lemma argument.

**Repair.**
- Cite the theorem by name and file in the Tau Ceti contract (line 64), in the §4.4 route (line 913) and on the §4.4 *Needs:* line (line 924).
- Drop the four component lemmas from that *Needs:* line, and the Mathlib Cartan, triangularizability and base-existence citations from the contract; they are the theorem's proof.
- Narrow line 15 to say that §4.4 owns the remaining steps: extension of scalars, Weyl decomposition, and descent of invertibility to ℚ_p.

Tested on the standard sl₂-module over ℚ̄₃: it is irreducible and non-trivial, and the Casimir of the Killing form acts by 3/8≠0. So the cited theorem gives injectivity there, as the README's own Check computes. The trivial module, with scalar 0, is excluded by the theorem's non-triviality hypothesis, as it must be.

## Previous findings

- r9 R01 (Whitehead and generator files cited at a pin that lacks them) — **not repaired.** The head is unchanged, and the manifest still reads `"rev": "358314d4ab97483df4fc4cb8adcc02e74a8d9f5a"` for TauCeti. Carried as R02.

## Verified sound

**Gate.** The worker's gate at 3a70e41 reports every check 0, including `build=0`. I reran it on this head:

`gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0.

My rerun printed no build field. The build is covered by the worker's `build=0` and by the elaboration below. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).

**Dependency check**, complete output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. GlobalGaloisDeformationsPartII is at line 371 of the merge order. Its open or board suppliers come earlier:
- NoncommutativeAndEquivariantIwasawa: line 29.
- GlobalGaloisDeformations: line 87.
- ModularityAndLanglandsExtensions: line 195.
- PotentialAutomorphyInfrastructurePartII: line 281.

Chebotarev, ProfiniteProPGroups, ReductiveGroups, ReductiveGroupsPartII, ModularForms, ClassFieldTheory and ProfiniteCohomology are on main (Chebotarev and ProfiniteProPGroups under `Completed/`).

**Elaboration and binders.** I ran `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all six declarations. It exited 0 in 13.6 s, and the only messages were `declaration uses 'sorry'` at lines 125 and 143.

The elaborated types match `signatures.md` and README §4.4. `uniformTorsion` keeps every hypothesis in its own signature: `CompactSpace`, `IsTopologicalGroup`, `LieGroup … ω`, `LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra …)`, `IsDomain`, `IsDiscreteValuationRing`, `Module.Finite ℤ_[p] O`, `Irreducible ϖ`, `Module.Finite O V`, `Module.Free O V`, `∀ r, ContinuousSMul G (ModPow ρ ϖ r)` and `hfix`, with G and V in one universe. `uniformTorsion_H1` has the same binders without `hfix`. No binder is lost.

`TauCeti.ContCohomology.H1` needs `[DistribMulAction G M] [ContinuousSMul G M]`. These come from the file's own instance at line 100 (`DistribMulAction.compHom … (modPowRep …)`). `ModPow` is a plain `def`, so no competing action is found.

**One-tactic probes.** On scratch copies, I replaced each `sorry` by `simp`, `aesop`, `rfl`, `infer_instance`, `exact ⟨0, fun _ _ => by simp⟩` and `exact ⟨0, fun _ _ _ => by simp⟩`. Every probe fails on both theorems: "no progress", unsolved goals, or a type mismatch. Neither theorem is padding. The four definitions are the minimum needed to state them.

**Headline theorems.** The README's headlines are §4.4, §6.3, §§6.5–6.6, §7.6, §8.5, §§8.10–8.11, §§9.2–9.5 and §§10.1–10.3. Both forms of §4.4 are stated. The module docstring (lines 26–51) names every other headline together with the carrier it lacks. None of those is statable at the pins: there is no reductive group scheme with parabolics over O, no newform Galois attachment with a stable lattice, and no Lafforgue attachment.

**Seeded sample (15 targets, read at their locators).** All theorem numbers, pages and hypotheses check out. Where the README departs from the source, it does so by a registered correction or a stated added hypothesis.
- §0.2: FKP19 Definition 1.2, printed p.3 (FKP19 lines 107–114). The README's torus caveat corrects the source's "implies totally real" (registered).
- §0.3: FKP22 Assumption 3.1, p.10 (FKP22 lines 457–461); Assumption 4.1, p.19 (lines 851–854); Assumption 5.1, p.23 (lines 1001–1007). C1, C3 = 4.1; C4 = 3.1; C2 = 5.1. The "nonzero quotient" reading of C3 is the only sensible one, since W=0 always admits a surjection.
- §1.2: FKP19 Lemmas A.3 (p.62), A.5 (pp.62–63) and A.6 (p.63) (FKP19 lines 2771–2821). The proof of A.6 uses "G adjoint" (line 2819), which the README records. LP11 Theorem 0.2 is on printed p.1106 (LP11 lines 51–59) and the construction on p.1156 (lines 2584–2613).
- §1.3: FKP22 p.44 (lines 2001–2008).
- §1.5: FKP22 Lemma A.5 and Remark A.6, p.45 (lines 2026–2053).
- §2.4: FKP22 Lemma 3.4, pp.11–12 (lines 490–512).
- §2.5: FKP22 Proposition 3.6(1), pp.12–15 (lines 527–548). The disjointness hypothesis on the compositum is verbatim in meaning.
- §2.7: FKP22 pp.15–16 (lines 657–665).
- §3.1: FKP22 p.16 (lines 695–699).
- §3.4: FKP22 Proposition 3.8, pp.16–19 (lines 712–760). h = h_old − Σh(v_n) + 2Σh(v′_n) matches.
- §7.5: FKP22 Lemma 6.5 and the proof of Corollary 6.6, p.30 (lines 1315–1351).
- §8.1: FKP22 p.2 and p.35 (lines 50–55, 1574–1579).
- §8.5: FKP22 Theorem 7.4 and proof, pp.35–36 (lines 1601–1653); Pan22 Theorem 1.0.2, p.3 (Pan22 lines 100–105).
- §8.8: FKP22 Lemma 7.6, pp.36–37 (lines 1666–1675).
- §10.1: FKP22 Proposition 9.1 and proof, pp.41–42 (lines 1864–1903); Definition B.2, p.52 (line 2378); Lemmas B.3–B.4, pp.53–55.
- Also read: FKP19 Lemma B.1 and Corollary B.2, p.64 (lines 2842–2875); Ser05 Propositions 3.2–3.3, p.207 (lines 469–486); BMR05 Theorem 5.8, p.24 (lines 1056–1057); Lazard65 V (2.4.1)–(2.4.3), pp.174–176.

The README flags no locator as unverified.

**Adversarial table.** It covers the sampled targets, the headlines and the targets the findings touch. Every value was computed this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `uniformTorsion_H1` (§4.4, degree one) | Γ=ℤ₃ trivial on ℤ₃; C₃ by ζ₃ on ℤ₃[ζ₃]; r=0; V=0 | ℤ₃: H¹=Hom(ℤ₃,ℤ/3ʳ)=ℤ/3ʳ, unbounded, and its 1-dimensional abelian algebra is not semisimple, so excluded. C₃: ϖ²=ζ₃²−2ζ₃+1=−3ζ₃; H¹=(O/ϖʳ)/ϖ=𝔽₃ for every r≥1, so p¹ kills it. r=0: `ModPow ρ ϖ 0`=V/V=0. V=0: a=0 | holds | none |
| `uniformTorsion` (§4.4, all degrees) | SL₂(ℤ₃) on ℤ₃²; SL₂(ℤ₃) on ℤ₃; C₃ on ℤ₃[ζ₃] | ℤ₃²: I+3ᵏE₁₂ fixes {(x,0)} and I+3ᵏE₂₁ fixes {(0,y)}, so `hfix` holds; trace-form Casimir ef+fe+h²/2=E₁₁+E₂₂+I/2=(3/2)I. ℤ₃: `hfix` fails at U=Γ; H⁰=ℤ/3ʳ; dim H³(sl₂,ℚ₃)=1, so H³(Γ,ℤ/3ʳ)⊇ℤ/3ʳ, unbounded. C₃: `hfix` fails at U=⊥, which is open | holds; hypothesis necessary in both failing cases | none |
| `hfix` ⇔ no 𝔤-invariants (README:909) | V free, U small | V^U⊗ℚ=(V⊗ℚ)^U=(V⊗ℚ)^𝔤 by NoncommutativeAndEquivariantIwasawa §0.13a item 3 in degree 0; a rational fixed vector times p^m lies in V | holds | none |
| R01: `GroupLieAlgebra` vs L(G) | SL₂(ℤ₃); ℤ₃; a finite group | Mathlib: tangent space of {det=1} at I is the trace-zero matrices; bracket gXY−gYX at I is XY−YX. NoncommutativeAndEquivariantIwasawa item 1: span of log(SL₂(ℤ₃)∩(1+3M₂)) is sl₂(ℚ₃). ℤ₃: ℚ₃ on both sides. Finite: 0 on both sides | agree on the tests, but unowned | R01 |
| R03: Casimir on an irreducible | sl₂ standard and trivial modules over ℚ̄₃ | Scalar n(n+2)/8 with ⟨α,α⟩=1/2: n=1 gives 3/8, and 4·3/8=3/2 is the trace form; n=0 gives 0, excluded by "not trivial" | the Tau Ceti theorem covers it | R03 |
| §0.2 oddness | diag(1,−1) and I in GL₂; Gₘ over ℚ(i); GSp₄ involution of multiplier −1 | Fixed dims on sl₂: 1 (=dim Flag) and 3. Gₘ: 0=0 at a complex place, but not totally real. GSp₄: both eigenspaces isotropic, fixed space gl₂, dim 4=(10−2)/2 | holds | none |
| §0.3 C1–C4 | M=0; M=𝔽₃ trivial with μ₃⊂F; trivial 𝔽₉-line | M=0: all four hold. 𝔽₃: h⁰(M)=h⁰(M*)=1 and the identity M→M*≅M is onto, so C1–C3 fail. 𝔽₉ line has 𝔽₃-dimension 2, i.e. two trivial factors | holds | none |
| §1.2 bounded cyclic quotients | Gₘ over 𝔽₁₁ and 𝔽_{11ʳ}; PGL₂ diag(−1,1) | Cyclic orders 10 and 11ʳ−1, unbounded, so tori are excluded; (diag(−1,1))²=1 with centralizer G | holds | none |
| §1.3 central Γ-series | Σ=1; C₉ trivial; 𝔽₉ with g of order 8 | 0 factors; 3,3; g∉𝔽₃^×={±1}, so no invariant 𝔽₃-line and one factor of dim 2. Maximal implies simple: A^p and Γ-submodules refine any non-simple step | holds | none |
| §1.5 cyclotomic exclusion | p=3, M trivial, κ̄ of order 2 | Constituents 1 and κ̄ take values 1 and −1 on a cyclotomic generator, so disjoint. Source argument: Γ_{F(ρ̄(gder))} kills V″ and V″⊗κ̄, so κ̄ is trivial there | holds | none |
| §2.4 one-prime sequence | Z=0; Z=1∈𝔽₉ | |F_pZ|=1 and 3; middle dimension rises by dim F_pZ=0 or 1 | holds | none |
| §2.5 spanning classes | coker 𝔽₃²; the L⊂K_ψK₁ control | Ranks 2 and 1. Gal(L/K)≅𝔽_p via (a,b)↦a−b, with a≠0 and b≠0 fixed, so −b is never a Frobenius; L meets K_ψ and K₁ in K | holds; compositum hypothesis needed | none |
| §2.7 marked dual classes | one and two basis indices | η(τ_w)=0+e_b*, η(τ_{t_b})=e_b*+0, 0 at t_{b′} and t₀; tuples (1,0),(0,1) have rank 2, (1,1) twice has rank 1 | holds | none |
| §3.1 lift mod ϖ² | square-zero ε | (1+εX)(1+εY)=1+ε(X+Y)+ε²XY, and ε²=0 | holds | none |
| §3.4 doubling | p=5, 3, 2 | h restricted to T is h_old−ΣY+2ΣY=z_T; coefficients (4,2), (2,2), (1,0) | holds; p=2 excluded | none |
| §7.5 removing invariants | split SL₂ torus, root character ≠1, A=U | H⁰=kh; [h,E₁₂]=2E₁₂≠0, so H⁰ becomes 0. Joint image is A(k)⋊J⊇J, so twisted invariants ⊆ the old ones, which are 0 (the source's semisimplification inference is not used) | holds | none |
| §8.1 actual modularity | I, I+E₁₂ over 𝔽₃; segment −2≤s≤1 | rank(g−I) is 0 and 1, both traces 2; endpoint ranks (1,0) and (0,1), interior (0,0) | holds | none |
| §8.5 reducible modularity | p=3, χ̄ of ℚ(√−2) | χ̄(c)=−1; unramified at 3; −2≡1 mod 3, so χ̄|Γ_{ℚ₃}=1≠ω; κ̄⁻¹ is the character of ℚ(√−3), not χ̄ | holds | none |
| §8.8 infinitely many classes | C₃ and C₃² over k̄ of char 3; C₃² over 𝔽₃ | dim H¹ 1 and 2; an intertwiner of I+E₁₂ commutes with E₁₂, which forces t=s; |P¹(𝔽₃)|=4 | holds | none |
| §10.1 ordinary symplectic lifts | n=1 and n=2, weight 0 | Weights {0,1}, with det weight 1=HT(κ⁻¹); {0,1,2,3}, with κ⁻³ weight 3=0+3=1+2 | holds | none |
| Conventions Checks | SL₄ over 𝔽₇ and 𝔽₃; §3.3 pairing | 7·6·5·4=840, 840/7=120; diag(0,1,2,4) has sum 7≡0. 𝔽₃: 4 entries from 3 values, so 0 regular elements. inv(u∪t)=−1, inv(t∪u)=1, so the matrix is [[0,−1],[1,0]] | holds | none |
| §1.7 and §9.5 joint field | κ̄,ψ independent of order 10 | Intersections 1, 1, 2, giving degrees 10, 10, 5; the joint field contains κ̄, giving degree 1 | holds | none |
| §4.2 and §4.6 Checks | C₃ on ℤ/9 by 4; norms 19 and 109 | 4³=64≡1 mod 9; connecting value (4−1)/3=1; v₃(18)=2, v₃(108)=3 | holds | none |
| §8.10 and §8.11 Checks | ℚ(√5) at 11; S={5} versus {5,11} | 4²=16≡5, so split, bound 5; ℤ[1/5]^×/5=⟨5⟩, dim 1; ℤ[1/55]^×/5 has dim 2 | holds | none |
| §7.8 Siegel weights | a=2, w∈{2,0,−1,−2} | {0,−1,2,3} distinct; {0,−1,0,1}, {0,−1,−1,0}, {0,−1,−2,−1} repeat; the exclusion set is {0,1−a,2−2a} | holds | none |

**Library declarations opened at the pins** (Tau Ceti 358314d, Mathlib f6090c7).

Tau Ceti (13 opened):
- `TauCeti.ContCohomology.H1` (`…/ContCohomology/LowDegree.lean:725`)
- `explicitInfRes_exact` (`…/Inflation/Basic.lean:371`)
- `exists_isCompl_of_isKilling` (`HighestWeight/CompleteReducibility.lean:259`, outside the `IsAlgClosed` section)
- `representation_casimirElement_injective_of_isIrreducible_of_not_isTrivial` (`:127`)
- `casimirElement` (`UniversalEnveloping/Casimir.lean:128`)
- `casimirElement_mem_center` (`:178`)
- `HopfIdeal.augmentation` (`HopfIdeal/Augmentation.lean:61`)
- `exists_isHighestWeightVector_and_lieSpan_eq_top` (`Existence.lean:208`)
- `casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top` (`HighestWeight/Casimir.lean:350`)
- `casimirScalar` (`:271`)
- `casimirScalar_eq_zero_iff` (`Separation.lean:171`)
- `isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible` (`Trivial.lean:104`)
- `ι_mem_augmentation` (`UniversalEnveloping/Augmentation.lean:82`)

Of the 11 Tau Ceti files the README cites, 9 exist at the branch pin (see R02).

Mathlib (26 opened, all 22 cited Mathlib files present):
- `LieGroup` (`Algebra/LieGroup.lean:72`)
- `GroupLieAlgebra` (`GroupLieAlgebra.lean:56`, instances `:93`, `:230`, `:252`)
- `LieAlgebra.IsSemisimple` (`Semisimple/Defs.lean:105`)
- `LieAlgebra.HasTrivialRadical.instIsKilling` (`CartanCriterion.lean:256`)
- `LieModule.Cohomology.d₁₂` and `twoCocycle` (`Cochain.lean:101`, `:156`)
- `continuousCohomology` (`ContCohomology/Basic.lean:131`)
- `ContinuousCohomology.tateShafarevich` (`Sha.lean:71`)
- `ContRepresentation` (`Continuous/Basic.lean:54`)
- `TopRep` and `TopRep.of` (`TopRep.lean:31`, `:64`)
- `Subrepresentation.quotient` (`:114`)
- `OpenSubgroup` (`:49`)
- `CompositionSeries.jordan_holder` (`JordanHolder.lean:454`)
- `LieAlgebra.exists_isCartanSubalgebra_engel` (`CartanExists.lean:374`)
- `instIsTriangularizableOfIsAlgClosed` (`Weights/Basic.lean:754`)
- `RootPairing.nonempty_base` (`BaseExists.lean:321`)
- `Submodule.map_span`, `subset_span`, `span_le`
- `IsAbelianGalois` (`Abelian.lean:25`)
- `Representation.IntertwiningMap` and `Representation.Equiv` (`Intertwining.lean:36`, `:312`)
- `groupCohomology.H1` (`LowDegree.lean:965`)
- `Rep.of` (`Rep/Basic.lean:62`)
- `CategoryTheory.ShortComplex.ShortExact` (`ShortExact.lean:34`)
- `VectorField.lieBracket` (`VectorField.lean:59`)

**Cross-roadmap citations resolved** (on main, or at the open head the tool serves).

The citations tool's one lead was PotentialAutomorphyInfrastructurePartII §8.17, "found nowhere". It is a board package, line 281 of the merge order. Its README has §8.17 "The ANT lifting theorem with weak primitivity", §8.8, and §§7.3, 7.4 and 7.14, with the contents this README attributes to them.

Also resolved:
- NoncommutativeAndEquivariantIwasawa §§0.2, 0.6, 0.7, 0.11 and 0.13a, items 1–5 read.
- LocalGaloisDeformationRings §§1.17, 1.20–1.22, 2.5, 2.14, 2.28, 2.30, 3.11, 6.5, 6.17, 8.5 and 8.10.
- GlobalGaloisDeformations §§3.3, 3.8 and G7 §§8.1, 8.4.
- ArithmeticGaloisRepresentations §1.11, whose target "Complete reducibility and closed tuples" owns G-cr over k̄ and the minimal-parabolic semisimplification, plus §§7.4 and 7.7.
- ArithmeticGaloisDuality R02.3.1, R02.4.5 and D7.7.1–D7.7.3.
- ClassicalSerreModularity §I.1, target `I.1/residually-reducible-ordinary-lifting`, and R27.6.
- GL2ModularityLifting §10.15.
- OrdinaryAutomorphicFormsAndModularityLifting §5.3.
- AutomorphicLFunctionsAndLocalFactors: "Leveled shtukas and ramified rank induction" is target AL.3.10.13 inside Layer AL.3.
- ModularityAndLanglandsExtensions §§2.28 and 2.48.
- AutomorphicSpectralTheory §7.1.
- IntegralHeckeAndGaloisDeterminants §1.4, whose target "Classical Ribet lattice" is at its line 2467.
- FunctionFieldArithmetic §5.8.

The overlaps tool reports no pull request changing this roadmap, no dropped id, and no id defined only by an open revision.

**Ownership and duplication.** I searched by object across main and the 458 open heads: FKP lifting, relative Selmer images, doubling, uniform torsion, and `GroupLieAlgebra`. Only LocalGaloisDeformationRings and ModularityAndLanglandsExtensions use FKP22, and they own the local rings and §2.28/§2.48, which this roadmap cites. No other roadmap owns the cyclic-class, doubling, relative-image or assembly targets. No declaration of `Suggested.lean` reuses a fully qualified name from another roadmap. The one duplication found is R03.

**Declared gaps.** `design/plan.json` has 26 gaps, each with a named supplier, and README.md lines 74–250 have the 26 matching "What … must provide" contracts.

The README's finite-image semisimplification contract (line 111) asks for the k-rational statements. Ser05 Propositions 3.2–3.3, p.207, and BMR05 Theorem 5.8, p.24, support them. ArithmeticGaloisRepresentations §1.11 states only the k̄ form, so the contract asks for nothing already supplied.

**Data for the worker, not folder findings.** The description's "Depends on" list omits the board package PotentialAutomorphyInfrastructurePartII, which §10.2 cites. The description also says the degree-one form is "the one headline statable"; `Suggested.lean` states both forms.

## Not verifiable

- Gur99 Theorem A; NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9; BC14 Lemma 10, Propositions 11 and 32, Definitions 29–30. These are settled as uncertified and cited by locator only; they were not read.
- Lazard65 III (3.1.3) and (3.1.7.4), and V (2.2.2.3) and (2.2.3.1), were not re-read this round. Their r8 verification stands. V (2.4.1)–(2.4.4) were read for R01.
- Elaboration at main's pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4) was not run. This review may run Lean only in the branch worktree.

## Source issues

- none new. The FKP19 and FKP22 issues met while checking (Definition 1.2 total reality, FKP19 line 114; Proposition 9.1 sign and ℤⁿ₊, FKP22 lines 1861, 1870 and 1888; Lemma 3.4(2) increment, line 510) are already in the errata register.
