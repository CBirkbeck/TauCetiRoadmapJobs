# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 930a1af)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder has 0 changed lines since then. The previous finding is not repaired and is raised again (R01). There are three new findings:

- R02: one declared gap's `needs` sentence cannot be read on the supplier's job.
- R03: four Layer 0 targets are stated at every prime, but their locators assume θ=p and p>2.
- R04: the pull request's summary is stale.

The gate, the elaboration, the dependency check, the 15 sampled locators and the adversarial computations otherwise pass.

## R01 (P2) — The four GeometricSatakeAndFusion contracts are still not declared in the plan's gaps

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` lines 102, 104, 106 and 108, for example "What GeometricSatakeAndFusion must provide (gap:scheme-local-model-representative), extending its §4.17: …". Also `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** The README states 15 supplier contracts (`grep -o 'gap:[a-z0-9-]*' | sort -u`), but the plan declares 11. The four GeometricSatakeAndFusion slugs have 15, 8, 4 and 4 mentions. They are prerequisites of §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2 and of the Layer 3 Dependencies. Because they are undeclared, the intake never announces them on GeometricSatakeAndFusion's job.

**Witness.** The plan's `gaps` has 11 slugs, none with supplier GeometricSatakeAndFusion. The package acceptance, `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/review.json`, lists all four of these slugs under `conditional_gaps`.

**Why H01 does not settle it.** The answer to the previous review confirmed the count and the history, and changed nothing. The head and the plan are as they were. The package was accepted conditional on exactly these four slugs, and the review rules let the package add gaps to the plan's top-level `gaps`. If the pull request's repair job cannot write the plan, restoring the four entries is the human action that parking exists for.

**Repair.** Add four `gaps` entries with supplier GeometricSatakeAndFusion:

| Slug | Section | `needs` |
|---|---|---|
| `scheme-local-model-representative` | 4.17 | the sentence of README line 102 |
| `scheme-local-model-hodge-immersion` | 4.17 | the sentence of README line 104 |
| `schubert-curve-spanned-tangents` | 0.29 | the sentence of README line 106 |
| `local-model-curve-spanned-tangents` | 4.17 | the sentence of README line 108, after the edit below |

Line 108 has two back-references that make no sense when the sentence is posted alone on the supplier's job. Edit it in the README and use the same sentence in the plan:

- "satisfying the standard assumptions above" becomes "satisfying KPZ26 Standard assumptions 3.1.5 (p>2, (G,μ) of abelian type, G essentially tame and classical, triality excluded; KPZ26 line 717)".
- "spanned by smooth formal curves in the sense of the previous contract" becomes "spanned by the tangent images of k-morphisms Spec k[[t]]→`Mloc_{𝒢,μ}⊗k` sending the closed point to that point".

Tested: the plan's slug set then equals the README's 15, and each of the four sentences states its objects and hypotheses without pointing at another contract.

## R02 (P2) — The needs of `gap:full-fixer-cutting-tensors` cannot be read on the supplier's job

**Location.** README line 88, and the `full-fixer-cutting-tensors` entry of `plan.json`: "For the specified smooth affine full fixer models, provide finite scheme-theoretically cutting mixed tensor families … the ordinary-Levi intersection is the separate contract below."

**Claim.** This sentence is announced on its own on ReductiveGroupsPartII's job.

- There, "the specified models" and "below" point nowhere.
- The sentence states no base ring and no hypothesis on the generic fibre, and the fixer lemma needs one. So this is a vague `needs` in the sense of the gap rules.
- The README itself uses the lemma beyond ReductiveGroupsPartII's models. In §4.2 (line 1070), the dilatation is called "the full fixer of a finite tensor family" by "the fixer lemma invoked in KP18, §4.1.7".

**Witness.** Over ℚ_p the Borel B⊂GL₂ is the fixer of no tensor family: every GL₂-representation W has W^B=W^{GL₂}. The generic-fibre hypothesis is essential and absent. ReductiveGroupsPartII on main states no tensor-cutting theorem.

**Repair.** Replace the needs with the following sentence, in README line 88 and in the plan entry:

> For a mixed-characteristic discrete valuation ring O, a finite free O-module Λ and a closed O-flat subgroup scheme 𝒢⊂GL(Λ) with reductive generic fibre, give a finite family of tensors in Λ^⊗=⊕_{m,n}Λ^{⊗m}⊗(Λ^∨)^{⊗n} whose fixer in GL(Λ⊗R) is 𝒢(R) for every O-algebra R (Kisin17, footnote 7 to (1.1.3), p.7; Kisin17 lines 320–324: Kisin's Proposition 1.3.2, with Deligne's argument for tensor products and duals only).

If the board keeps declared needs fixed after the design, declare this sentence under a new slug instead, and replace the six README mentions of the old slug.

Base change then needs no separate clause, since the fixer condition holds on every O-algebra.

Tested on three cases:

- The reductive hypothesis excludes B.
- The §4.2 dilatation, a closed flat subgroup of GL(Λ′), is included.
- Every ReductiveGroupsPartII §RG2.3.5 stabilizer is included through any faithful finite-free realization.

## R03 (P3) — Layer 0's frame-constant targets cite only sources that assume θ=p and p>2

**Location.**
- §0.8, line 288: "its matrix is [[φ(A),θφ(B)],[φ₁(C),φ(D)]], with θ the frame constant … (KPZ26, §5.1.2, (5.1.3) …)".
- §0.9, line 310: "(KPZ26, (5.1.4), p.49; KPZ26 line 2133)".
- §0.10, line 327: "(KPZ26, §5.1.7, p.49; KPZ26 line 2157)".
- §0.12, line 370: "(Hoff23, §1.1 …; KPZ26, §5.1.19 …)".

**Claim.** Line 26 says Layer 0 holds at every prime. So these four targets are stated for frames with an arbitrary constant θ, including D_(ℤ₂) with θ=2−[4]. Their only locators fix θ=p and p>2, so at p=2 the statements as written have no source.

**Witness.**
- KPZ26 line 2080 assumes φ(a)=pφ₁(a), "θ=p", with p>2 throughout.
- KPZ26 line 2162 scales the T-basis by p.
- Hoff23 line 305 fixes p≠2.
- Lau14 line 672 gives θ=2−[4] for D_R at p=2.

**Repair.** Say that KPZ26 and Hoff23 treat θ=p, and add the θ-general locators:

- §§0.8, 0.9 and 0.12: Lau14, §2A, p.2214 (Lau14 lines 556–579). This covers:
  - frames with constant θ;
  - strict homomorphisms (u=1);
  - windows in normal representation (L,T,Ψ);
  - base change (L,T,Ψ)↦(S′⊗L,S′⊗T,Ψ′).

  The four-block formula is the matrix of a window morphism in these coordinates.
- §0.10: Lau14, Lemma 2.3 and proof, p.2215 (Lau14 lines 595–609). There V^♯=(1⊕θ)(Ψ^♯)⁻¹, which is j∘Ψ⁻¹, and full faithfulness holds when θ is not a zero divisor.

Tested on D_(ℤ₂): the ghost components of θ are (−2,−14,−254,…), all nonzero, so θ is a non-zero-divisor and §0.10's injectivity clause applies. Lau14's statements cover this case; KPZ26's exclude it.

## R04 (P3) — The pull request's summary contradicts the README

**Location.** The roadmap-summary block of the pull-request description: "Over complete Noetherian local rings with perfect residue field and p>2, it constructs the Zink ring Ŵ(R), p-frames …". The description body also says "Fourteen supplier extensions … are stated as exact contracts".

**Claim.** Since the Layer 0 repair, the README states Layer 0 at every prime, with frames of constant θ. It also states 15 supplier contracts, not 14.

**Witness.** README line 26: "Layer 0 holds for every prime p, including p=2". README lines 50–124 contain 15 sentences of the form "What … must provide (gap:…)".

**Repair.**
- Rewrite the summary's first sentence as "Over complete Noetherian local rings with perfect residue field and at every prime (p>2 from Layer 1 on), it constructs the Zink ring Ŵ(R), frames with constant θ (p-frames for odd p) …".
- Change "Fourteen" to "Fifteen".

## Previous findings

