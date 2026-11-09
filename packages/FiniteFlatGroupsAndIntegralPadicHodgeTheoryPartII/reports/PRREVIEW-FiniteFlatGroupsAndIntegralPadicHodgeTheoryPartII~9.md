# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 02d485d)

**Verdict:** needs changes

This is an incremental re-review. It covers the 41 README lines changed since 930a1af, and the text that cites them or that they cite.

Status of the previous findings:
- R03 is repaired.
- R02 is repaired in the README, but not in the plan.
- R01 and R04 are not repaired.

Every remaining blocking item is the same edit, a human edit of `plan.json`: the repair job can only remove plan entries (H01). The two P3 findings are small text corrections.

## R01 (P2) — The plan's `gaps` do not match the README's contracts: four slugs are missing and two `needs` sentences are stale

Re-raised: H01

**Location.**
- README lines 102, 104, 106 and 108: the four "What GeometricSatakeAndFusion must provide (gap:…)" contracts.
- README line 88 (gap:full-fixer-cutting-tensors) and line 94 (gap:ordinary-levi-full-fixer).
- `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.**
- The README states 15 contracts (`grep -c 'must provide (gap:'` gives 15). The plan declares 11, none with supplier GeometricSatakeAndFusion. The intake therefore never announces the four local-model contracts on GeometricSatakeAndFusion's job. Those contracts are prerequisites of §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2.
- This head rewrites two declared contracts in the README only. The plan's `needs` for `full-fixer-cutting-tensors` is still the vague sentence that R02 of the previous review replaced. The plan's `needs` for `ordinary-levi-full-fixer` is still the context-dependent one ("Under the ordinary σ-straight normalization … the Newton-Levi model …").
- The supplier would therefore be asked for something other than what the README states.

**Witness.** The plan's `full-fixer-cutting-tensors` entry reads "For the specified smooth affine full fixer models, provide finite scheme-theoretically cutting mixed tensor families … the ordinary-Levi intersection is the separate contract below". README line 88 reads "For a mixed-characteristic discrete valuation ring O, a finite free O-module Λ and a closed O-flat subgroup scheme 𝒢⊂GL(Λ) …".

**Why H01 does not settle it.** H01 (at 02d485d) is right that this job may only remove plan entries. It says the exact entries are in a "Plan edits for a human" section below, but the posted reply has no such section. The defect persists until the plan changes. Editing the plan is a human action, so this is re-raised for parking.

**Repair (a human edit of `plan.json`).**

| Slug | Supplier | Section | `needs` |
|---|---|---|---|
| `scheme-local-model-representative` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 102 |
| `scheme-local-model-hodge-immersion` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 104 |
| `schubert-curve-spanned-tangents` | GeometricSatakeAndFusion | 0.29 | the sentence after the colon of README line 106 |
| `local-model-curve-spanned-tangents` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 108 |
| `full-fixer-cutting-tensors` (replace `needs`) | ReductiveGroupsPartII | RG2.3.5 | the sentence after the colon of README line 88 |
| `ordinary-levi-full-fixer` (replace `needs`) | ReductiveGroupsPartII | RG2.3.3 | the sentence after the colon of README line 94 |

**Tested.**
- The plan's slug set then equals the README's 15.
- Each of the six sentences states its base, objects and hypotheses without pointing at another contract. Line 108 no longer says "above" or "previous contract".
- `review.json` already lists all four GeometricSatakeAndFusion slugs under `conditional_gaps`.

## R02 (P3) — Two locator statements around the rewritten contracts are inexact

**Location.**
- README line 108: "(KPZ26, Standard assumptions 3.1.5, Definition 4.1.4, Lemma 4.4.2 and Theorem 4.4.3, pp.16, 31 and 46–47; KPZ26 lines 717–720, 1347–1349, 1754, 2002–2006 and 2049–2055)".
- README line 96: "The ordinary-Levi assertion has precisely the hypotheses of KZ25 §3.4.2, pp.26–27; KZ25 lines 1152–1165."

**Claim.**
- KPZ26 line 1754 is the last sentence of Theorem 4.3.2, on p.40. Neither that theorem nor that page is in the parenthesis.
- The rewritten line 94 drops two hypotheses of KZ25 §3.4.2: the μ-ordinary class [b]_μ∈B(G,{μ_y}), and the condition t=t_μ′ with μ′∈W₀·μ (KZ25 lines 1146–1150). It is right to drop them, because the Levi argument at lines 1152–1165 uses neither. But "precisely the hypotheses" is now false.
- Lines 1152–1165 all lie on p.26: the page markers are at line 1123 (p.26) and line 1166 (p.27).

**Witness.** KPZ26 page markers at lines 1729 (p.40) and 1767 (p.41) bracket line 1754. KZ25 line 1146 assumes "the existence of [b]_μ∈B(G,{μ_y})", which README line 94 does not assume.

**Repair.**
- In line 108, change the parenthesis to "(KPZ26, Standard assumptions 3.1.5, Definition 4.1.4, Theorem 4.3.2, Lemma 4.4.2 and Theorem 4.4.3, pp.16, 31, 40 and 46–47; …)".
- In line 96, replace the sentence with: "The ordinary-Levi assertion is the Levi step of KZ25 §3.4.2, p.26; KZ25 lines 1152–1165. Its argument uses only that ker(π₁(M)_I→π₁(G)_I) is torsion-free and that the full fixer equals its parahoric; it does not use the μ-ordinary class that §3.4.2 also assumes."

Tested on the instance in the adversarial table: G=PGL₂ with x an edge midpoint and t=1. That instance shows the parahoric hypothesis is needed. No μ-ordinary hypothesis enters.

## R03 (P3) — The pull-request description still says p>2 for Layer 0 and "Fourteen" contracts

Re-raised: H05

**Location.** The roadmap-summary block of the description: "Over complete Noetherian local rings with perfect residue field and p>2, it constructs the Zink ring Ŵ(R), p-frames …". The description body: "Fourteen supplier extensions … are stated as exact contracts".

**Claim.** Both facts are wrong:
- README line 26 states Layer 0 at every prime, with frame constant θ=2−[4] at p=2.
- The README states 15 contracts.

A human gives final approval with this description in front of them.

**Witness.** README line 26: "Layer 0 holds for every prime p, including p=2". `grep -c 'must provide (gap:'` gives 15.

**Why H05 does not settle it.** H05 is right that the description is outside the repair job's files. The fix is the worker's or a human's edit of the description, which the parking for R01 brings about anyway.

**Repair.**
- Replace the summary's first sentence with: "Over complete Noetherian local rings with perfect residue field and at every prime (p>2 from Layer 1 on), it constructs the Zink ring Ŵ(R), frames with constant θ (p-frames for odd p), …".
- Change "Fourteen" to "Fifteen".

## Previous findings

- R01 — not repaired: README lines 102–108 still state four GeometricSatakeAndFusion contracts. `plan.json` still declares 11 gaps, none for GeometricSatakeAndFusion, because the repair job may only remove entries (H01). Raised again as R01.
- R02 — partly repaired: README line 88 now gives the precise sentence (mixed-characteristic DVR O, closed O-flat 𝒢⊂GL(Λ) with reductive generic fibre, ⊗/dual tensors, fixer 𝒢(R) for every O-algebra R). The `plan.json` entry keeps the old sentence. Carried in R01.
- R03 — repaired. §§0.6, 0.8, 0.9, 0.10 and 0.12 now say that KPZ26 and Hoff23 assume θ=p and p>2, and they add Lau14 §2A, lines 556–579; Lemma 2.3, lines 595–609; and lines 671–672. All of these were checked at the text.
- R04 — not repaired: the description still says "perfect residue field and p>2" and "Fourteen supplier extensions". Raised again as R03.

## Verified sound

**Gate, build and form (run at 02d485d).**
- My own run of the gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0).
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output (17.7 s).
- The dependency check with `--movable` prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: FiniteFlatGroupsAndIntegralPadicHodgeTheory 65, ShimuraVarieties 105, PadicHodgeTheory 122, GeometricSatakeAndFusion 130, this roadmap 131.
- The outside-folder diff against `origin/main` is empty. `git diff --name-only 930a1af HEAD` lists only README.md.
- `Suggested.lean` and the pins are therefore unchanged. The previous report's `#check` and padding results stand: the file has no declarations, and no headline is statable without a stand-in.

