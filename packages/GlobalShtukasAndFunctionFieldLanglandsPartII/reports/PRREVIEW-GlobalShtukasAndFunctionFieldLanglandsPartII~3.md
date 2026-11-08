# Review of GlobalShtukasAndFunctionFieldLanglandsPartII (pull request #1845 at 9a1ad06)

**Verdict:** accepted

Incremental re-review of the 42 lines changed since 0dfe33c (34 in `README.md`, 8 in `Suggested.lean`, nothing outside the folder). The change repairs all three findings of the previous review and introduces no new defect. No finding remains.

## Previous findings

- R01 — repaired: line 612 now reads "the right-hand side has the same I_∞-invariants as Kl_H,Ad itself, because the monodromy operator N_∞ vanishes (next paragraph). Geometric semisimplicity … does not give this"; line 614 proves N_∞=0 from (Kl_H,Ad)^(I_∞)=0 and I_∞-invariance of N_∞; the last Check (line 636) records the PGL₂ witness 1 versus 3 at 0 and 0 versus 0 at ∞.
- R02 — repaired: line 608 cites gross-reeder §9.2 and Proposition 9.3 for irreducibility and supercuspidality, writes the inducing character as ψφ⊗1 (ψφ defined at line 606 from hny §1.3), and replaces "Steinberg at 0" by "a nonzero vector fixed by the opposite Iwahori subgroup I₀^op at 0"; line 610 is a full proof route for V_φ, for the existence, uniqueness and multiplicity of π(φ), and for the Satake match; the *Needs* line 638 adds KB *level-model*, *clean-datum*, *hecke-action*, SR §SR.2.1 and §SR.3a.1, FunctionFieldArithmetic §§6.2–6.4 and §6.6, and LanglandsParameterStacks §§1.13–1.15; the contract paragraph (line 36) and the Layer 4 Dependencies (line 791) carry the same additions; `gross-reeder` is a certified author-page entry of `sources.toml` and a reference at line 1396.
- R03 — repaired: line 614 reads "whose hypothesis on p for groups that are not simply laced, p>2 in types B_n and C_n and p>3 in types F₄ and G₂, is removed by xz …", and the G₂ Check (line 629) adds E₈ at p=5 and D₄ at p=2 as instances inside hny Theorem 2.

## Verified sound

**Gate, build, elaboration, outside diff.** I re-ran the gate at 9a1ad06: every scanner reports 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material), result OK; the worker's gate (`scratch/gate.md`) adds build=0. `lake env lean` on `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` exits 0 with no output: the file declares nothing, so there is no `sorry` warning, no `#check` probe and no padding probe to run. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only. `design/plan.json` lists 13 gap slugs, the README's 13.

**Dependency check** (`gate --depcheck … --movable`):

