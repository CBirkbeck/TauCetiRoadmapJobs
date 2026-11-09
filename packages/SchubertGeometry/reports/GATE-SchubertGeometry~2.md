# GATE-SchubertGeometry~2: answers to the human review

Review answered: CBirkbeck, 2026-11-09T09:44:23Z (review of `25ea793`, findings F01–F05). Branch head before this round: `bff8a82`, which already contains the merge of origin/main (`9ebd5fc`); `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`, the same pins as the content checkout. Repairs are in commit `368c92d`. Line numbers below refer to `TauCetiRoadmap/SchubertGeometry/README.md` and `TauCetiRoadmap/SchubertGeometry/Suggested.lean` at `368c92d`.

The points are numbered as follows: F01 contains two (H01–H02); F02 three (H03–H05); F03 four (H06–H09); F04 two (H10–H11); F05 three (H12–H14).

## H01 (CBirkbeck) — applied differently

`Suggested.lean` now states the four S4 headlines from c339e23c: `exists_toPLPath_eq_of_lower_eq_some`, `exists_toPLPath_eq_of_raise_eq_some`, `reflTransGen_lower_toPLPath_straight` and `weylDenominator_mul_finsum_single_eq_dotAlternatization` (lines 65, 76, 88, 104). The README names them again at lines 1088, 1107 and 1120. The step-1 merge was already in the branch (`9ebd5fc`, manifest at `2fd255d`). Two things differ from a plain `git checkout c339e23c`: the file uses `import Mathlib` followed by plain `import TauCeti.…` lines instead of `module`/`public import`/`public section`, which is the house form (92 Suggested files on main) and the form the brief requires; and it adds the two modules that declare `RootPairing.dominantChamber` and `TauCeti.weylDenominator` (`…RootSystem.Chamber`, `…Weyl.Denominator.Basic`).

## H02 (CBirkbeck) — applied

`Suggested.lean` lines 23–26: “the native Grassmannian is a module carrier” → “The Grassmannian scheme `Module.Grassmannian.scheme` of a module over an affine base is native, with its functor of points and properness; the relative parabolic, flag and isotropic schemes are not.” I checked at `2fd255d`: `AlgebraicGeometry/Grassmannian/Basic.lean:161` defines the scheme. No file defines a flag scheme, a parabolic-quotient scheme or the glued isotropic Grassmannian; `RingTheory/Grassmannian/Isotropic.lean` builds only the ideal and says that the gluing is still to be done.

## H03 (CBirkbeck) — applied

S1.3 (lines 618–622) now cites `Module.Basis.flagPivots`, `Module.Basis.finrank_inf_flag`, `Module.Basis.flagCellEquiv`, `StrictMono.card_echelonFreeEntries_image` and `StrictMono.sum_sub_add_sum_sub_eq_mul` as native. It keeps as targets only the quotient-rank transport (r ≤ N), the cell as a locally closed subscheme isomorphic to affine Σ(p_i−i)-space compatible with base change, and the rank-0, full-rank, r>N and N ≤ 1 cases. The From Tau Ceti contract names the declarations with their files (lines 112–136). Its *Needs:* line names the two native files.

## H04 (CBirkbeck) — applied

From Tau Ceti (lines 112–123) now names `Module.Grassmannian.scheme` (`Grassmannian/Basic.lean`), `Module.Grassmannian.schemeHomEquiv` (`Points.lean`) and `Module.Grassmannian.isProper_toSpec` (`Proper.lean`, for finite M). S1.1 (line 576) takes its affine ambient Grassmannians from them, and its *Needs:* line names them. ModularCurves §0G stays the owner of the relative version over a non-affine base (line 398); its own text, on main, says it is glued from this Tau Ceti scheme. From Mathlib (line 82) no longer says that no scheme exists.

## H05 (CBirkbeck) — applied

S1.5 (line 650) now does the following:

- It derives dim U ≤ m from Mathlib's `LinearMap.BilinForm.finrank_add_finrank_orthogonal`, with `IsAlt.isRefl`.
- It cuts the isotropic Grassmannian out of `Module.Grassmannian.scheme` by `Module.Grassmannian.isotropicLocus`, glued by `isotropicLocus_map`, and gets the universal property from `isotropicLocus_le_ker_iff`.
- It proves transitivity for every r ≤ m by enlarging U to a Lagrangian and applying `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`.
- It keeps P_r and its factorization as targets.

A new Check (line 713) pins the convention: Q_src gives Gram −J on (u₁,f₁), and the native partner −f₁ gives ω(u₁,−f₁) = −1 = `Matrix.J`(inl, inr). The Check notes that −J = J in characteristic 2.