**Changed contracts, read at the cached texts.**
- **gap:full-fixer-cutting-tensors (line 88).**
  - Kisin17 footnote 7, p.7, lines 320–324: a mixed-characteristic DVR, a closed flat subgroup with reductive generic fibre, the pointwise stabilizer of elements of M^⊗; symmetric and exterior powers in Kisin's proof, Deligne's argument with ⊗ and duals.
  - P23 §3.2.1 and footnote 3, pp.15–16, lines 681–690: a finite list over ℤ_p, the scheme-theoretic stabilizer on every R.
  - KPZ26 §5.2, p.52, lines 2292–2297: the definition of "cut out" over O. KPZ26 line 2317, p.53, chooses such tensors.
  - Minimal: ReductiveGroupsPartII §RG2.3.5 on main (line 4664) has lattice-chain and Hodge-type fixer immersions but no tensor-cutting theorem. A roadmap grep for Kisin's 1.3.2 or a tensor stabilizer over a DVR finds only FlagVarieties §§11–12 (Chevalley over a field).
- **gap:ordinary-levi-full-fixer (line 94).**
  - KZ25 §§3.4.1–3.4.2, p.26, lines 1129–1165: S a maximal Q̆_p-split torus over ℚ_p with x in its apartment; 𝓜(Z̆_p):=M(Q̆_p)∩𝒢(Z̆_p) is parahoric and defined over ℤ_p; ker(π₁(M)_I→π₁(G)_I) is torsion-free, so 𝓜̃=𝓜 when 𝒢̃=𝒢.
  - The README's generalisation to any σ-straight translation t is supported by that argument (R02 concerns only the sentence on line 96).
  - Minimal: the ReductiveGroupsPartII Levi mentions (lines 57, 2377–2385, 4957) concern building embeddings and twisted Levis, not this intersection.
