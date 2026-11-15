# GATE-LogicAndDefinabilityInNumberTheory~1: answers to the review of `c154465`

The review answered is the comment of 2026-11-15T14:18:22Z (findings F01–F18). The quoted copy given to this job stops inside F13; F13–F18 were read from the same comment on the pull request (read-only). Points are numbered in the order they appear; F13 (three definitions), F15 (two definitions) and F16 (two locators) make separable points with different outcomes and are split. Map: H01–H12 = F01–F12; H13–H15 = F13 (§4.12, §4.31, §4.33); H16 = F14; H17–H18 = F15 (§4.33, §3.11); H19–H20 = F16 (CL locator, Pas locator); H21 = F17; H22 = F18. Line numbers below are those of `TauCetiRoadmap/LogicAndDefinabilityInNumberTheory/README.md` at the repair commit `3a5156db`.

## H01 (CBirkbeck) — applied

§2.9 (line 539) now reads "Let X be a separated smooth O_F-scheme of finite type and pure relative dimension d … identify X(O_F) with its image" in place of "If X is smooth of pure relative dimension d over O_F … Assume X is of finite type"; GWZ itself regards X(O_F) as a subset of X(F) (`geometric_stabilisation_via_p_adic_integration` line 268), which needs separatedness. A new Checks block (lines 545–549) adds 𝔸¹ (1=q/q), 𝔾_m with dx/x (1−q⁻¹=(q−1)/q) and the negative control: 𝔸¹ with the special-fibre origin doubled, whose generic fibre is 𝔸¹_F, gives image O_F of volume 1 against (q+1)/q.

## H02 (CBirkbeck) — applied

§2.10(a) (line 559): "an étale isogeny 𝒜°→ℬ° of identity components" → "an étale homomorphism 𝒜°→ℬ° of identity components, which induces an étale isogeny 𝒜°_k→ℬ°_k of their connected special fibres; no finiteness is asserted for the homomorphism 𝒜°→ℬ° over O_F"; the proof adds why the special-fibre map is surjective with finite kernel, and (b) already works on k-groups. The split Tate curve over ℚ₃ with φ=[2] (kernel of order 4 generically, μ₂ on the special fibre 𝔾_m, 2 points over 𝔽₃ on both sides) is a new Check (line 579).

## H03 (CBirkbeck) — applied differently

The cycle is real: Cluckers–Gordon–Halupczok prove the uniform locus and integral by motivic integration and specialization (`integrability_of_oscillatory_functions_on_local_fields_transfer_p` lines 1734–1747, 1856–1860, Proposition 4.5.12 at line 1678). The uniform h/G paragraph and its interpolation proof are deleted from §2.4 and restated as the concluding theorem of §3.9 (lines 803–807, citing CGH Theorems 4.3.1–4.3.3, p.32, proofs pp.38–42). §2.4 keeps the uniform statement on a definable locus and the fixed-F locus and replacement, now routed through CGH §3.4, pp.17–19 (lines 845–859 of that source: Theorem 3.1.1 from 3.1.5, no motivic step), with a forward pointer at line 436. Two parts of the suggested text were not applied. §2.4 stays in §3.9's *Needs:*: once §2.4 no longer calls §3.9, that edge only points down, and the concluding theorem uses §2.4's Presburger interpolation. No "is now" mapping sentence was added, because the README must read without process history and no roadmap cites the moved clause (TopologicalMirrorSymmetryForHitchinSystems cites §§2.5, 2.7–2.9, 2.11–2.12 only). §3.4 is added to §3.9's *Needs:*.

## H04 (CBirkbeck) — applied

§7.7 (line 1931): "unipotent radical W with centre U" → "unipotent radical W, its weight −2 part U (the normal subgroup with Lie U=W₋₂(Lie P), central in W but in general smaller than the centre of W; Gao, Definition 2.1(3), p.6, and Notation 2.8, p.8)" (`towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_` lines 233–251, 311–315). The universal-elliptic-curve Check (line 1945) now states W=V of dimension 2, U trivial although W is commutative, so U is not the centre of W.