## H06 (CBirkbeck) — applied

S5.6 *Needs:* (line 1306) now cites:

- Ramanathan1987, proof of Theorem 3.11, p. 86 (lines 960–974), for the route from characteristic p to characteristic 0 through flat ℤ_(p)-models and semicontinuity;
- Ramanathan1987 Theorem 4.2(i)–(ii), p. 88 (lines 1042–1045), for Cohen–Macaulayness;
- LRPT2006 (already a manifest key), Lemma 1.2, p. 3, Proposition 2.1, pp. 4–5, and Theorem 2.2, p. 5 (lines 115–118, 165–178, 190–204), for global F-regularity, with its hypotheses (algebraically closed field of positive characteristic, simply connected semisimple G);
- BrionFlags §1.3, p. 12, and Proposition 1.3.2 (lines 469–477), for proper standard/opposite intersection over ℂ in type A.

LRPT2006 is added to the References with its JAMS venue, which the manifest records, and with the arXiv v3 numbering that was read.

## H07 (CBirkbeck) — applied

S6.2 *Needs:* (line 1383) cites CFL §1.1, p. 1 (lines 22–32), for the Plücker standard-monomial basis and straightening, and LLM Theorem 4, p. 299 (line 263), with Theorem 6, p. 301 (lines 333–338), for restriction to Schubert varieties. The adversarial pass dropped the direction of the lexicographic comparison in straightening: CFL line 31's “τ lexicographically less than σ” is contradicted by p₁₄p₂₃ = p₁₃p₂₄ − p₁₂p₃₄ under the natural reading (14 > 13), so only the existence of the straightening relations is cited.

## H08 (CBirkbeck) — applied

S9.8 *Needs:* (line 1778) now says that S9.8 is a deduction and uses no further source. Its inputs are S9.0's coherent analytification (exact and faithful, SGA1 Exposé XII, Proposition 1.3.1, p. 241, line 9479; tensor and dual comparisons), S3.1's associated-line equivalence, and ReductiveGroups §3A.5's homogeneous identification.

## H09 (CBirkbeck) — applied

S3.1 *Needs:* (line 876): “agrees with BrionFlags §1.4 after opposition” → a citation of Proposition 1.4.3, p. 16 (lines 613–625, 636–639), transported by the Chevalley involution. The involution carries L(λ) on G/B− to the B+-line with f(gb)=λ(b)f(g). For GL₂ and λ=(1,0) the sections are the first row of g⁻¹, pulled back to the first column of g, of degree +1 = λ₁−λ₂. The text records that Brion's action at line 593, read literally, gives no sections. The References note the same at the Proposition 1.4.3 locator.

## H10 (CBirkbeck) — applied

Each abbreviation is now spelled out:

- TopK → TopologicalKTheory T1.5 (lines 804, 1736);
- GG → GroebnerGeometry G5 (line 1381);
- AVB → AlgebraicVectorBundles, Successor roadmaps §3 (Scope, line 60; S7.3, line 1459);
- TPC → TensorProductCombinatorics §6.3 (line 1459) and Layer 6 (line 1554);
- HR R2a → HamiltonianReduction R2a (line 1738);
- “the exact RG owner” → ReductiveGroups §§9A and 9C and Layer 10 (line 1912).

The same repair applies to SMT → standard monomial theory (lines 402, 507, 1236) and GT → Gelfand–Tsetlin (line 420). Each cited section exists on main. §9C and §3A.5 are present at every open ReductiveGroups head.

## H11 (CBirkbeck) — applied

Scope and ownership (lines 60–64) adds the two TensorProductCombinatorics deferrals, the incidence count of §6.3 and the puzzle rule of Layer 6. It also states that the general Betti cycle-class map of AlgebraicVectorBundles' Successor roadmaps §3 is not a target here. The S7.3 sentence that narrated AVB's programme is replaced by a pointer to Scope.

## H12 (CBirkbeck) — applied

At `bff8a82`, 40 lines had run-together tokens. The review's count of 37 was taken at the older head, and S1.3 and S1.5 were rewritten this round. All are fixed: characteristic p/0/2, type A, rank 0, by 2, to 1, dimension 1, words 121 and 212, the S3.6 counts (6, 33, 46, 21, 15, 10, 81), degree 0, including 0, coefficient 1, contains 1, Layer 8, Layer 6, projective 7/8-space, gcd 0, denominator 1, word 121, “that 1 … and 2”, StableReduction Layers 2 and 4, dim V and dim X. A rescan for letter-digit runs outside identifiers and URLs finds none.