- **gap:local-model-curve-spanned-tangents (line 108).**
  - KPZ26 Standard assumptions 3.1.5, p.16, lines 717–720.
  - Definition 4.1.4, p.31, lines 1347–1349.
  - Theorem 4.3.2, last sentence, p.40, line 1754: the minimal element.
  - Lemma 4.4.2, p.46, lines 2002–2006: Mloc⊗k≅S_μ for a pair of mod p abelian type.
  - Theorem 4.4.3(1)–(2), p.47, lines 2049–2055.
  - The sentence is now self-contained, as the previous repair asked.

**Layer 0 locators (R03 repair).**
- Lau14 §2A, p.2214:
  - lines 551–552 (θ with φ=θφ₁ on I);
  - lines 556–559 (u-homomorphisms; strict means u=1);
  - lines 560–564 (normal decompositions);
  - line 568 (F=θF₁ on Q);
  - lines 571–579 (normal representation; base change Ψ′(s′⊗l)=uφ′(s′)⊗Ψ(l)).
- Lau14 Lemma 2.3, p.2215, lines 595–609: V♯=(1⊕θ)(Ψ♯)⁻¹; fully faithful when θ is not a zero divisor.
- Lau14 lines 671–672, p.2217: θ=2u₀=2−[4] for D_R at p=2.
- KPZ26 lines 2080–2081 (θ=p, p>2) and Hoff23 line 305 (p≠2), as now cited.