## H05 (CBirkbeck) — applied

Confirmed at the AbelianSchemesAndArithmeticModuliPartII head: B2.6 states only the arc theorem under #π₂(Σ)>c_εT^ε (its README lines 1515–1528), which says nothing when b=0. The contract gap:block-family-covering is added under that supplier (line 119), in the form of Pila 2009 Theorem 3.5 (`on_the_algebraic_points_of_a_definable_set` lines 265–273) with Definition 3.2 spelled out. The suggested edits to Scope (line 9), §6.13 and the *Needs:* lines of §§6.14–6.16 are also applied, and §6.14 (line 1773) now applies the contract to X instead of "B2.6 … with no unrestricted coordinates (b=0)". The suggested `design/plan.json` entry is not made: that file is outside the two files this job may edit, so the board must add the three gap slugs of H05, H07 and H12.

## H06 (CBirkbeck) — applied

§4.29 proof (line 1336): "a multiplicity-one component whose function field contains an abelian extension of the residue field" → "a multiplicity-one irreducible component in whose function field the algebraic closure of the residue field k(M) is an abelian extension of k(M)", which is CTV Theorem 3.1(i) (`le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` lines 274–277). A parenthesis checks it for the normic fibres: Severi–Brauer away from zeros of P, and at a zero the closure is k(M) or the cyclic degree-p field K⊗_k k(M).

## H07 (CBirkbeck) — applied differently

The citation is wrong as stated: ShimuraVarieties §3.5d (its README lines 997–1004) states only definable Chow on smooth S. The suggested repair would plan Peterzil–Starchenko Theorems 3.2, 4.1 and 4.4 here, but the same section already undertakes to "construct the required local complex definable-analytic dimension and extension arguments", so that would plan the same work twice. Instead, the contract gap:definable-remmert-stein (line 109) asks §3.5d to state the closure theorem those arguments give: Peterzil–Starchenko Theorem 4.4 for M open in projective space (`peterzil_starchenko_agc` lines 596–598). §6.8’s statement, proof and *Needs:* (lines 1657–1669) and Scope line 24 now cite the contract.

## H08 (CBirkbeck) — applied differently

The paraphrased proof of Peterzil–Starchenko Theorem 4.4 ("By the local criterion … because A∩E=∅") is deleted instead of rewritten. After H07, §6.8 consumes the manifold closure theorem through the contract, so that proof is no longer this roadmap's to sketch. The replacement paragraph (line 1659) is only the reduction from a singular quasi-projective Y⊆W to the open W⊆ℙⁿ. The *Needs:* entries §6.4 and ShimuraVarieties §3.4d, which only that proof used, are dropped, and Scope no longer lists §6.8 among the consumers of §§3.4b–3.4e.

## H09 (CBirkbeck) — applied

(I-ws)(d) (line 1842) now states that the correspondence is finite-to-one and that orbits maximal among special subvarieties of V correspond only to isolated special points of V′ (Pila–Tsimerman 2014, proof of Theorem 7.1, `ax_lindemann_for_a_g` lines 813–820). §7.3 (line 1878) replaces "identifies them with the special points of V′ … and induction gives finiteness" with the induction on the components of V′, giving finitely many isolated special points. A new Check (line 1882) notes that V′=A₁ has infinitely many special points and no isolated one.

## H10 (CBirkbeck) — applied

§6.16 (line 1801): "Apply block counting in coefficient space … and push blocks through these root branches" → for each continuous root-branch tuple φ_i:U_i→ℝⁿ, the covering of gap:block-family-covering is applied to {(ξ,t) : ξ∈U_i, (φ_i(ξ),t)∈X}, so that φ_i carries its blocks into X_t. The witness is a new Check (line 1811): with n=1, k=2 and X=(0,∞), the coefficients (−1,0,1) of z²−1 lie only in the larger-root family. The polynomial variable is renamed z so it does not clash with the parameter t.

## H11 (CBirkbeck) — applied