```
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `scratch/overlaps.md` lists no other pull request changing this folder, no dropped id and no id defined only by an open revision.

**The new anchor proof route (line 610), step by step.**
- G₀(F_∞)=I₁·N·I₁ follows from ReductiveGroupsPartII RG2.4.2 *iwahori-bruhat-decomposition* (`G(K)=⊔_w IẇI`, main README line 5711) with I=T(k)·I₁ and T(k)⊂N; for simply connected G₀, N/T(O_∞) is the affine Weyl group (gross-reeder line 2201–2203).
- w≠1: gross-reeder Lemma 9.1 (line 2167) gives ψ∈Π with wψ∈Ψ⁺−Π; U_ψ⊂I₁∩n⁻¹I₁n, nU_ψn⁻¹=U_(wψ)⊂I⁺⁺=I₂ (line 2217, 2278–2282). The KB *affine-depth* I₂ "contains T(1) and all nonsimple positive affine-root groups" (KB design line 61), the same group.
- w=1: T(O_∞)=T(k)·T₁ with T₁⊂I₁ (gross-reeder line 2283); α(t)=1 for every simple root forces t∈Z (line 2286–2289). Instances in the table.
- Directness of I₁·Z(G₀)(F_∞): Z(G₀)=∏μ_(n_i)⊂T is finite of multiplicative type; μ_n(k((s)))=μ_n(k) because 1+sk[[s]] is torsion-free in characteristic p (pro-p, and (1+x)^p=1+x^p); Z(G₀)(k)⊂T(k) has order prime to p and I₁ is pro-p. gross-reeder line 2320–2322 writes Z(k)=Z⁺×Z(q) with Z⁺=Z(k)∩I⁺ a p-group: Z⁺ is trivial here because F_∞ has characteristic p, and this is exactly what the README states.
- The criterion: SmoothRepresentationsOfLocalGroups SR.3a.1 *compact-induction-criterion* (open head, line 2423: K open containing the centre with K/Z compact, ρ irreducible, intertwining set exactly K ⟹ c-Ind irreducible with coefficients compact modulo Z) and *harish-chandra-compactness* (line 2374: for admissible V, coefficients compact modulo Z ⟺ quasi-cuspidal); Schur's lemma and admissibility of irreducibles at line 2395–2408; *frobenius-reciprocity* (line 1937: for H open, c-Ind_H^G is left adjoint to restriction) and *compact-induction* (line 1919). gross-reeder line 78 says Proposition 9.3 is uniform in the nonarchimedean local field, so its use over k((1/t)) is within the source.
- The level: KB.0 *level-model* (design line 90: opposite Iwahori level I₀^op at 0, I₂ at ∞, components indexed by Ω, big-cell charts j_γ), hny Proposition 1.1 (line 529, page 10) and Corollary 1.3 (line 564, page 11).
- hny Lemma 2.1 (line 636, page 12): an (I₁,ψφ)-equivariant function on Bun_G(0,2)(k) vanishes off Ω and is determined by its values on Ω, which are arbitrary by Corollary 1.3; Remark 2.2 (line 644): such functions are cuspidal. For simply connected G₀, Ω=π₁(G₀) is trivial: a line. KB.1 *clean-datum* (design line 172) is the sheaf form (clean extension along j_γ, unit fibre at the base point).
- A constant central element lies in G₀(K₀), in I₀^op and in every G₀(O_x), so it acts trivially on functions on Bun_G₀(0,2)(k); hence the (I₁,ψφ)-isotypic cusp space equals the (I₁·Z, ψφ⊗1)-isotypic one.
- The count: A_cusp^U=⊕ m(π)π^U (FunctionFieldArithmetic §§6.2–6.4 at #1474, lines 2159–2340: automorphic function modules, constant terms and the cusp module, finiteness of cusp forms); Hom_(I₁Z)(ψφ⊗1,π_∞)=Hom_G(V_φ,π_∞), of dimension 1 exactly when π_∞≅V_φ; dim π_x^(G(O_x))=1 at unramified x. So 1=Σ m(π)·dim π_0^(I₀^op) over cuspidal π unramified outside {0,∞} with π_∞≅V_φ, a sum of positive integers equal to 1: one term, m(π)=1, dim π_0^(I₀^op)=1. Every π with the three stated properties contributes at least 1, so it is the unique one.
- The Satake match: KB.1 *hecke-action* (design line 203, normalized Satake kernel IC_W) and *eigenobject*; the trace formula on stacks is in GlobalShtukasAndFunctionFieldLanglands §1.4 (#1490 line 614, API bullet "the weighted point sum equals the convergent alternating trace of Frobenius on RΓ_c"); the normalized spherical Satake isomorphism is §1.12 of that roadmap and FunctionFieldArithmetic §6.6 (#1474 line 2370). hny line 957–961 states the same conclusion.

**The repaired parameter-agreement and N_∞ argument (lines 612–614).** N_∞ is the nilpotent of LanglandsParameterStacks §§1.13–1.15 (open head, lines 457–510: φ(x)=exp(t_ℓ(x)N) on an open inertia subgroup, N in the nilpotent cone of Lie Ĥ, Ad(φ₀(w))N=q^(−deg w)N). For g∈I_∞, t_ℓ(ghg⁻¹)=t_ℓ(h), so Ad(ρ(g))N_∞=N_∞ on an open subgroup of ℤ_ℓ(1)-values, and injectivity of log on unipotents gives Ad(ρ(g))N_∞=N_∞: N_∞∈(Lie H)^(I_∞)=0. With N_∞=0 an open subgroup of I_∞ acts trivially, so I_∞ acts on every τ∘Kl_H through a finite quotient, the restriction to I_∞ is semisimple (characteristic-zero coefficients), and any Jordan–Hölder filtration as a W_(F_∞)-representation splits on restriction to I_∞, so the W_(F_∞)-semisimplification has the same I_∞-restriction and the same invariants. The H-valued semisimplification L_(F_∞)(V_φ)=(σ|_W)^ss satisfies τ∘L≅gr_P(τ∘σ|_W), whose semisimplification is (τ∘σ|_W)^ss=(τ∘Kl_H|_W)^ss. xz Corollary 4.5.7(ii) (line 2482, page 54) records N_∞=0 for the companion, as cited. hny Theorem 2 (line 976–977) assumes p good only for non-simply-laced G, as line 614 now says.

**Changed Checks.** The SL₂ Iwahori–Hecke Check: the algebra of type Ã₁ has generators T₀, T₁ with (T_i−q)(T_i+1)=0, so four one-dimensional characters, (q,q) the trivial representation, (−1,−1) Steinberg, (q,−1) and (−1,q) the two constituents of the unramified principal series with χ(ϖ)=−1, each with a one-dimensional Iwahori-fixed space (Ind(χ)^I has dimension |W|=2 and splits). The PGL₂ Check: Ω≅π₁(PGL₂)≅ℤ/2, so hny Lemma 2.1 gives a plane. The E₈/D₄ Check: both simply laced, inside hny Theorem 2 as printed; G₂ at p=2,3 and B_n at p=2 outside. The semisimplification Check: see the table.

**Cross-roadmap citations resolved (new ones in the diff, 14/14).** SmoothRepresentationsOfLocalGroups §SR.2.1 *compact-induction*, *frobenius-reciprocity*; §SR.3a.1 *cuspidal-representations*, *harish-chandra-compactness*, *compact-induction-criterion*, Schur's lemma (open head of #1688, lines 1919, 1937, 2349, 2374, 2395, 2423); KloostermanSheavesAndBesselIsocrystals KB.0 *level-model*, KB.1 *clean-datum*, *hecke-action* (board design lines 90, 172, 203); ReductiveGroupsPartII RG2.4.2 *iwahori-bruhat-decomposition* (main, line 5711); LanglandsParameterStacks §§1.13–1.15 (open head of #1202, lines 457–510); FunctionFieldArithmetic §§6.2–6.4, 6.6 (#1474 lines 2159, 2204, 2252, 2370) and §5.8 (line 2019); GlobalShtukasAndFunctionFieldLanglands §1.4, §§1.9–1.14, §§5.3, 5.8–5.10, §§7.6–7.9 (#1490 lines 614, 727–850, 1735–1853, 2072–2110). The citations the diff leaves untouched were resolved in the previous review.

**Sources at their locators (the sample target 4.0 is the only sampled target in the diff).** hny §1.3 line 484 (page 9: generic φ nontrivial on every U_α; ψ∘Tr_(k/𝔽_p)); Proposition 1.1 line 529 (page 10); Corollary 1.3 line 564 (page 11); Lemma 2.1 line 636 and Remark 2.2 line 644 (page 12); §0.3 line 135–153; Theorem 1 line 950–961; Theorem 2 line 976–981. ghs Proposition 3.9 line 450–485 and Remark 3.10 line 486–492 (Chebotarev identification of the semisimple local systems). xz Corollary 4.5.7 line 2478–2502 (pages 53–54), Remark 4.5.8(i) line 2503 and (iv) line 2512. gross-reeder (author-page preprint dated 1 March 2010, line 14): Lemma 9.1 line 2167 (page 60), §9.2 line 2186–2256 (pages 60–62), Proposition 9.3 and proof line 2264–2290 (pages 62–63), the uniformity statement line 78. All support the statements as written. The other sampled targets (0.2, 1.2, 1.3, 1.4, 3.2, 3.6, 4.1, 4.2, 5.1, 5.2, 5.4, 6.2, 7.1, 7.2) lie outside the diff.

**Library at the pins (Mathlib f6090c70, Tau Ceti 358314d4).** The changed docstring bullet names carriers the anchor lacks: Tau Ceti has an abstract `TauCeti.TitsSystem` (`TauCeti/GroupTheory/TitsSystem/Basic.lean` line 50) but no Iwahori subgroup of a reductive group over a local field (the only "Iwahori" hits are in `KnotTheory`), no smooth or automorphic representation and no lisse sheaf; so nothing in §4.0 is statable and the docstring is accurate.

**Ownership.** `roadmaps grep 'simple supercuspidal|affine generic'` over the open pull requests and main finds the Gross–Reeder construction and π(φ) only in this README (the SpringerResolution hits are "affine generic-length", a different object). The irreducibility proof of V_φ is a four-line Mackey computation whose inputs are SR.3a.1 and gross-reeder, and no roadmap owns simple supercuspidal representations, so stating it here plans nothing twice.

**Adversarial table.** Rows for the changed statements are new. Rows marked "prev." are carried from the previous review (at 0dfe33c, and through it from 1858508) for statements the diff leaves untouched, with that review's values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 4.0 anchor: I₁·Z(G₀)(F_∞) is direct | SL₂/𝔽₃((s)); SL₂/𝔽₄((s)); SL₃/𝔽₄((s)); SL₂/ℚ₂ as a control | μ₂(𝔽₃((s)))={±1}, order 2 prime to 3; μ₂(𝔽₄((s)))=1; μ₃(𝔽₄((s)))=μ₃(𝔽₄), order 3 prime to 2; over ℚ₂, −1∈1+2ℤ₂ so Z∩I⁺={±1} | direct in equal characteristic, as stated; the ℚ₂ control shows the hypothesis is used | none |
| 4.0 anchor: intertwining for w≠1 | SL₂, w=s₀ | s₀(α₁)=α₁+2α₀=−α+2δ, positive, coefficient sum 3>1, so U_(s₀α₁)⊂I₂; ψφ nontrivial on U_(α₁) | no intertwining, as gross-reeder line 2278–2282 | none |
| 4.0 anchor: intertwining for w=1 | SL₂, t=diag(a,a⁻¹), q odd and q=4 | α(t)=a²=1 ⟺ a=±1 (q odd), a=1 (q=4); Z(SL₂)(k)={±1}, resp. 1 | fixing ψφ forces t∈Z(G₀)(k) | none |
| 4.0 anchor: uniqueness count | SL₂; PGL₂ | Ω trivial: isotypic cusp space a line, 1=Σ m(π)·dim π_0^(I₀^op) forces one term with m=1, dim=1; PGL₂: \|Ω\|=2, a plane | uniqueness exactly for simply connected G₀ | none |
| 4.0 anchor: Z(k) acts trivially on the line | z=−1∈SL₂(k) | z∈G₀(K₀), z∈I₀^op, z∈G₀(O_x): f(gz)=f(zg)=f(g) | ψφ-isotypic = (ψφ⊗1)-isotypic | none |
| 4.0 Check: SL₂ Iwahori–Hecke characters | type Ã₁ | (T_i−q)(T_i+1)=0, 2²=4 characters: (q,q), (−1,−1), (q,−1), (−1,q); Ind(χ_(−1))^I of dimension 2 splits 1+1 | four representations with a one-dimensional Iwahori-fixed line | none |
| 4.0 N_∞ is I_∞-invariant | g∈I_∞; g=Frob | t_ℓ(ghg⁻¹)=t_ℓ(h) for g∈I_∞, so Ad(ρ(g))N=N; for Frobenius q⁻¹N (LPS 1.13 Check: diag(1/3,1), N=E₁₂ ↦ N/3) | N_∞∈(Lie H)^(I_∞)=0 | none |
| 4.0 semisimplification at ∞ versus 0 | H=PGL₂ | at 0: dim ker(ad N)=1 before, 3 after W_(F_0)-semisimplification (weights −2,0,2); at ∞: N_∞=0, 0 and 0 | the repaired inference uses N_∞=0, not geometric semisimplicity | none |
| 4.0 hny Theorem 2 hypothesis | E₈ p=5; D₄ p=2; G₂ p=2,3; B₂ p=2 | simply laced: inside hny line 976; G₂, B₂: outside, covered by xz | wording now matches the source | none |
| 4.0 product decomposition (prev.) | SL₂×G₂ | affine simple root lines 2+3=5=dim V; Swan 1+2=3; invariants 0+0=0 | consistent | none |
| 4.0 trivial group (prev.) | rank 0 | Lie H=0, V=0, Swan 0; V_φ and π trivial | consistent | none |
| 4.0 degree of the L-function (prev.) | Sym²Kl₂(1) | h⁰_c=h²_c=0, h¹_c=1, L=1−T/4, degree 1=−χ_c | holds | none |
| 4.0 p-adic GOS on G_m (prev.) | A₁, G₂ | −0−1=−1; −0−2=−2 | matches RD.6.55 | none |
| 4.0 étale invariant count (prev.) | A₁; G₂ | A₁: dim Lie 3, ker(ad N)=1, h¹_c=1; G₂: 3+11=14, ker(ad N)=2, h¹_c=2 | injection forces I_∞-invariants 0 | none |
| 4.0 Check: Kloosterman second moment (prev.) | 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅, 𝔽₇ | ΣK(a)²=1, 5, 11, 19, 41=q²−q−1; trace 1; normalized 1/q | as stated | none |
| 4.0 Check: constant sheaf (prev.) | rank 2 on G_m | χ_c=0 vs −1 | distinguishes | none |
| 4.0 Check: A₄ at p=2 (prev.) | SO₃ adjoint character | (3−3+0)/12=0 | as stated | none |
| 4.2 route: G_sc×Z°→G (prev.) | PGL₂; GL₂ | cokernel F^×/F^×² of order 4 (q odd), infinite at p=2 | carried by the reductive-central-reduction contract | none |
| 5.4 Check (prev.) | q=4, coroots (a,b) | (−1)^a·2^b: −1, 2, −2, 2, −2, −4 | matches SRPII §5.26 | none |
| Suggested.lean docstring, §4.0 bullet | pins | abstract `TitsSystem` only; no Iwahori subgroup, smooth representation, lisse sheaf or isocrystal | correct | none |
| Conventions, Tate/N directions (prev.) | q=4, r=diag(1,4), Ne₁=e₀ | rNr⁻¹=N/4; weights 0,2 | consistent | none |
| Conventions, Weil×SL₂↔WD (prev.) | upper generator e | Ad(diag(q^(−1/2),q^(1/2)))e=q⁻¹e | consistent | none |
| 0.1 geometric (prev.) | q=4: 2, 3; (3+4i)/5; e^i | weight 1; log₂3∉ℤ; modulus 1 of infinite order; transcendental | as stated | none |
| 0.2(b) S₃ (prev.) | q=5, q=4, inertia C₃ | 5≡2 mod 3 inverts C₃; q=4≡1 allows trivial Frobenius | as stated | none |
| 0.3 purity (prev.) | diag(1,q), N=0, Salem quartic | pure of weight 1; real root 1.72208380574 | as stated | none |
| 1.1 twist classes (prev.) | ℓ=7 over 𝔽₂: 1+i, 1+2i; ℓ=5: 3 | \|1+i\|=2^(1/2); \|1+2i\|=√5; 3 a 5-adic unit | as stated | none |
| 1.2 boundary propagation (prev.) | Kl_n at 0; 3 on G_m/𝔽₄ | Weil q^(0..n−1); no integer weight | as stated | none |
| 1.3 Frobenius cocharacter (prev.) | q=4, diag(2,1/2); torus | ω(α)=log 4>0 | as stated | none |
| 2.1 occurrence (prev.) | L[ε]/(ε²); G_m, ξ=3^deg | block dim 2 vs eigenspace 1; 3^d≠1 | as stated | none |
| 2.3 nonsplit (prev.) | Res PGL₂, t_w=1 | eigenvalues 1,1,−1,−1 | as stated | none |
| 3.1 Frobenius bookkeeping (prev.) | q₁=4, deg v=2, α⁴+α+1=0 | α⁴=α+1≠α; α¹⁶=α | as stated | none |
| 3.1 congruence model (prev.) | x∗y=x+y+zxy | (1+zx)(1+zy)=1+z(x∗y) | as stated | none |
| 3.6 residue degree (prev.) | E/F unramified quadratic | ±q_F^(1/2) weight 1; ±q_F^(1/4) weight 1/2 | as stated | none |
| 4.1 ι-tempered (prev.) | Salem ζ; ζ₃; (3+4i)/5 | 1.72208 at the real embedding; moduli 1 | as stated | none |
| 4.3 pseudo-coefficient (prev.) | PGL₂ | tr St=1, tr 1=−1, principal series 0 | as stated | none |
| 4.4 essentially discrete (prev.) | GL₂, q=4, χ(ϖ)=3 | central 9; pair (6,3/2); ratio 4 | as stated | none |
| 5.1 separators (prev.) | PSO₈, PSO₁₂, PGL₂×PGL₃, 𝔽₂((t)) | half-spin 2,0,−2 with 1,6,1; pairings 3/4, 1/2 | as stated | none |
| 5.2 lifting (prev.) | p=2 vs odd p; ±I | cd_p≤1, H²(G_K,ℤ/2)=0; traces ±2 | as stated | none |
| 5.4 PSU(2n+1) (prev.) | PSU₃ | ½ω₁ separated only by spin of Spin₃ | as stated | none |
| 6.1 elliptic (prev.) | GL₂ χ₁⊕χ₂; torus; V₄⊂PGL₂ | S_σ/G_m 1-dim; centralizer V₄ | as stated | none |
| 7.5 rationality (prev.) | [[0,−1],[1,0]] | X²+1 over Q(i) | as stated | none |
| 8.0 recognition (prev.) | Spin₈, Sp₆ classes | 1,6,1 vs 4,4; 3,3 vs 1,1,2,1,1 | as stated | none |
| 8.4 Property A (prev.) | small arrays | r(2)=2, c(3)=1>r(3)=0 | as stated | none |
| 8.5 F₄ B₃ (prev.) | x=(5/2,1,1/2,0) | multiplicities 1,0,2 vs 1,0,1 | as stated | none |
| 8.5 Sp₆ (prev.) | (2,2,2) | n_x(2)=1>0 | as stated | none |

## Not verifiable

- **KB citation numbering.** KloostermanSheavesAndBesselIsocrystals is neither on main nor in an open roadmap pull request (`scratch/citations.md`). Every KB citation, including the three new ones (*level-model*, *clean-datum*, *hecke-action*), was resolved against its board design (`packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`), whose layer labels KB.k and target slugs the README uses. The package numbering of its final README cannot be checked here.
- **Published numbering of gross-reeder.** The README cites the author-page preprint of 1 March 2010 and says so; the Duke Mathematical Journal pagination was not compared.
- **Carried from the previous reviews.** The arXiv v3 wording of ghs Theorem 1.2 was not read. The E₇ and E₈ adjoint weight profiles were checked against ch26 Tables 2–3, not recomputed.

## Source issues

- **Error** in ghs at Remark 3.10, p. 11: the source says that the irreducibility proved by HNY and XZ makes Lafforgue's semisimple parameter composed with the adjoint representation irreducible; it should be that the parameter lies in no proper parabolic, since for SL₂ at odd p the adjoint inertia image at ∞ preserves a tame-character line while its invariants vanish; affects nothing.