**Seeded sample, where it falls in the changed text.**
- §4.2:
  - KP18 Proposition 3.3.4, p.179, line 2398;
  - proof of Corollary 3.3.6, p.180, line 2430 (𝒢°(ℤ_p)=𝒢(ℤ_p)∩ker κ_G);
  - §4.1.7, p.184, line 2582 (tensors cutting out G_ℤ(p) by Kisin's Lemma 1.3.2), which is exactly what the new gap citation supplies.
- §5.15: vanHoften24 §3.1.5, p.27, line 1190 uses Kisin's Proposition 1.3.2 for the tensors, so the added gap:full-fixer-cutting-tensors prerequisite is correct. Kisin17 Proposition 1.3.9, p.21, line 953.

The other 13 sampled targets are untouched; the previous report covered them.

**Dependency additions.** All 11 mentions of gap:full-fixer-cutting-tensors are consistent:
- Layer 2's prerequisite is in the §2.1 *Needs* (line 611).
- Layer 3's is in the *Needs* lines at 984, 1005 and 1043.
- Layer 4's is in §4.2 (line 1076).
- Layer 5's is in §5.15 (line 1456).
- Layer 6's is in §6.1 (line 1569) and §6.6 (line 1633).

**Cross-roadmap citations resolved.**
- GeometricSatakeAndFusion (#1235, 140b5a7): §0.29 line 808, §0.31 line 848, §0.37 line 973, §4.17 line 2130, §4.18 line 2152.
- ReductiveGroupsPartII on main (3090489): §RG2.3.3 line 4151, §RG2.3.5 line 4664.
- `scratch/citations.md` lists two Lean-name leads (`Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_periodPDEnvelope`). These are in untouched text, and the previous report resolved them in DerivedDeRhamCohomology §PD.7.
- The changed text cites no Mathlib or Tau Ceti declaration. The previous report's four opened declarations are at unchanged pins.

**Ownership and overlaps.**
- `scratch/overlaps.md` reports that no open pull request changes this roadmap, that no cited id is dropped, and that no id exists only in an open revision.
- The two rewritten ReductiveGroupsPartII contracts are owned nowhere else (searches above).

**Adversarial table.** The rows for changed statements are computed at this head. Rows for untouched statements are carried from the previous report with its values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| gap:full-fixer-cutting-tensors | B⊂GL₂ over ℤ_p | W^B = weight-0 highest-weight vectors = W^{GL₂}, so any fixer ⊇ GL₂ | excluded by the reductive hypothesis | none |
| same | scalars G_m⊂GL(ℤ_p²) | family {E_ij}⊂Λ⊗Λ∨; g commuting with all E_ij over every R gives g scalar | cut out | none |
| same | SO(q), p odd, rank n | b∈Λ∨⊗Λ∨ plus Σsgn(σ)e∨_σ(1)⊗…⊗e∨_σ(n), on which g acts by det(g)⁻¹ | ⊗ and duals suffice | none |
| same | μ₂⊂GL₁ over ℤ_p; Λ=0 | e⊗e has weight 2, so the fixer is {g²=1}; GL(0)={1} is the fixer of ∅ | cut out | none |
| same | §4.2 dilatation in GL(Λ′) | closed, flat, generic fibre GL₂; diag(1,χ_cyc) mod p = diag(1,ζ) has 1^(p−1)=ζ^(p−1), so Γ_K acts through 𝒢(ℤ_p) | in scope | none |
| gap:ordinary-levi-full-fixer | GL₂, x hyperspecial, t=t^(1,0) | ν=(1,0), M=T, T(K₀)∩GL₂(W)=T(W)=𝒯(W); ker(ℤ²→ℤ)=ℤ(1,−1), free | holds | none |
| same, hypothesis 𝒢=𝒢° | PGL₂, x edge midpoint, t=1 so M=G | [[0,1],[p,0]] fixes x, κ=1∈ℤ/2, so the M-fixer is not 𝓜 | the hypothesis is needed and present | none |
| same, line 96 | KZ25 line 1146 vs README line 94 | [b]_μ and μ′∈W₀·μ are assumed in the source, absent in the README | "precisely" false | R02 |
| gap:local-model-curve-spanned-tangents | GL₂/ℤ_p, μ=(1,0) | Mloc⊗k=ℙ¹; dominant ν⪯(1,0) is only (1,0), so the minimal stratum is everything; smooth | holds | none |
| same | Res_{K/ℚ_p}GL₂, K ramified quadratic, μ′=(2,0) | minimal ν=(1,1), a point; the cone xy=z² has T=k³ and lines (1,0,0),(0,1,0),(1,1,1) on it span k³ | holds | none |
| same, hypothesis 𝒢≅Res ℋ | Iwahori chart x²+xyz (KPZ26 Remark 4.1.5(2)) | T₀=k³; f(f+gh)=0 forces f∈t²k[[t]], so the span is the plane x=0, of dimension 2 | excluded (Iwahori, not Res ℋ) | none |
| same, locator | KPZ26 line 1754 | page markers at 1729 (p.40) and 1767 (p.41) | p.40 missing | R02 |
| §0.8 formula at general θ | l=Al+Cl, t=Bt+Dt | F₁′(cl′)=φ₁(c)F′(l′) gives φ₁(C); F′(bl′)=φ(b)θF₁′(l′) gives θφ(B) | holds; Lau14 line 568 | none |
| §0.9 | D_(ℤ₂)→D_(𝔽₂) | [4]↦0 in W(𝔽₂), so θ↦2; strict, with u=1 in Lau14 line 579 | holds | none |
| §0.10 new Check | D_(ℤ₂) | w_n(2−[4])=2−4^(2ⁿ): −2, −14, −254, −65534; ℤ₂ is a domain and the ghost map is injective, so θ is a non-zero-divisor | holds | none |
| §0.10 vs Lau14 Lemma 2.3 | normal coordinates | V♯=(1⊕θ)(Ψ♯)⁻¹=j∘(Ψ♯)⁻¹; im j=φ*L⊕θφ*T=im(φ*M₁) because φ(I)S=θS | holds | none |
| §0.12 | R→R′ at p=2 | θ_R=2−[4]↦θ_R′=2−[4], so the map is strict | holds | none |
| §2.1 Borel Check | Λ⊗Λ∨, Λ^⊗2 | B-fixed endomorphisms are scalars; ∧² has weight (1,1) and Sym² weight (2,0), so neither has B-fixed vectors | holds | none |
| plan vs README | slug and `needs` comparison | 15 vs 11 slugs; 2 `needs` sentences differ | mismatch | R01 |
| Carried (previous report): §0.1 V(1)∉Ŵ(ℤ₂), ṽ(1)∈Ŵ(ℤ₂), u₀ | p=2 | z=(−2,−2,−6,−54); (−2,−4,−16,−256); w₀(u₀)=−1 | holds | none |
| Carried: §0.3 θ; §0.4; §0.7 | D_(ℤ/4); 𝔽₃[x,y]/(x³,y³); 𝔽₃[x]/(x⁴) | θ=2 in W(ℤ/4); S₁=−x²y−xy²; x³=3!γ₃ | holds | none |
| Carried: §0.13; Conventions (dual, composition, GL₂ cocharacter) | μ_{2∞}; ℚ_p/ℤ_p; g,h unipotent | Φ=(2−[4])φ; pσ; (gh)ᵗ=hᵗgᵗ; Fil¹=ke₁ | holds | none |
| Carried: §1.3; §2.0; §2.2 | c=1+εE₂₁; u·diag(2,1)·u⁻¹; Fil¹=0 or full | E₁₁+εE₂₁; −σ(a)≠−a; E·(D⊗𝔖) | holds | none |
| Carried: §2.7; §2.11; §2.12 | F̄₃ torus; ∅; W(𝔽_q) | a_G=(3); contractions horizontal; φ*(s⊗1)≠s⊗1 | holds | none |
| Carried: §3.9; §3.10; §3.15; §3.16; §3.17 | e=1,2; G_m n≤2; D=K; ℚ_p(√p); scalars | tangent 0 or 1-dim; 2·2≢1; ψ=−1; equal duals; ab·h | holds | none |
| Carried: §4.2 dilatation κ | p>2 | det χ∈ℤ_p^×; diag(1,ζ) outside the identity component | holds | none |
| Carried: §5.5; §5.7; §5.10 | μ_{p∞}; G_m, b=p; W[[t]] | t not a unit; c=−1 (with μ₀(p), −p≠p); h=Σt^(pʳ)/pʳ | holds | none |
| Carried: §5.17; §6.0; §6.3 | G_m b=3; GL₂ (1,0); E(0)=ap | t_H=t_N=1; ℓ=1; c_E(0)=p | holds | none |

## Not verifiable

- P23's journal page range. The README gives "Mathematische Annalen 385 (2023), 1–61". I could not confirm the published page range (two web searches found the DOI 10.1007/s00208-022-02387-8 but no pages). The locators use arXiv v4, which I read, so no locator depends on it.
- Kisin's 2010 Proposition 1.3.2 and Deligne's ⊗-and-duals argument were read only through Kisin17 footnote 7 (lines 320–324), P23 footnote 3 (line 685) and KP18 line 2582. They are not in the manifest.
- RZ96 (§5.3) is settled as uncertified and was not read. The Faltings comparison behind gap:relative-crystalline-constants is untouched text and was not reopened.

## Source issues

- **Misprint** in KZ25 at §3.4.2, p.26: the source says the kernel of π₁(M)→π₁(G) is freely generated by certain roots of G that are not roots of M; it should say the corresponding simple coroots, since π₁ is a quotient of the cocharacter lattice; affects nothing.