§4.29(c) (line 1333) no longer asserts a smooth projective A-family. Over A=k[u,u⁻¹], ResolutionOfSingularitiesCharacteristicZero §6.2 works over a field only, although CTV p.14 claims such a model (`le_compl_mentaire…` lines 511–515). The text now gives U_u=U(K_u/k,P), K_u=k[v]/(v^p−du), the isomorphism U_u≅U_(uw^p) under v↦wv, and one smooth projective model X_u over k per class of k×/k×p. The (c) proof notes that the curve z^p=QR maps into every U_u by Ξ=z, which is all CTV Proposition 4.2 uses (`le_compl_mentaire…` lines 549–566); §4.30 already defines D₁ from the affine family.

## H12 (CBirkbeck) — applied

Confirmed: ShimuraVarieties §3.5a (its README lines 939–941) gives continuous cells only, and van den Dries–Miller §4.2 cites rather than proves analytic decomposition (`geometric_categories_and_o_minimal_structures` lines 502–510). No open or merged roadmap states it. The contract gap:ran-exp-analytic-cells is added (line 107) and cited in §6.3 (line 1569) and in the *Needs:* of §§6.3 and 6.10. Scope line 24 moves analytic cells from what this roadmap keeps to what §3.5a owns, and adds §6.10 to the consumers of §3.5a.

## H13 (CBirkbeck) — applied

§4.12 had no Checks. The pairing now carries T(n)=n(n+1)/2, its graph 2u=(x+y−2)(x+y−1)+2y and the least-positive-remainder reading of Seq (Davis, `review_source_13` lines 163–241). Three Checks follow at lines 1051–1053. P(11,4)=95 codes (1,2). P(5,2)=17 gives Seq(2,17,5) and not Seq(2,17,0). With y=3 the moduli 4, 7 and 10 cannot code (1,1,2), while y=6 gives the pairwise coprime moduli 7, 13 and 19.

## H14 (CBirkbeck) — applied

§4.31's Checks tested only existential closure. Two model-completeness Checks are added (lines 1391–1392). The theory of fields is not model complete, by ℚ⊂ℚ(√2) and ∃x, x²=2. The theory of algebraically closed fields is model complete but not complete, since 1+1=0 holds in an algebraic closure of 𝔽₂ and fails in ℂ, which separates model completeness from completeness.

## H15 (CBirkbeck) — disputed

At `c154465` §4.33 already has a **Checks.** block with three computed tests (lines 1391–1395 then, 1429–1433 now). F=0 at a=b=1, t=0, u=(1,0,0,0), v=0. F=2·2·16=64 at t=2, which catches t in place of t−2u₁. F=0 at a=−1 through the guard. These agree with the values the finding proposes, so no edit was made.

## H16 (CBirkbeck) — applied

`rationalDiophantine` and `rational_nonintegers_diophantine` are deleted from `Suggested.lean`, since the latter follows from `universal_integers` by pushing out with `Int.castRingHom ℚ`, and "Diophantine rational nonintegers," is deleted from the module docstring. README line 1131 now states the single-equation specialization in prose, and line 1257 reads "The acceptance signature is `universal_integers` in Suggested.lean; negating its universal formula gives the existential definition of ℚ∖ℤ."

## H17 (CBirkbeck) — disputed

§4.33 already has its three Checks (see H15). The finding's third proposed Check, with (a,b)=(3,3) and Δ={2,3}, is correct but not needed for the three-Check minimum, so it was not added.

## H18 (CBirkbeck) — applied

§3.11 had no Checks; three are added (lines 830–832). First, [𝔾_m] and [ℙ¹] realize to [ℚ(1)]−1 and 1+[ℚ(1)], and [𝔾_m]² to [ℚ(2)]−2[ℚ(1)]+1. Second, for k⊂ℂ, 1−𝕃⁻¹ is not a unit of K₀(Var_k)[𝕃⁻¹], because χ_c sends it to 0; so (1−𝕃⁻¹)⁻¹ has an image only in M_loc. Third, a realization with 𝕃↦1 admits no ring map from A. The finding's wording "need not exist in TriangulatedK0" is replaced by this computed non-unit on the source side.

