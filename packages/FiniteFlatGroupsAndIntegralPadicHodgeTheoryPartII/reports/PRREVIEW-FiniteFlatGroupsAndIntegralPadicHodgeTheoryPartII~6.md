# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at a5ccea4)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder is unchanged since then. The two P2 findings of the previous review are not repaired and are raised again (R01, R02). Two findings are new: the complete-local display theory of Layer 0 is restricted to odd primes although its cited source proves it at p=2 (R03, P2), and 61 *Needs:* section titles lowercase proper names and acronyms (R04, P3). The gate, the build, the dependency check, all 15 sampled locators and every cross-roadmap citation pass.

## R01 (P2) — Definition 3.4.4 and the four local-model theorems still have two owners

Re-raised: H01

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md`:
- line 15: "GeometricSatakeAndFusionPartII §§2.4, 3.1, 4.10 and 4.11 states the same four theorems as its own targets, and none of them is planned here";
- lines 102–108: the four contracts "What GeometricSatakeAndFusion must provide (gap:…)";
- line 588 (§2.1), which states KPZ26 Definition 3.4.4 as this roadmap's own.

**Claim.** Five objects have two owners. KPZ26 Theorems 3.2.15, 3.3.25, 4.1.6 and 4.4.3 are requested from GeometricSatakeAndFusion, and GeometricSatakeAndFusionPartII also states them as its own targets. KPZ26 Definition 3.4.4 is stated both in §2.1 here and in GeometricSatakeAndFusionPartII §0.6.

**Witness.** `TauCetiRoadmap/GeometricSatakeAndFusionPartII/README.md` at 3ef4ea3 (the head of #1836, unchanged): §0.6 line 309, §2.4 line 476 (Theorem 3.3.25), §3.1 line 571 (Theorem 3.2.15), §4.10 line 844 (Theorem 4.1.6), §4.11 line 854 (Theorem 4.4.3). `merge-order/ORDER.txt` puts GeometricSatakeAndFusion at line 128, this roadmap at 129 and GeometricSatakeAndFusionPartII at 204.

**Why the reason in H01 does not settle it.** H01 accepts that the double ownership is real and leaves the fix to a merge-order decision. I reran the dependency check on b259844's README, which cites GeometricSatakeAndFusionPartII §§0.6, 2.4, 3.1, 4.10 and 4.11:
- without `--movable` it reports `UPWARD: … (#129) -> GeometricSatakeAndFusionPartII (#204) at README lines [102, 610, 652, 828, 946, 966]`;
- with `--movable` it reports `moved: … from #129 to #204 … (the worker moves it there when it submits)` and 0 problems.

Under the review rules a `moved:` line is not a defect. If the push gate nevertheless blocks the push, that is the operator decision this re-raise hands to a human. Either way, the head carries two owners.

**Repair.** Choose one of two branches.
1. Move this roadmap right after GeometricSatakeAndFusionPartII. Restore b259844's citations of its §§0.6, 2.4, 3.1, 4.10 and 4.11 in place of the four slugs, and keep lines 15 and 100 for GeometricSatakeAndFusion §§0.31, 0.37, 4.17 and 4.18. Tested: the README then uses exactly the plan's 11 slugs, and the dependency check with `--movable` reports 0 problems.
2. Keep the order. GeometricSatakeAndFusionPartII (#1836) then cites this roadmap's §2.1 for Definition 3.4.4 (§2.1 is earlier in the order), and cites GeometricSatakeAndFusion for the four theorems once those contracts are declared (R02).

## R02 (P2) — The four GeometricSatakeAndFusion contracts are not declared in the plan's gaps

Re-raised: H02

**Location.** README lines 102, 104, 106 and 108; `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** The README uses 15 distinct `gap:` slugs and the plan declares 11. The intake will not announce the four GeometricSatakeAndFusion contracts. These targets therefore rest on contracts that no intake reads: §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2, and the Layer 3 Dependencies (line 1048).

**Witness.** Mentions at this head:

| Slug | Mentions in the README |
|---|---|
| `gap:scheme-local-model-representative` | 12 |
| `gap:scheme-local-model-hodge-immersion` | 11 |
| `gap:schubert-curve-spanned-tangents` | 4 |
| `gap:local-model-curve-spanned-tangents` | 4 |

The plan's 11 entries name only these suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicPeriodRings, SchemeAndStackFoundations (3 entries), ReductiveGroupsPartII (4), ShimuraVarieties and PadicHodgeTheory.

**Why the reason in H02 does not settle it.** H02 ties this mismatch to the H01 decision. The review rules, however, let the package add gaps to the plan's top-level `gaps` list without any operator step. Declaring the four contracts makes the present head consistent under the present order. If branch 1 of R01 is later chosen, the four entries go together with the four contracts.

**Repair.** Add four `gaps` entries to the plan, each with supplier GeometricSatakeAndFusion and the `needs` text of README lines 102, 104, 106 and 108:
- section §4.17 for `scheme-local-model-representative` and `scheme-local-model-hodge-immersion`;
- section §0.37 for the two tangent-span slugs, or §4.17 if the supplier prefers.

The README and the plan then agree at 15 slugs.

## R03 (P2) — The complete-local display theory is limited to odd p although its cited source proves it at p=2

**Location.** README line 26: "Assume p>2 throughout, except in §§0.2 and 0.5 … not the odd-prime complete-local Zink-ring constructions of §§0.1 and 0.13". The same restriction appears at line 138 (§0.1, "characteristic p>2") and line 389 (§0.13, "perfect residue field of characteristic p>2"). Line 7 claims ownership of "the anti-equivalence of §0.13 for all p-divisible groups".

**Claim.** §0.13 is a headline: the anti-equivalence between p-divisible groups and Dieudonné displays over complete Noetherian local rings with perfect residue field. Its source proves it at every prime. The README states it only for p>2, and line 160 acknowledges Lau's p=2 extension and leaves it out. That is a good-primes-only restriction of a general-library theorem, which the planning principles exclude. Because this roadmap owns the Ŵ(R)-display theory, no roadmap owns the p=2 case. The restriction comes from the route: KPZ26 §5.1 and Hoff23 (line 305, "p not equal to 2") need p>2. The theorem does not.

**Witness.**
- Lau14 lines 23–26 extend the theory to p=2 "without restriction".
- Lau14 lines 227–237 define u₀ and the modified Verschiebung v(x)=V(u₀x), and Lemma 1.7 shows that Ŵ(R) is stable under v.
- Lau14 Corollary 5.5 (line 1741, p.2244) holds for every admissible topological ring. Example: R=ℤ₂ and H=`μ_{2^∞}`.
- Lau14 line 672: at p=2 the Dieudonné frame has θ=2u₀=2−[4], not θ=p.

**Repair.**
- Widen §0.3 from the θ=p class to Lau's frames with a frame constant θ, where φ|I=θφ₁.
- State §§0.1, 0.4, 0.7 and 0.11–0.13 for every prime, using Lau's modified Verschiebung at p=2 (Lau14 lines 227–237, Lemma 2.5 at line 661, Theorem A, Corollaries 5.5–5.6). Keep p>2 from Layer 1 on, where KPZ26 and Hoff23 need it, and rewrite Conventions line 26 to match.
- Add the Check: over ℤ₂, D̂(`μ_{2^∞}`) has M₁=M and rank(M₁/ÎM)=1, and over 𝔽₂ it reduces to §0.5's (F,V)=(2,1).

## R04 (P3) — *Needs:* section titles lowercase proper names and acronyms

**Location.** Examples: line 1038 "§3.14 (very-good dᴴ pel representations)" (heading: "Very-good Dᴴ PEL representations"); line 281 "§0.4 (logarithmic witt coordinates on a pd kernel)"; line 1211 "§4.7 (hoff’s infinitesimal compatibility condition)"; lines 200, 221, 435 and 499 "§0.1 (zink coefficient ring)".

**Claim.** 61 of the 197 parenthesized section titles in *Needs:* lines lowercase a proper name or acronym: Zink, Dieudonné, Frobenius, Breuil–Kisin, Hodge, Witt, Tate, Galois, Kottwitz, Levi, Hoff, DVR, PD, PEL, Dᴴ, type A. "dᴴ pel" and "dvr" do not read as the objects they name. The same title is also spelled two ways: "§5.10 (horizontal fil⁰ deformation locus)" on line 1403 and "Fil⁰" on line 1412.

**Witness.** On the content repository's main branch, 0 of 434 *Needs:* parentheticals lowercase such a name (for example "§2.2 (Kadison, norm detection)").

**Repair.** Replace each parenthetical with its heading text, keeping the heading's capitalization (for example "§3.14 (Very-good Dᴴ PEL representations)"), or drop the parentheticals.

## Previous findings

- R01: not repaired. Line 15 still says GeometricSatakeAndFusionPartII "states the same four theorems as its own targets", and lines 102–108 keep the four contracts. Raised again above.
- R02: not repaired. The README has 15 distinct `gap:` slugs and `design/plan.json` has 11 `gaps`. Raised again above.

## Verified sound

**Gate, build and form.**
- Push gate rerun at a5ccea4: `OK`, every counter 0. The counters are set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder and source-material. The worker's run with the build also reports build=0.
- `lake env lean TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output.
- The file has `module`, one `public import Mathlib`, the module docstring and an empty namespace. 15 Suggested.lean files on main use the same module header. There is no declaration, so there is nothing to `#check`, no section variable to lose and nothing to probe for padding.
- The outside-folder diff against origin/main is empty, and the folder holds README.md, Suggested.lean and metadata.toml.
- Dependency check with `--movable`, full output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Headline theorems.** The docstring names 21 headline groups and the missing carrier for each. I searched both pins:

| Search term | Tau Ceti | Mathlib |
|---|---|---|
| Parahoric, Kottwitz, AdmissibleSet, Iwahori–Weyl, σ-conjugacy | 0 files | 0 files |
| p-divisible / Barsotti–Tate | 0 files | only prose in `RingTheory/Perfectoid` |
| Grassmannian scheme | none | none |

What the pins do have:
- `TauCeti.AlgebraicGeometry.FiniteFlatCommGroupScheme` (`TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:52`);
- `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean:66`: a submodule with finite projective quotient of constant `rankAtStalk`) and its `functor` (line 185);
- `WittVector.Isocrystal` (`Isocrystal.lean:113`).

So no headline is statable without a stand-in, and the empty file is correct. The scheme `Module.Grassmannian.scheme` that ModularCurves §0G on main attributes to Tau Ceti is absent at this pin, which matches the README's "Representability … is not at the pin".

**Seeded sample (15 targets): every locator checked at the text.**
- §0.6: KPZ26 §5.1.2, lines 2101–2107, p.48. Pairs with M=L⊕T and M₁=L⊕IT, ranks d and n−d.
- §0.10: KPZ26 §5.1.7, lines 2157–2168, p.49. ẽᵢ↦φ*eᵢ for i≤d and ẽᵢ↦pφ*eᵢ otherwise; injective with image φ*L⊕pφ*T for p-torsion-free S.
- §1.2: KPZ26 §5.1.8 and Lemma 5.1.9, lines 2174–2184, p.50.
- §1.3: KPZ26 Lemma 5.1.11 (line 2196), Lemma 5.1.15 (line 2227), Remark 5.1.17 (lines 2239–2244) and (5.1.18) (line 2275), pp.50–52.
- §1.6: KP18 Lemma 3.2.13, lines 2205–2216, p.174.
- §2.4: KP18 Lemma 3.2.6, lines 2107–2138, pp.171–172, including the scalar hypothesis at line 2119, which §2.1 keeps ("taken with the scalars"). Also Hoff23 Lemma 2.7 (line 857, p.18) and Anschuetz22 Proposition 10.3 (line 1388, p.33).
- §2.11: KPZ26 Lemma 5.2.3, line 2341, p.54.
- §3.4: KPZ26 Lemma 5.3.9, lines 2444–2453, p.56. The source is stated for very-good-everywhere. The README's pointwise form follows because R_{G_i}/a_{G_i} injects into R_G/a_G.
- §3.15: KPZ26 §6.3.4 and Corollary 6.3.5, lines 3112–3146, p.71 (see Source issues).
- §3.17: KPZ26 §6.2.8 and Corollary 6.2.10, lines 3040–3080, pp.69–70.
- §4.6: KZ25 proof of Proposition 3.2.7, lines 1055–1063, p.24 ("such a section exists by assumption (C)").
- §4.12: KZ25 Proposition 3.2.7, lines 1046–1049. (A)–(C) appear at KZ25 lines 1011–1019. KPZ26 lines 3177–3179 confirm the README's remark about KPZ26's different (A)–(C).
- §4.13: Hoff23 Construction 2.27 (line 1177, p.24), Lemma 2.35 (lines 1338–1345) and Theorem 2.36 (line 1346, pp.28–29); the reduction to reduced p-torsion-free rings is at lines 1371–1372.
- §5.2: Kisin17 §1.1.15, lines 447–454, p.10.
- §6.4: KZ25 Theorem 3.4.5, line 1189, pp.27–28. §3.4.1 (line 1121) assumes only (A), (B) and 𝒢=𝒢̃, which confirms "no very-goodness".

Also checked:
- §0.2: Lau14 Theorem A, lines 71–77 (Gabber, perfect rings), and Theorem 5.3 (line 1730, p.2243).
- §0.13: Lau14 Corollaries 5.5–5.6, lines 1741–1747, p.2244.
- §3.13: KPZ26 Theorem 6.1.1, lines 2710–2729, hypothesis for hypothesis.
- §5.7: Kisin17 lines 433–446, where c=σ⁻¹(b)μ₀(E(0)) exactly as in the README.

**Library declarations opened at the pin.**
- `Mathlib/RingTheory/WittVector/Defs.lean:52` `WittVector`
- `Mathlib/RingTheory/WittVector/Frobenius.lean:218` `frobenius`, `:283` `frobeniusEquiv` (`[PerfectRing R p]`)
- `Mathlib/RingTheory/WittVector/Verschiebung.lean:109` `verschiebung` (additive)
- `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` `Isocrystal`
- `Mathlib/RingTheory/DividedPowers/Basic.lean:77` `DividedPowers`, `:200` `dpow_smul`
- `Mathlib/RingTheory/Grassmannian.lean:66, 185`
- `Mathlib/RingTheory/Filtration.lean:415` `Ideal.iInf_pow_smul_eq_bot_of_le_jacobson` (Noetherian, `Module.Finite`, `I ≤ jacobson ⊥`)
- `Mathlib/RingTheory/Localization/Ideal.lean:76` `IsLocalization.algebraMap_mem_map_algebraMap_iff`
- `TauCeti/AlgebraicGeometry/GroupScheme/FiniteFlat.lean:52`

**Cross-roadmap citations resolved (58 ids), each at its current head or on main.**
- FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879 (9856719): §§R07.1.1, 1.6, 1.7, 1.8, 1.22, 2.10, 2.11, 2.12, 2.27, 3.2, 3.3, 4.1, 4.13, 4.16, 4.17, 4.20 ("every finite K/ℚ_p", so the BT-realization gap is not supplied), 4.21 and 4.25, plus `deJongBoundedFormalFunctions` (line 4202, de Jong Theorem 7.4.1).
- PrismaticCohomologyPartIII §6.0 at #1070: its bold target "Perfect-base Dieudonné comparison" (line 107), whose Checks (lines 119–120) give M(ℤ/pʳ) with F=p·Frob and M(μ_(pʳ)) with F=Frob.
- AbelianSchemesAndArithmeticModuli at #849: §A4.CR.7.2 (line 2126) and §A4.10 (line 2361).
- CrystallineCohomology at #857: §CR.7.1 (line 11243) and Layer CR.1 (line 602).
- DerivedDeRhamCohomology at #868: §PD.7 (line 2852), with `Crystalline.fontaineEnvelope_initial` and `…_periodPDEnvelope` at lines 2883 and 2886. These are the two names `roadmaps resolve` flagged as leads; they resolve.
- PadicPeriodRings at #940: §3 (line 390), §4.1 (line 417) and §4.3 (line 470, absolute only).
- GeometricSatakeAndFusion at #1235 (140b5a7): §0.31 (line 847), §0.37 (line 972), §4.17 (line 2129, "no minuscule or tame-ramification hypothesis") and §4.18 (line 2151).
- VectorBundlesAndIsocrystals at #1205: the subsection "Finite isocrystals over the completed maximal unramified coefficient field" (line 213, in Layer 1) and "Integral group torsors and Frobenius" (line 2024, in Layer 6; G-torsors on a ℤ_p-scheme equal exact tensor functors, for connected fibres).
- PadicHodgeTheory §5.5 at #1062: line 1071, with K/ℚ̆_p finite at line 1112, so the period-torsor gap is not supplied.
- ShimuraVarieties §7.0i at #933 (line 2014) and PELModuli §M2.15 at #966 (line 2607).
- On main:
  - SchemeAndStackFoundations §§0.6, 1.15, 2.3, 4.1–4.4, 4.7, 4.8 and 4.12. §4.12 has only global Raynaud–Gruson flattening (line 5618), so the local-flattening gap is not supplied.
  - ModularCurves §0G (line 901).
  - ReductiveGroupsPartII §§RG2.1.5, RG2.2.4 (with *division-algebra-building* at line 3615), RG2.3.3 (with *parahoric-kottwitz-characterization* at line 4335), RG2.3.5, RG2.3.7 and RG2.4.3. RG2.4.3 defines t^λ as the inverse image of −λ (representative λ(ϖ)⁻¹), as the Layer 6 adapter assumes.
- Open revisions: #1276, #1656, #1807, #1808 and #1854 keep every cited SchemeAndStackFoundations heading. #1808 (draft) keeps the ModularCurves §0G heading but moves the relative Grassmannian to SchemeAndStackFoundations §0.3a. The citations here correctly follow main, and should be repointed if #1808 merges.

**Ownership against open pull requests.**
- GeometricSatakeAndFusionPartII: see R01.
- J_b (§2.0): no earlier roadmap builds it (searched PadicHodgeTheory, VectorBundlesAndIsocrystals, GeometricSatakeAndFusion and ReductiveGroupsPartII). BunGAndNewtonStrata §1.13 (#1241, order 186) and EndoscopicTransferAndUnitaryTraceComparison §7.5 (#999, order 146) build it later. This roadmap (order 129) is the owner, and those two should cite §2.0; no change here.
- σ-straight normalization (§6.0): HeckeStacksAndLocalShtukasPartII (#1844) consumes σ-straight representatives from BunGAndNewtonStrata §1.10 (order 186). No earlier owner exists, so §6.0 owns it.
- AdmissiblePairsAndPadicHodgeStructures (#1511, cb12b64) owns only the non-reductive extensions.
- The 63 "Zink" mentions in CrystallineCohomology are Langer–Zink de Rham–Witt complexes, a different object.

**Declared gaps.**
- The plan's 11 gaps match the README contracts. Nine have identical text; `relative-crystalline-constants` and `perfect-residue-period-torsor-comparison` differ only in wording.
- None is already supplied:
  - SchemeAndStackFoundations on main has no Beauville–Laszlo gluing, no joint-injectivity statement and no local henselian flattening functor.
  - ReductiveGroupsPartII has no purity statement.
  - PadicPeriodRings §4.3 is absolute only.
  - PadicHodgeTheory §5.5 covers only K/ℚ̆_p finite.
  - Part I §R07.4.20 covers only finite K/ℚ_p.
- Each gap is precise and names its supplier and section. The four undeclared contracts are R02.

**Adversarial table.** All values below were computed at this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 pairs | M=S², M₁=Se₁⊕Ie₂; d=0, d=h; S=0 | d=0: L=0, so M₁=IT=IM≠0. d=h: M₁=M. The map e₁↦e₂ has lower-left entry 1∉I, so f(e₁)=e₂∉M₁. S=0: M/M₁=0 | holds | none |
| §0.10 j | d=0, d=h; S=W(k) in rank 1 | j=diag(1,p): p and 1. φ(I)S=pφ₁(I)S=pS, so image(φ*M₁)=φ*L⊕pφ*T. Over W(k)⊗k, j=0 on k≠0 | holds | none |
| §1.2 | I=I′; D_{k[ε]}→D_{k[ε]/k} | The blocks [[φA,pφB],[φ₁C,φD]] are unchanged since φ₁′∣I=φ₁; φ₁′([ε])=0 | holds | none |
| §1.3 c | Z=0; Z=Vε; after ⊗𝔽_p | c=[[1,0],[V⁻¹Z̄,1]] gives 1, then lower-left ε. diag(1,p)⊗𝔽_p=diag(1,0) kills e₂, so the square loses the lower-left block | holds | none |
| §1.6 | E₁₁ on the ordinary H₀; identity | The section s+Σₘ(Φ^{m+1}sΦ₀^{−m−1}−Φ^m sΦ₀^{−m}) fixes a φ-invariant t with s(t)=t̃ | holds | none |
| §2.4 lattice | split GL₂; Fil¹=0; Fil¹ full | F=𝔖e₁⊕E𝔖e₂; E(D⊗𝔖); D⊗𝔖. KP18's scalar hypothesis (line 2119) is retained by §2.1 | holds | none |
| §2.5 unit | K=ℚ_p, π=p, E=u−p | φ(E([p]))=[p]^p−p. The log coordinates of [p^p]/p are p^{p^{n+1}−1−n}∈pℤ_p, so [p^p]=py with y∈Ŵ(pℤ_p), and φ(E([p]))=p(y−1) where y−1 maps to −1 in W(k) | holds | none |
| §2.6 joint injectivity | R_G normal; s with ξ(s)=0 for all ξ | s/pⁿ takes values in O_K for every n, so s/pⁿ∈R_G by the de Jong contract, so s∈∩pⁿR_G=0. The route needs no point-detection gap | holds | none |
| §2.11 | diagonal torus cut by E₁₁; t=E₂₂ | E₂₂=id−E₁₁ is a difference of horizontal tensors | holds | none |
| §3.4 | G_m×G_m on ℤ₃²; r=1 | The product local model is a point; c=1⊕1. R_{G_i}/a_i=k⊕cot_i injects into R_G/a_G=k⊕⊕cot_i | holds | none |
| §3.15 | D=K, m=1, ξ=(1,−1); m=2, (1,diag(1,2)); Λ_i=p⁻ⁱℤ_pe | ψ((1,0),(0,1))=−1, and the reverse is 1. ψ′=f₁w₁+2f₂w₂−v₁g₁−2v₂g₂ is not a multiple of ψ. Λ_i⊕Λ_{−i}^♯=p⁻ⁱℤ_p², whose dual is p^iℤ_p² (index −i). At i=0,1, ℤ_p² and p⁻¹ℤ_pe⊕pℤ_pf are incomparable | holds | none |
| §3.16 tame duality | L=ℚ_p(π), π²=p, δ=2π, M=πO_Le⊕O_Lf | M^Γ=pℤ_pe⊕ℤ_pf with dual ℤ_pe⊕p⁻¹ℤ_pf. δ⁻¹M^♯=π⁻¹O_Le⊕π⁻²O_Lf, with Γ-invariants ℤ_pe⊕p⁻¹ℤ_pf. Without δ⁻¹: ℤ_pe⊕ℤ_pf | holds | none |
| §3.17 | V₀=K², diag(a,b); (1,g) with g noncentral | S₀(ae₁,be₂)=ab; h(v,gw)≠c·h(v,w) | holds | none |
| §3.14 Trd | (−1,3)_ℚ₃ is division since (−1/3)=−1 | i⊗1 and 1⊗i each give Trd(i·i)=Trd(−1)=−2. With φ₀'s arguments reversed: +2 and −2 | holds | none |
| §4.6 | empty tensors; E₁₁ | Ψ₀c⁻¹ lies in the reduced 𝒢-torsor iff c preserves the cutting tensors (assumption C) | holds | none |
| §4.12 versal | GL₂ with h=2, d=1, empty tensors; torus cut by E₁₁ | Empty: R_G=R_E=O_Ĕ[[t]] and every ξ is adapted. Torus: R_G=O_Ĕ, and ξ factors iff t↦0 iff the Hodge line is Ke₁ iff E₁₁∈Fil⁰ | holds | none |
| §4.13 | GL₂ over k[ε] | The reduced lift O_Ĕ[[t]]→k[ε] sends t↦ε; every map k[ε]→O_K kills ε | holds | none |
| §5.2 | R=W(k); x=[p♭]−p | θ(φx)=pᵖ−p≠0. φ(x)=xᵖ+py, and xᵖ=p!γ_p(x)∈pA_cris | holds | none |
| §5.7 c | E(0)=ap with a≠1 | The residual Frobenius is cμ₀⁻¹(E(0))=σ⁻¹(b), and its φ-pullback is bσ. With μ₀(p) instead, the residual becomes σ⁻¹(b)μ₀(a⁻¹) | holds | none |
| §5.10 Check | R=W[[t]], F=(1+tE₂₁)diag(p,1) | 1+n(t)=t^{p−1}n(tᵖ) with n=−Σt^{pʳ−1}. h′=−n gives h=Σt^{pʳ}/pʳ. [N(0),E₁₁]=−E₂₁ | holds | none |
| §5.17 Check | G_m, b=3, μ=z^{∓1} | μ⁻¹=z: t_H=t_N=1, and κ(b)−1=0. μ⁻¹=z⁻¹: t_H=−1≠1 | holds | none |
| §5.18 | G_m, g=p | The crystal lattice is pW, and κ(p)=1 at both ends | holds | none |
| §6.0 | G_m, μ=1; GL₂, μ=(1,0) | t_here¹=p with κ=ν=1; t_RG¹=p⁻¹ fails p⁻¹W⊂W. diag(p,1) has length 1 and slopes (1,0) | holds | none |
| §6.4 and §6.5 | H₀=`μ_{p∞}`⊕ℚ_p/ℤ_p, E=u−p | c_E=pE/E(0)=−E(u), and c_E(0)=p. J_b=(ℚ_p^×)²; p acts by an isogeny of height 2 | holds | none |
| §2.0 J_b | b=[[0,1],[p,0]]; uTu⁻¹ | Over F̄_p, J_b(ℚ_p)=D^×. u·diag(x,y)·u⁻¹=[[x,a(y−x)],[0,y]]; entrywise σ gives −σ(a)≠−a | holds | none |
| Conventions | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | (gh)ᵗ=[[2,1],[1,1]] and (hg)ᵗ=[[1,1],[1,2]] | holds | none |
| Mathlib contract, line 44 | B=ℤ₃[[T]], I=(3) | B/I=𝔽₃[[T]] with ∩Tⁿ=0, so ∩(I+TⁿB)=I. Since 3·B[1/3]=B[1/3], the contraction is B | holds | none |
| R01 ownership | GeometricSatakeAndFusionPartII at 3ef4ea3, lines 309/476/571/844/854; ORDER lines 128/129/204 | 5 objects have 2 owners. b259844 variant: UPWARD without `--movable`, `moved:` and 0 problems with it | defect | R01 |
| R02 declaration | plan slugs against README slugs | 11 against 15; the 4 missing slugs have 12, 11, 4 and 4 mentions | defect | R02 |
| R03 p=2 | R=ℤ₂, H=`μ_{2^∞}` | Covered by Lau14 Corollary 5.5 (line 1741). Excluded by README lines 26, 138 and 389. Frame constant θ=2−[4] (Lau14 line 672) | defect | R03 |
| §0.2 and §0.5 at p=2 | 𝔽₂; F=4 on ℤ₂; R=𝔽_p×𝔽_p | (F,V)=(2,1) and (1,2). F=4 needs V=1/2. Ranks (1,0) | holds | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3. The manifest records it as `uncertified`; §5.3 cites it through Kisin17's proof of Theorem 2.2.3 (Kisin17 line 1455), which I read. I did not read RZ96 itself.
- I did not reopen Zhu17, vanHoften24, Zhou20, Wintenberger97, RG71 or deJong95 this round. None of them carries a sampled locator, and their locators were checked against the cached texts in earlier rounds.

## Source issues

- **Error** in KPZ26 at proof of Corollary 6.3.5, p.71 (KPZ26 lines 3139–3140): the source makes each paired lattice Λ_i⊕Λ̄_i self-dual and calls the family a lattice chain; it should pair Λ_i with the dual of Λ_{−i}, so the chain is self-dual with the dual of index i at index −i; affects the proof.
- **Misprint** in Kisin17 at proof of Proposition 1.1.13, p.10 (Kisin17 line 440): the source writes σ(c) as b times the inverse of υ₀(E(0)); it should be υ₀(σ(E(0)))⁻¹, since E(0)∈W need not be σ-fixed; affects nothing, as both are b times an element of G(W).