- **R01 of the previous review** (four GeometricSatakeAndFusion contracts missing from the plan's `gaps`): **not repaired.** The change set records 0 changed lines in the folder, and `plan.json` still declares 11 slugs. The answer (H01) confirmed the count and the history without making a change. It is raised again above as R01.

## Verified sound

**Gate, build and form.**
- My own run of the gate at 930a1af reports: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The worker's gate additionally reports build=0.
- `lake env lean TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` from the worktree exits 0 with no output (3.5 s).
- The dependency check with `--movable` prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: FiniteFlatGroupsAndIntegralPadicHodgeTheory is at 65, ShimuraVarieties at 105, PadicHodgeTheory at 122, GeometricSatakeAndFusion at 130, and this roadmap at 131.
- The outside-folder diff against `origin/main` is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- Suggested.lean has `module`, `public import Mathlib`, the module docstring, `@[expose] public section` and an empty `namespace TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII`. This is the module form used by 46 of the 160 Suggested.lean files on main.
- There are no declarations, so `#check @name` had nothing to compare, no section variable can be lost, and no padding probe applies.
- README form:
  - Every layer ends with `### Examples` and `### Dependencies`.
  - The README has 92 `*Needs:*` lines with 197 parenthesised own-section titles (78 distinct); all equal their headings (script comparison, 0 mismatches).
  - No `*Needs:*` edge points to the same or a later section (0 forward references among 92 sections).
  - A grep for process words, LaTeX delimiters and `lemma` finds nothing.

**Headline theorems.**
- The README's headlines, grouped as in the docstring:
  - perfect-ring and complete-local Dieudonné anti-equivalences (§§0.2, 0.5, 0.13);
  - the universal marked display (§1.8);
  - integral tensor torsors (§§2.4, 2.6);
  - very-good criteria and existence theorems (§§3.7–3.17);
  - integral comparison, recognition and the versal adapted deformation theorem (§§4.4, 4.12–4.14);
  - hyperspecial frames, lifts, loci and lattice specialization (§§5.1–5.19);
  - the ordinary normalization, the ordinary lift and the J_b(ℚ_p) action, and the Levi-filtration lift (§§6.0–6.6).
- The docstring names 21 groups and the missing carrier of each.
- At the pins, Tau Ceti has no p-divisible groups, displays, parahoric or Iwahori–Weyl carriers. The only "Dieudonné" hits are Cartan–Dieudonné files under `TauCeti/LinearAlgebra/CliffordAlgebra/`.
- Mathlib has `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, a class with no finiteness) and `Module.Grassmannian.functor` (`Mathlib/RingTheory/Grassmannian.lean:185`, with no representing scheme).
- No headline is statable without a stand-in, so an empty file is correct.

**Library declarations opened at the pins.**
- `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme`: `TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:52`, finite locally free commutative group schemes over a scheme, as README line 22 says.
- `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson`: `Mathlib/RingTheory/Filtration.lean:415`. It needs a Noetherian ring and a finite module, as the Mathlib contract says.
- `IsLocalization.algebraMap_mem_map_algebraMap_iff`: `Mathlib/RingTheory/Localization/Ideal.lean:76`. It states x∈I·S ⇔ ∃m∈M, mx∈I, which is the contraction step of §4.11.
- `Module.Grassmannian`: `Mathlib/RingTheory/Grassmannian.lean:62–75`, with notation `G(k, M; R)`.

**Seeded sample (15 targets), each read at the cached text.**
- **§0.9.** KPZ26 (5.1.4), p.49, line 2133: natural isomorphisms for frame morphisms, which are strict by KPZ26 line 2082. This holds for θ=p only (R03).
- **§0.12.** Hoff23 §1.1, pp.8–9, line 368; KPZ26 §5.1.19, p.52, line 2282 (base change to k, constancy). Both are p>2 only (R03).
- **§2.2.** KP18 Lemma 3.2.6, p.171, line 2107: F is the preimage of ξ*(M̄₁) and is free because O_K has projective dimension 1 (lines 2112–2113). Hoff23 Lemma 2.7, p.18, line 857.
- **§2.11.** KPZ26 Lemma 5.2.3, p.54, line 2341.
- **§2.12.** KPZ26 §5.2.6 and Lemma 5.2.7, p.54, lines 2358–2365 (φ*(s⊗1), and the join of E with Fr(O)).
- **§3.9.** KPZ26 §5.3.17 and Proposition 5.3.18, pp.60–61, lines 2638–2656 (the mod π_E tangent space spanned by arithmetic curves; the proof uses 𝔖→Ŵ(O_K), x↦[π_K]).
- **§3.10.** KPZ26 Lemma 5.3.7(b), lines 2412–2416, p.55, and Remark 5.3.8, line 2439, p.56. The source proves n=2; the README's n-copy form is proved through §§3.4 and 3.8 and says so.
- **§3.17.** KPZ26 §6.2.8, Remark 6.2.9 and Corollary 6.2.10, pp.69–70, lines 3040–3080:
  - K×K× acts on the lines of V₀=K², or L× acts on the left of T₀=D, which matches the README;
  - the corollary takes s≥1 copies at a generic-facet stabilizer;
  - G̃′₁=[GO⁺×GO⁺]∩GSp, line 3071.
- **§5.5.** Kisin17 (1.1.16), p.10, lines 455–462. The isomorphism holds after inverting t∈A_cris(W).
- **§5.7.** Kisin17, proof of Proposition 1.1.13, pp.9–10, lines 433–446 (c=σ⁻¹(b)μ₀(E(0)), Frobenius c·μ⁻¹(E(u)), filtration from μ⁻¹).
- **§5.10.** Kisin17 Errata E.1–E.3, p.96, lines 4253–4274 (Lie H Frobenius-stable; ∇ on R_G has coefficients in Lie G; A, A_G and A′_G).
- **§5.12.** Kisin17 Proposition 1.1.10, p.9, line 386; Errata E.2–E.4, p.96.
- **§5.13.** Kisin17 Lemma 1.1.17, pp.10–11, line 463; the connectedness of Spec R_G[1/p] at lines 427–432.
- **§5.17.** Kisin17 Proposition 1.1.19 and proof, pp.11–12, lines 484–520 (K′/K with residue k′, g with g⁻¹bσ(g)∈G(O_L)p^{υ₀}G(O_L), adapted for gG_{W(k′)}g⁻¹). Wintenberger97 §0, p.1293, lines 179–186, has an arbitrary algebraically closed residue field; Proposition 4.5.3 is at line 1622, p.1331.
- **§6.0.** KZ25:
  - σ-straight is defined in §2.1.6, line 325;
  - Lemma 2.1.7, line 336; Lemma 2.1.9, line 369;
  - Definition 2.2.4, line 437; Lemma 2.2.6, line 444;
  - Proposition 2.3.3, lines 526–544, pp.8–12.

  The ReductiveGroupsPartII §RG2.4.3 convention, "the inverse image of −λ under the Kottwitz isomorphism", with representative λ(ϖ)⁻¹, matches the README's adapter t_here^λ=t_RG^(−λ).

**Adversarial table.** Every value was computed for this review.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 Check, V(1)∉Ŵ(ℤ₂) | p=2, R=ℤ₂ | ghost of V(1)−2 is (−2,0,0,…); coordinates z₀=−2, z₁=−2, z₂=−6, z₃=−54 (16+8+4z₂=0, 432+8z₃=0), all ≡2 mod 4 | holds | none |
| §0.1 Check, ṽ(1)∈Ŵ(ℤ₂) | −[2] | coordinates −2,−4,−16,−256 (4+2z₁=−4; 48+4z₂=−16; 1792+8z₃=−256); valuations 1,2,4,8 | holds | none |
| §0.1 u₀ | p=2 | V(u₀) has ghost (0,−2,−14,…), so w₀(u₀)=−1 is a unit; pu₀=F(2−[2])=2−[4] | holds | none |
| §0.3 Check, θ | D_(ℤ₂), D_(ℤ/4) | ghost of 2−[4] is (−2,−14,−254); [4]=0 in W(ℤ/4), so θ=2 there | holds | none |
| §0.4 Check | p=3, B=𝔽₃[x,y]/(x³,y³) | Witt S₁=−x²y−xy²≠0; [x+y] has second coordinate 0; γ₁γ₂=f³/2=0=3γ₃; γ₂γ₂=f⁴/4=0=6γ₄ | holds | none |
| §0.7 Check | 𝔽₃[x]/(x⁴) vs (x³) | x³=3!γ₃=0 is forced, false in the first; in the second γ₂=2x², products are 0 | holds | none |
| §0.8 θ formula | display morphism | Φ′(bl′)=φ(b)θΦ′₁(l′) for l′∈L′⊂M′₁ gives θφ(B); Φ′₁(cl′)=φ₁(c)Φ′(l′) gives φ₁(C) | holds; locator for θ≠p missing | R03 |
| §0.9 | D_(ℤ₂)→D_(𝔽₂); identity map | strict map sends θ=2−[4]↦2 since [4]=0 in W(𝔽₂); both sides are φ′*L′⊕φ′*T′; identity gives id | holds; KPZ26 line 2080 excludes it | R03 |
| §0.10 | d=0 over D_(ℤ₂) | j=2−[4], with all ghost components nonzero, so it is a non-zero-divisor and injective; KPZ26 line 2162 has p | holds; locator | R03 |
| §0.12 | p=2 | Hoff23 line 305 has p≠2; Lau14 lines 576–579 give Ψ′(s′⊗l)=uφ′(s′)⊗Ψ(l) with u=1 for strict maps | holds; locator | R03 |
| §0.13 Check | D̂(μ_{2^∞}) over ℤ₂ | Φ|M₁=θΦ₁ with Φ₁=φ forces Φ=(2−[4])φ≠2φ | holds | none |
| Conventions, D(H*)=D(H)∨(−1) | H=ℚ_p/ℤ_p | dual of F=σ is σ; the twist (−1) multiplies by p, giving pσ=D(μ_{p∞}) | holds | none |
| Conventions, composition order | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]]; T_p(q_h∘q_g)=hᵗgᵗ=(gh)ᵗ | holds | none |
| Conventions, GL₂ cocharacters | F=diag(p,1)σ | F(e₁)=pe₁, so Fil¹=ke₁; μ₀⁻¹=diag(z,1); p^{υ₀}=diag(p,1) | holds | none |
| §1.3 and Layer 1 Example | c=1+εE₂₁ | cE₁₁c⁻¹=E₁₁+εE₂₁ (E₂₁E₁₁=E₂₁, E₁₁E₂₁=0) | holds | none |
| §2.0 Check | T presented as uTu⁻¹, a∈W(𝔽_{p²}) | u·diag(2,1)·u⁻¹=[[2,−a],[0,1]]; entrywise σ gives −σ(a)≠a(1−2) | holds | none |
| §2.2 Checks | Fil¹=0, full, split | kernel of D⊗𝔖→D⊗O_K is E·(D⊗𝔖); D⊗𝔖; 𝔖e₁⊕E𝔖e₂; 𝔖/p=k[[u]]≠O_K | holds | none |
| §2.7 Check | k=F̄₃, torus cut out by E₁₁ | T-orbit is a point, R_G=W(k), a_G=(9)+(3)=(3), Ŵ(k)=W(k), c=id | holds | none |
| §2.11 | empty family for GL(Λ) | invariants are identity and contractions, horizontal by functoriality of c; agrees with the §2.10 Check | holds | none |
| §2.12 | O=W(𝔽_q), s with non-σ-fixed coefficients | φ*(s⊗1)≠s⊗1, so φ* must be kept (KPZ26 line 2360) | holds | none |
| §3.9 | K=Ĕ; e(K/Ĕ)=2 | the mod-π_E tangent space of O_K is 0, resp. 1-dimensional (π_E∈m_K²) | holds | none |
| §3.10 Checks | 𝒢=G_m on ℤ₃, n=0,1,2; weights ±1 | GL(0)={1} with kernel G_m; diag(a,b) commutes with the block-transfer map iff a=b; 2·2=4≢1, so no intertwiner | holds | none |
| §3.15 Checks | D=K, m=1, ξ=(1,−1) | ψ((v,f),(w,g))=fw−vg; ψ((1,0),(0,1))=−1, the reverse is 1; Λ_i^♯=pⁱℤ_pf | holds | none |
| §3.16 Check | L=ℚ_p(√p), δ=2π | M^Γ=pℤ_pe⊕ℤ_pf with dual ℤ_pe⊕p⁻¹ℤ_pf; (δ⁻¹M^♯)^Γ: (π⁻¹O_L)^Γ=ℤ_p and (p⁻¹O_L)^Γ=p⁻¹ℤ_p, equal; without δ⁻¹, ℤ_pe⊕ℤ_pf | holds | none |
| §3.17 Checks | (a,b) scalars; (1,g) | ψ(ae₁⊗v,be₂⊗w)=ab·h(v,w); (1,g) gives h(v,gw), not ∝h(v,w) for noncentral g | holds | none |
| §4.2 dilatation | p>2, K=ℚ̆_p | det χ_cyc∈ℤ_p^× gives κ=0; ω=χ mod p is nontrivial since [ℚ̆_p(μ_p):ℚ̆_p]=p−1; diag(1,ζ)∈H is outside the scalars | holds | none |
| §5.5 Checks | ℚ_p/ℤ_p; μ_{p∞} | T_p=ℤ_p maps to id∈Hom(A,A); t·unit with θ_cris(t)=0 and R/p≠0, so t is not a unit | holds | none |
| §5.7 | G_m, b=p, E=u−p | μ₀(z)=z⁻¹, c=p·(−p)⁻¹=−1, Frobenius −E(u)↦p at u=0; with μ₀(p) instead, c=1 and the residue is −p≠p | holds | none |
| §5.10 Check | R=W[[t]], F=(1+tE₂₁)diag(p,1) | pE₂₁+N(0)diag(p,1)=0 gives N(0)=−E₂₁; 1+n=t^{p−1}φ(n) is solved by n=−Σt^{pʳ−1}; h′=−n gives h=Σt^{pʳ}/pʳ, so (h)=(t) in K₀[[t]] | holds | none |
| §5.17 Checks | G_m, b=3, μ(z)=z⁻¹; k an algebraic closure of 𝔽₃(t) | jump 1, t_H=t_N=1; with μ(z)=z, t_H=−1≠1; k̄=k, K̆=K, residue not 𝔽̄₃ | holds | none |
| §6.0 Checks | G_m μ=1; GL₂ (1,0); rank-2 torus | t_here¹↔p, κ=ν=1; ℓ(t_{(1,0)})=⟨(1,0),α⟩=1; t^{(1,0)}σ(t^{(1,0)})=t^{(1,1)} | holds | none |
| §6.3 Check | E(0)=ap | c_E=E(u)/a, c_E(0)=p; E(u) alone gives ap | holds | none |
| R02 hypothesis | B⊂GL₂ over ℚ_p | W^B consists of weight-0 highest-weight vectors, which equal W^{GL₂}; B is no tensor fixer | gap needs a hypothesis | R02 |
| R01 declaration | README vs plan | 15 vs 11 slugs; the 4 missing have 15, 8, 4 and 4 mentions | undeclared | R01 |

**Cross-roadmap citations resolved at the current heads.**
- GeometricSatakeAndFusion (#1235): §0.29 line 808, §0.31 line 848, §0.37 line 973, §4.17 line 2130 (v-closure model with reduced special fibre A_(𝒦,μ), no scheme representative), §4.18 line 2152.
- VectorBundlesAndIsocrystals (#1205): "Finite isocrystals over the completed maximal unramified coefficient field" is a subsection of Layer 1 (line 214). "Integral group torsors and Frobenius" is a subsection of Layer 6 (line 2025), and its torsor/exact-tensor-functor equivalence for smooth affine G with connected fibres is the one consumed.
- PrismaticCohomologyPartIII (#1070): §6.0, whose paragraph "Perfect-base Dieudonné comparison" (line 108) gives M(ℤ/pʳ)=W_r with F=p·Frob, M(μ_(pʳ))=W_r with F=Frob, and M_cov(G)=M_contra(G^D).
- PadicHodgeTheory (#1062): §5.5 (line 1072); its period-torsor class is stated for K/ℚ̆_p finite.
- ShimuraVarieties (#933): §7.0i (line 2015).
- AbelianSchemesAndArithmeticModuli (#849): §§A4.CR.7.2 (line 2144) and A4.10 (line 2379).
- CrystallineCohomology (#857): Layer CR.1 (line 603) and §CR.7.1 (line 11244).
- DerivedDeRhamCohomology (#868): §PD.7 (line 2853), with `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` (lines 2883 and 3006). These are the two names the worker's resolver listed; both resolve.
- PadicPeriodRings (#940): §§3 (line 391), 4.1 (line 418) and 4.3 (line 471).
- PELModuli (#966): §M2.15 (line 2608).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879): §§R07.1.6–R07.1.8, R07.1.22, R07.2.10–R07.2.12, R07.2.27 (`deJongBoundedFormalFunctions`, line 4202), R07.3.2–R07.3.3, R07.4.1, R07.4.13, R07.4.16–R07.4.17, R07.4.20 (finite K/ℚ_p only) and R07.4.21, R07.4.25.
- On main at 1bea835:
  - ReductiveGroupsPartII §§RG2.1.5, RG2.2.4 (*division-algebra-building*, line 3615), RG2.3.3 (*parahoric-kottwitz-characterization*, line 4335), RG2.3.5, RG2.3.7 and RG2.4.3 (lines 2446–5992);
  - ModularCurves §0G and SchemeAndStackFoundations §§0.6, 1.15, 2.3 and 4.1–4.12.

**Declared gaps.**
- The 11 plan entries match README contracts by slug and supplier.
- Each is minimal:
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20 stops at finite K/ℚ_p;
  - PadicHodgeTheory §5.5 stops at K/ℚ̆_p finite;
  - neither ReductiveGroupsPartII nor SchemeAndStackFoundations on main contains Anschütz purity, punctured-spectrum patching or tensor cutting.
- The sources of the precise ones were checked: Anschuetz22 Proposition 10.3, p.33, line 1388; KP18 (3.2.7)–(3.2.8), p.172, lines 2127–2135; Wintenberger97 §0 and Proposition 4.5.3.
- `full-fixer-cutting-tensors` is R02, and the four GeometricSatakeAndFusion contracts are R01.

**Ownership against open pull requests.**
- **J_b (§2.0)** is also constructed in EndoscopicTransferAndUnitaryTraceComparison §7.5 (#999, merge order 148) and in BunGAndNewtonStrata (#1241, 188). This roadmap (131) is the earlier owner, so those roadmaps owe the citation of §2.0; nothing changes here.
- **GeometricSatakeAndFusionPartII** (#1836, 3ef4ea3, order 207) still states the good-embedding definition (line 311) and the four local-model theorems (lines 478, 573, 846, 856).
  - Here §2.1 owns KPZ26 Definition 3.4.4 at the earlier position, and the theorems are contracted to GeometricSatakeAndFusion (R01).
  - The citations must come from #1836.
- `scratch/overlaps.md`: no pull request changes this roadmap, no cited id is dropped, and no cited id exists only in an open revision.
- DiamondsAndVStacksPartII cites the same §R07.2.27 name; it is a consumer, not a second owner.

## Not verifiable

- RZ96, Proposition 1.21 (§5.3) is settled as uncertified and was not read; §5.3 cites it through Kisin17 line 1455.
- Faltings [Fa 2], pp.114 and 119 (the t-inverted comparison of §5.5 and the constants identity of `gap:relative-crystalline-constants`) is not in the manifest. I checked these only as Kisin17 states them, at lines 460–462 and 475–476.
- Kisin's 2010 Proposition 1.3.2 and Deligne's mixed-tensor argument, proposed as the source in R02, were read only through Kisin17 footnote 7, lines 320–324.
- Kisin's 2010 §1.5, which the Errata E.1–E.4 correct, is not in the manifest; the errata themselves were read.
- Zhu17, vanHoften24, Zhou20, RG71 and deJong95 carry no sampled locator and were not reopened.

## Source issues

- **Misprint** in KPZ26 at Remark 5.3.8, p.56: the source says part (b) means that if the embedding is good at x then the diagonal is very good; it should be "very good at x" in the hypothesis, as in Lemma 5.3.7(b); affects nothing.
- **Misprint** in Kisin17 at proof of Proposition 1.1.13, p.10: the source writes σ(c) as b times υ₀(E(0))⁻¹; it should be b·υ₀(σ(E(0)))⁻¹, since E(0) need not be σ-fixed; affects nothing.
- **Misprint** in KPZ26 at §5.1.2, p.48: for a general frame (S,I,φ,φ₁) the source calls the tilde module the free Ŵ(R)-module of rank n; it should be the free S-module, the target category of τ_ℱ; affects nothing.