## H19 (CBirkbeck) — applied

§2.5 (line 460): "CL Theorem 7.5.3 and Corollary 7.5.4, pp.43–44" → "pp.43–45". In `cluckers_loeser_2008`, Theorem 7.5.3 is at line 1786 on p.43 and Corollary 7.5.4 at line 1867 on p.45.

## H20 (CBirkbeck) — disputed

"proof in §§3.6–3.8, pp.144–155" (lines 299 and 380) is correct. Page 1 of the `pas_1989` scan is the GDZ cover sheet, so the article's first page (p.137, line 38) is scan page 2. §3.6 (line 299) begins on the page whose running head reads "144 Pas, Uniform p-adic cell decomposition" (line 288). §3.8 (line 629) is on p.154 (line 620), and §4 begins on p.155 (line 656).

## H21 (CBirkbeck) — applied

§2.2 (line 376) now says the uniform cells pass to local fields of large residue characteristic "by §1.5(b) applied to the sentence saying that these formulas define a partition into presented cells", and §1.5 is added to the first *Needs:* line of §2.2. §1.5 needs only §1.4, so no cycle arises.

## H22 (CBirkbeck) — applied

§2.12 gains a Checks block (lines 606–609) with the four computed instances of the finding, each recomputed:
- the projection, θ=dy with iterated integral 1;
- ω_Y=π·dx, θ=π⁻¹dy with product of densities q⁻¹·q=1, against q⁻² for the inverse direction;
- r=2, θ=π⁻²(dy)^⊗2 with density q;
- a=xy, where da∧(−dx/x)=(y dx+x dy)∧(−dx/x)=dx∧dy, and the opposite order gives +dx/x.