## H13 (CBirkbeck) — applied differently

The sentence about inventing unread diagram labels is deleted from the word-121 blowup bullet. The adjoint comparison is now a computed Check in S4.4's adjoint Checks (line 1152), not the suggested sentence, which would be a Check without a value. For θ = α₁+α₂ = ρ in SL₃:

- B(θ) has 6 straight encodings plus (s₁s₂,s₂;0,½,1) and (s₂s₁,s₁;0,½,1), with bonds 2 and endpoints 0. That is 8 encodings, exactly 2 of weight 0.
- These two are f₁ and f₂ of the straight encodings of weights α₁ and α₂, matching [E₂₁,E₁₂] = −H₁ and [E₃₂,E₂₃] = −H₂.

The same bullet's “trivialization requested by the example” is reworded (line 1909).

## H14 (CBirkbeck) — applied

The `###` heading inside the Worked examples list is now a bold bullet like the others (line 1840): “- **The three-dimensional incidence flag and its eight-dimensional representation.**” The central-transport, SL₂, blowup and general-type bullets that follow are no longer filed under it.

## Further repairs of the same patterns

- **Targets without a locator (F03 pattern).**
  - S2.5: KnutsonBottSamelson §5, p. 5 (lines 168–173), the compact picture, with the README's correction of SU(2)×T^(n−1) to T·SU₂α (line 816).
  - S6.1: Ramanathan1987 Theorem 3.11(i)–(ii), p. 86, lines 950–959 (line 1377).
  - S6.5: Theorem 3.11(i) with Theorem 4.2(ii), p. 88 (line 1411).
  - S9.5: stated as a deduction from S4.1–5 (line 1702).
- **Layer 1 Dependencies (line 723)** now lists the native S1 inputs.
- **Scope and ownership (line 27)** lists the native Grassmannian scheme, pivots, isotropic locus and Lagrangian extension among what the pinned Tau Ceti already has.

## Mechanical signature check

I appended `#check @name` for the four declarations to a temporary copy of `Suggested.lean`, elaborated it once with the permitted build command, and restored the file. Every elaborated type carries the binders its README statement needs: `[Finite ι] [P.IsReduced] [P.flip.IsReduced]`, `lam ∈ P.dominantChamber b`, the coroot-agreement hypothesis `hF`, `[Fintype P.weylGroup]`, and injectivity of `f` for the character identity. Nothing changed.

`roadmaps resolve` reported that it does not check library names on this host. So I verified the 19 Mathlib and Tau Ceti names this round adds to the README the same way: all 19 elaborate at the pins, with no error.