## Adversarial pass on the added and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.9 separated Weil volume | 𝔸¹, dx; 𝔾_m, dx/x; d=0: Spec O_F, Spec O_F⊔Spec O_F, Spec O_F′ unramified of degree 2; doubled special origin | 1 vs q/q=1; 1−q⁻¹ vs (q−1)/q; 1 vs 1, 2 vs 2, 0 vs 0 (no O_F- or k-points); image volume 1 vs (q+1)/q | holds with separatedness; fails without | hypothesis added, negative Check added |
| §2.10(a) identity components | good reduction, [2], p odd; split Tate, [2], p=3; additive reduction (𝒜°_k=𝔾_a), [2]; φ=id | finite étale; kernel 4 generic vs 2 special, #𝔾_m(𝔽₃)=2=2; special kernel trivial, #𝔾_a(k)=q=q; trivial | "isogeny over O_F" false for Tate; étale homomorphism + special isogeny true in all | reworded, Check added |
| §2.4 fixed-F and definable-locus clauses | 1_{O_F}; constant 1 on F; ab−c | ∫=1; not integrable; locus c=ab not Presburger-definable | consistent with negative control | uniform h/G moved out |
| §3.9 concluding theorem | 1_{O_F}; 1 on F; 1_{ord x≥s}, s∈ℤ; ab−c | h=0, G=1; h≠0; G(s)=q^(−s) for every s; h=ab−c | holds; locus need not be definable | moved here |
| §2.12 Checks | projection; π·dx; r=2; a=xy | 1·1=1; q⁻¹·q=1 (inverse q⁻²); q against q⁻¹; da∧(−dx/x)=dx∧dy, θ∧da gives +dx/x | consistent with base-first convention | Checks added |
| §3.11 Checks | 𝔾_m, ℙ¹, 𝔾_m²; χ_c on K₀(Var_k)[𝕃⁻¹]; 𝕃↦1 | [ℚ(1)]−1, 1+[ℚ(1)], [ℚ(2)]−2[ℚ(1)]+1; χ_c(𝕃)=χ_c(ℂ)=1 so 1−𝕃⁻¹↦0; 1−𝕃⁻¹↦0 | localization needed; normalization pinned | Checks added |
| §4.12 Seq | P(11,4); P(5,2); P(1,1); y=3 vs y=6 for (1,1,2) | 95 → (1,2); 17: Seq(2,17,5); 1: Seq(1,1,1), i=0 excluded; 4,7,10 not coprime (odd/even clash), 7,13,19 coprime | holds | T defined, Checks added |
| §4.31 model completeness | fields with ℚ⊂ℚ(√2); ACF with 𝔽̄₂, ℂ | ∃x x²=2 false/true; 1+1=0 true/false | separates m.c. from completeness | Checks added |
| §4.29(b) hypothesis (i) | smooth fibre; zero of Q with K⊗k(M) a field; zero of P with K⊗k(M) split; S₃ constant field | closure k(M); K⊗k(M) cyclic of degree p; k(M); non-abelian closure fails | hypothesis now non-vacuous | reworded |
| §4.29(c) fibrewise models | k=ℚ, p=2, d=2, u=1 and u=1/2 | K_1=ℚ(√2), U: X²−2Y²=P≠0; K_(1/2)=ℚ×ℚ, U: XY=P≠0, rational; U_u≅U_(uw²) | union of classes; no A-model needed | reworded |
| §6.8 via contract | Y=ℂ, E={0}; node {xy=0} ⊂ ℂ²⊂ℙ²; E=Y; E=∅ | closure ℂ; branch {y=0}⊂Y; ∅; A itself | holds | proof replaced |
| §6.14 via contract | X_t=(0,1); singleton; n=0 | one block, count 0; ≤1; 0 or 1 | holds | route reworded |
| §6.16 per branch | n=1,k=2,X=(0,∞), z²−1; X={√2}, k=2 | smaller branch → −1∉X, larger → 1∈X; ray c(−2,0,1) is a 1-dim basic block mapped to the point √2, count 1 | per-branch blocks land in X_t; images may drop dimension, count still bounded by blocks | route and Check |
| §7.1 (I-ws)(d), §7.3 | V′=A₁; V′ reducible | infinitely many CM points, no isolated one; isolated points are 0-dim maximal special subvarieties of each component | finiteness of isolated points only | reworded, Check added |
| §7.7 U | universal elliptic curve; pure datum; S=A_g | U=0, Z(W)=W; U=V=W=0; N(x)=1 | U≠centre in first | reworded, Check amended |
| gap:block-family-covering | Pila Theorem 3.5 form; X_t=(0,1) | one block family, 1≤c·T^ε fibre | matches source | contract added |
| gap:ran-exp-analytic-cells | §6.10 on X=ℂ⊂ℝ² | one analytic cell meets V₁ with interior, identity theorem gives U⊆V₁ | needed (continuous cells do not give it) | contract added |
| gap:definable-remmert-stein | PS 4.4 hypotheses | E need not be definable; A in M∖E closed analytic definable | matches source | contract added |

## Suggested.lean signatures

`#check @name` for all 14 remaining declarations was elaborated once in a scratch copy of the file. Each elaborated type is identical to the one the job recorded before the change, and each matches its README statement. No section binder was lost (the file has no section `variable`s). The only Lean change is the deletion of `rationalDiophantine` and `rational_nonintegers_diophantine` (H16).

## Ownership, suppliers and sources

- The three contracts name owners that already construct the object: B2.6 ("Also construct the parameter-uniform block decomposition"), §3.5a (R_an,exp and its o-minimality) and §3.5d ("the required local complex definable-analytic dimension and extension arguments"). `roadmaps grep` over main and all open heads found no other owner of analytic cell decomposition, of the Peterzil–Starchenko closure theorem, or of a stated block covering. Both suppliers are earlier in the merge order (ShimuraVarieties line 107, AbelianSchemesAndArithmeticModuliPartII line 157, this roadmap line 330).
- No notion was moved down from a later roadmap.
- No source was fetched; every new locator is to a cached source and was read at the cited line. `needs-references.toml` was not created.
- No suspicious instruction was found in the review text.

## Build and gate

- `lake build TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.Suggested`: `Build completed successfully (18248 jobs).` There are 11 `declaration uses 'sorry'` warnings, one per theorem.
- Gate after commit `3a5156db`: `gate LogicAndDefinabilityInNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved: line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