## Adversarial pass

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| `exists_toPLPath_eq_of_lower_eq_some` | SL₂, λ=α; GL₂, λ=(1,0); λ=0; empty base; non-injective f: ℤω→𝕜, ω↦1, F=id | H=2t, cut at t=½ gives (s₁,1;0,½,1) with endpoint 0 ∈ B(α); f₁(straight e)=straight s, endpoint (0,1); λ=0: H≡0, lower=none; no i; realized lowering of 2t is (−2 on [0,½], +2), the realization of (s₁,1;…) | true; hF forces F_i(f α_i)=2 | none |
| `exists_toPLPath_eq_of_raise_eq_some` | SL₂, λ=α | e(s₁;0,1): H=−2t, piece [½,1] reflected gives (s₁,1;0,½,1); e of that gives the straight path; e(straight)=none | true | none |
| `reflTransGen_lower_toPLPath_straight` | SL₂, λ=α; GL₂, λ=(1,0); λ=0; central λ | 0, 1, 2 lowerings reach the 3 encodings; 1 lowering; refl; only the straight path exists | true | none |
| `weylDenominator_mul_finsum_single_eq_dotAlternatization` | PGL₂, λ=α; SL₂, λ=ω; GL₂, λ=(1,0); λ=0; torus | e^α−e^(−2α) on both sides; e^ω−e^(−3ω) on both sides; e^(1,0)−e^(−1,2) on both sides (s⋅λ=sλ−α); Δ=J(1); e^λ=e^λ | true; finsum over a finite type is the sum | none |
| S1.3 native pivot count | Gr(2,4), pivots (1,2), (1,3), (3,4); zero-based {0,2} | free entries 0, 1, 4; partitions (2,2), (2,1), (0,0) give 4−\|λ\| = 0, 1, 4; the only free entry of {0,2} is (2,1) | agrees with the Checks | rewritten as native |
| S1.5 rank bound and dimension | m=2, r=0,1,2,3; general r, s=m−r | 0, 3, 3, empty (2·dim U ≤ 4); dim Sp−dim P_r=(r²+r)/2+2rs=r(2m−r)−r(r−1)/2 | true | none |
| S1.5 Lagrangian enlargement | 𝔽₂², alternating x₁y₂−x₂y₁ against symmetric x₁y₁+x₂y₂ | alternating: ω(v,v)=0 keeps U+kv isotropic; symmetric: ω(e₁,e₁)=1, so it fails | “alternating” needed and stated | none |
| S1.5 `Matrix.J` sign | m=1, k=ℚ and k=𝔽₂ | Gram of (u₁,f₁)=[[0,1],[−1,0]]=−J; ω(u₁,−f₁)=−1=J(inl,inr); over 𝔽₂, −J=J | true | Check added with the characteristic-2 caveat |
| `finrank_add_finrank_orthogonal` as cited | k², standard ω, W a line | 1+1=2+0 | true | none |
| S3.1 Brion comparison | GL₂, λ=(1,0) | README L(λ): row 1 of g⁻¹, dim 2, degree +1; Brion literal: weight (−1,0) not dominant, 0 sections; Brion Prop. 1.4.3: λ₁−λ₂=1; pullback by θ: g_{j1}, O(1) | consistent with Prop. 1.4.3 | locator and witness added |
| S4.4 adjoint path Check | SL₃, θ=ρ | 6+2=8 encodings; bonds \|⟨−α₁,α₁∨⟩\|=2 and \|⟨−α₂,α₂∨⟩\|=2; endpoints 0, 0; zero-weight count 2=dim 𝔥; f₁ of t↦tα₁ cut at t=½ | true | Check added |
| S5.6: Ramanathan route | ℤ-cokernel C with C/pC=0 for all p | finite C with zero reductions is 0; ℤ/p would reduce to ℤ/p≠0 | route matches lines 960–974 | locator added |
| S5.6: Brion Proposition 1.3.2 | GL₂, X_e∩X^s | v=s ≰ w=e, so the intersection is empty: {eB}∩{sB}=∅ | true | locator added |
| S6.2: CFL straightening | Gr(2,4), p₁₄p₂₃ | p₁₃p₂₄−p₁₂p₃₄; lexicographic direction contradicts line 31 under the natural reading | direction not reliable | direction claim dropped |
| From Tau Ceti: Grassmannian properness | M finite against M not finite | `isProper_toSpec` requires `[Module.Finite R M]`, stated as “for finite M” | true | none |

## Ownership, suppliers and overlaps

- **Ownership.** No construction this round belongs to another roadmap. The isotropic Grassmannian scheme (S1.5) is planned only in SchubertGeometry: `roadmaps grep` for `isotropicLocus|isotropic Grassmannian` finds only this roadmap, on main and in this pull request. The other new inputs are Tau Ceti or Mathlib declarations, cited in the supplier contracts.
- **Citations.** Every new cross-roadmap citation resolves on main: TensorProductCombinatorics §6.3 (line 1777 there) and Layer 6 (line 1707); AlgebraicVectorBundles, Successor roadmaps §3 (line 429); ReductiveGroups §§9A and 9C (lines 1109, 1659), Layer 10 (line 1731) and §3A.5 (line 335); GroebnerGeometry G5; TopologicalKTheory T1.5; HamiltonianReduction R2a; ModularCurves §0G (line 901).
- **Direction.** No notion moved down, and no later roadmap is cited as a supplier. The TensorProductCombinatorics and AlgebraicVectorBundles mentions are non-target statements. TensorProductCombinatorics consumes SchubertGeometry.
- **Overlaps.** `roadmaps overlaps SchubertGeometry` shows no id cited here that an open pull request drops, and no id defined only by an open revision. The only open pull request changing this roadmap is this one.
- **Sources.** No source was fetched and nothing was added to `needs-references.toml`. Every citation added this round is a manifest key: Ramanathan1987, LRPT2006, BrionFlags, CFL, LLM, SGA1, KnutsonBottSamelson.
- **Untrusted text.** The review contains no suspicious instruction. Its `git checkout c339e23c` suggestion was treated as a repair proposal (H01).

Dependency check (after the final edit):

```
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

## Build and gate

`lake build TauCetiRoadmap.SchubertGeometry.Suggested` succeeded: `Build completed successfully (18402 jobs)`. It reports only `declaration uses 'sorry'` warnings at `Suggested.lean` lines 65, 76, 88 and 104, plus the module-system advisory that `import Mathlib` triggers in every non-module file.

Gate at `368c92d`:

```
gate SchubertGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```
