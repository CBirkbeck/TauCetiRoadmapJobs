# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 006b950)

**Verdict:** needs changes

This is an incremental re-review of the 6 README lines changed since 02d485d (lines 96, 108 and 161), and of the text they cite.

- R02 of the previous review (the two inexact locator statements) is repaired, and the repair is correct at the cached texts.
- The two remaining findings are both outside the roadmap folder and are unchanged: the plan's `gaps` list (R01) and the pull-request description (R02). Neither can be repaired by an edit of the folder; both need a human edit. The folder itself has no open finding.

## R01 (P2) — The plan's `gaps` still do not match the README's contracts: four slugs are missing and two `needs` sentences are stale

Re-raised: H01

**Location.**
- README lines 102, 104, 106 and 108: the four "What GeometricSatakeAndFusion must provide (gap:…)" contracts.
- README lines 88 (gap:full-fixer-cutting-tensors) and 94 (gap:ordinary-levi-full-fixer).
- `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.**
- The README states 15 contracts; the plan declares 11, none with supplier GeometricSatakeAndFusion. The intake reads the plan, so the four local-model contracts are never announced on GeometricSatakeAndFusion's job.
- The plan's `needs` for `full-fixer-cutting-tensors` and `ordinary-levi-full-fixer` are still the older, context-dependent sentences, not the self-contained ones of README lines 88 and 94.

**Witness.** `grep -c 'must provide (gap:' README.md` gives 15; the plan's `gaps` has 11 entries. Its `ordinary-levi-full-fixer` entry begins "Under the ordinary σ-straight normalization … the Newton-Levi model …"; README line 94 begins "Let G be a connected reductive group over ℚ_p, W=W(F̄_p) …".

**Why H01 does not settle it.** H01 is right that the repair job may only remove plan entries. The defect is in the plan, though, and remains until a human edits it.

**Repair (a human edit of `plan.json`).**

| Slug | Supplier | Section | `needs` |
|---|---|---|---|
| `scheme-local-model-representative` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 102 |
| `scheme-local-model-hodge-immersion` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 104 |
| `schubert-curve-spanned-tangents` | GeometricSatakeAndFusion | 0.29 | the sentence after the colon of README line 106 |
| `local-model-curve-spanned-tangents` | GeometricSatakeAndFusion | 4.17 | the sentence after the colon of README line 108 (as it is at this head, with Theorem 4.3.2) |
| `full-fixer-cutting-tensors` (replace `needs`) | ReductiveGroupsPartII | RG2.3.5 | the sentence after the colon of README line 88 |
| `ordinary-levi-full-fixer` (replace `needs`) | ReductiveGroupsPartII | RG2.3.3 | the sentence after the colon of README line 94 |

Tested: the plan's slug set then equals the README's 15, and each sentence is self-contained.

## R02 (P3) — The pull-request description still says p>2 for Layer 0 and "Fourteen" contracts

Re-raised: H05

**Location.** The roadmap-summary block of the description: "Over complete Noetherian local rings with perfect residue field and p>2, it constructs the Zink ring Ŵ(R), p-frames …". The body: "Fourteen supplier extensions … are stated as exact contracts".

**Claim.** README line 26 states Layer 0 at every prime, with frame constant θ=2−[4] at p=2, and the README states 15 contracts.

**Witness.** README line 26: "Layer 0 holds for every prime p, including p=2". The contract count is 15 (as in R01).

**Why H05 does not settle it.** H05 is right that the description is outside the repair job's files; the text is still wrong, and the human who gives final approval reads it.

**Repair.**
- Replace the summary's first sentence with: "Over complete Noetherian local rings with perfect residue field and at every prime (p>2 from Layer 1 on), it constructs the Zink ring Ŵ(R), frames with constant θ (p-frames for odd p), …".
- Change "Fourteen" to "Fifteen".

## Previous findings

- R01 — not repaired: `plan.json` still declares 11 gaps, none for GeometricSatakeAndFusion, with the two older `needs` sentences; README lines 88, 94 and 102–108 state 15 contracts. Raised again as R01.
- R02 — repaired: line 108 now cites "Theorem 4.3.2 … pp.16, 31, 40 and 46–47; KPZ26 lines … 1748–1754"; line 96 now reads "is the Levi step of KZ25 §3.4.2, p.26 … does not use the existence of the μ_y-ordinary class".
- R03 — not repaired: the description still says "perfect residue field and p>2" and "Fourteen supplier extensions". Raised again as R02.

## Verified sound

**Gate, build and form (run at 006b950).**
- My own run of the gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's gate, with the targeted build, also passed (`build=0`).
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` exits 0 with no output (8.4 s).
- The dependency check with `--movable` prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: FiniteFlatGroupsAndIntegralPadicHodgeTheory 65, ShimuraVarieties 105, PadicHodgeTheory 122, GeometricSatakeAndFusion 130, this roadmap 131.
- The outside-folder diff against `origin/main` is empty. `git diff --name-only 02d485d HEAD` lists only README.md, so `Suggested.lean` and the pins are unchanged: the file has no declarations, the `#check` comparison and the one-tactic probe have nothing to act on, and the previous reports' finding that no headline is statable without a stand-in stands.

**The three changed passages, read at the cached texts (9 locators).**
- **Line 96, Anschütz pages.** Anschuetz22 §10 begins at line 1345, on author p.32 (page markers at lines 1330 and 1375); Lemma 10.2 is at line 1384 and Proposition 10.3 with its proof at lines 1388–1391, on p.33. "pp.32–33; lines 1345–1391" is exact. Line 90's "Proposition 10.3, p.33; line 1388" remains exact.
- **Line 96, the Levi step.** KZ25 page markers at lines 1123 (p.26) and 1166 (p.27), so lines 1152–1165 are all on p.26. The four inputs the new sentence names are the ones the source uses:
  - M semistandard, attached to the Newton point (lines 1152–1153);
  - x in the apartment of S, through the identification of apartments (lines 1129–1130 and 1158–1160);
  - the kernel of π₁(M)_I→π₁(G)_I torsion-free, proved at lines 1161–1164;
  - the full fixer of G equal to its parahoric (line 1164).
  The two hypotheses the sentence says are not used, the μ_y-ordinary class and t=t_μ′ with μ′∈W₀·μ, are at lines 1146–1150, as cited. The centrality statements of lines 1153–1154 (Lemmas 2.1.7 and 2.1.9) feed the later lift, not the intersection or the fixer comparison.
- **Line 108.** KPZ26 Theorem 4.3.2 is at lines 1748–1754 on p.40 (page markers at 1729 and 1767); its last sentence (line 1754) is the minimal-element case the contract uses. The other locators of the parenthesis are unchanged.
- **Line 161 (§0.2).** Lau14 abstract, p.2201, lines 23–26: the display theory holds at the prime 2 without restriction. Line 639 and Lemma 2.4 (line 644) are on p.2216 (page markers at 618 and 656, running head 2217 at line 657). Lines 1728–1730, on p.2243 (running head at line 1697): the attribution to Gabber and Theorem 5.3. The References entry (line 1670) lists the same abstract and pages.

**Seeded sample.** Of the 15 sampled targets, none lies in the changed lines; §0.2 is adjacent to 0.6 and was checked above. The contract of line 108 feeds §3.13 and §3.14 (sampled): their *Needs* cite the slug, not the locator, so nothing in them changes. The sampled targets themselves are untouched and were covered by the previous reports.

**Cross-roadmap citations and ownership.**
- The changed text adds no cross-roadmap citation and no library declaration. GeometricSatakeAndFusion §4.17 and ReductiveGroupsPartII §RG2.3.3, cited by the surrounding contracts, were resolved in the previous report at unchanged heads.
- `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision. `scratch/citations.md` lists the same two Lean-name leads as before, in untouched text, resolved earlier in DerivedDeRhamCohomology §PD.7.
- Declared gaps: the 11 slugs of the plan are unchanged in the README; the mismatch with the plan is R01.

**Adversarial table.** Rows for the changed passages are computed at this head; the rest are carried from the previous report (02d485d) with its values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Line 96: Levi step for arbitrary σ-straight t | GL₃ split, x hyperspecial, t=t^(1,0,0) | ν=(1,0,0), M=GL₁×GL₂; M(K₀)∩GL₃(W)=GL₁(W)×GL₂(W); ker(ℤ²→ℤ)=ℤ(1,−1), free | holds | none |
| same, t not of the form t_μ′ | GL₂, t=1 | M=G, intersection 𝒢(W), kernel 0; no ordinary class enters | holds; supports "does not use" | none |
| same, ramified inertia action | Res_{K/ℚ_p}GL₂, K ramified quadratic, M=Res T | π₁(M)=ℤ[I]², π₁(G)=ℤ[I], kernel ℤ[I]·(1,−1), induced; on coinvariants ℤ²→ℤ has kernel ℤ | torsion-free, as the sentence says | none |
| same, hypothesis 𝒢=𝒢° (carried) | PGL₂, x edge midpoint, t=1 | [[0,1],[p,0]] fixes x with κ=1∈ℤ/2 | hypothesis needed and named | none |
| Line 96: Anschütz page range | page markers | 1330 (p.32) < 1345 < 1375 (p.33) < 1388–1391 < 1413 (p.34) | pp.32–33 | none |
| Line 108: locator | KPZ26 page markers | 1729 (p.40) < 1748–1754 < 1767 (p.41) | p.40, Theorem 4.3.2 | none |
| Line 108: contract (carried) | GL₂/ℤ_p μ=(1,0); Res GL₂ ramified, μ′=(2,0) | ℙ¹ smooth; cone xy=z² with lines (1,0,0),(0,1,0),(1,1,1) spanning k³ | holds | none |
| Line 161: locators | Lau14 page markers | 618 (p.2216) < 639, 644 < 656; 1696 (p.2243) < 1728–1730 < 1736 | pages as cited | none |
| §0.2 at p=2 (carried) | R=𝔽₂, μ_{2∞} and ℚ₂/ℤ₂ | M=W(𝔽₂) with (F,V)=(2,1) and (1,2); FV=VF=2 | holds | none |
| plan vs README | slug and `needs` comparison | 15 vs 11 slugs; 2 `needs` sentences differ | mismatch | R01 |
| Carried: gap:full-fixer-cutting-tensors | B⊂GL₂; G_m scalars; SO(q); μ₂; Λ=0 | W^B=W^{GL₂}; {E_ij} forces scalars; det⁻¹ on the volume tensor; {g²=1}; GL(0)={1} | holds | none |
| Carried: §0.1, §0.3, §0.4, §0.7 | p=2; D_(ℤ/4); 𝔽₃[x,y]/(x³,y³); 𝔽₃[x]/(x⁴) | z=(−2,−2,−6,−54); θ=2; S₁=−x²y−xy²; x³=3!γ₃ | holds | none |
| Carried: §0.8–§0.13 | general θ; D_(ℤ₂)→D_(𝔽₂) | θφ(B), φ₁(C); w_n(2−[4])=−2, −14, −254, −65534; Φ=(2−[4])φ | holds | none |
| Carried: §1.3; §2.0; §2.1; §2.2; §2.7; §2.11; §2.12 | c=1+εE₂₁; Borel in Λ⊗Λ∨; F̄₃ torus; ∅; W(𝔽_q) | E₁₁+εE₂₁; B-fixed endomorphisms scalar; a_G=(3); contractions horizontal; φ*(s⊗1)≠s⊗1 | holds | none |
| Carried: §3.9–§3.17 | e=1,2; G_m n≤2; D=K; ℚ_p(√p); scalars | tangent 0 or 1-dim; 2·2≢1; ψ=−1; equal duals; ab·h | holds | none |
| Carried: §4.2; §5.5; §5.7; §5.10; §5.17; §6.0; §6.3 | p>2 dilatation; μ_{p∞}; G_m b=p; W[[t]]; G_m b=3; GL₂ (1,0); E(0)=ap | diag(1,ζ) outside the identity component; t not a unit; c=−1; h=Σt^(pʳ)/pʳ; t_H=t_N=1; ℓ=1; c_E(0)=p | holds | none |

## Not verifiable

- Ownership against open pull requests was checked only through `scratch/overlaps.md` and the previous report's searches; the changed text states no new construction.
- RZ96 (§5.3) is settled as uncertified and was not read. Nothing changed depends on it.

## Source issues

- **Misprint** in KZ25 at §3.4.2, p.26: the source says the kernel of π₁(M)→π₁(G) is freely generated by certain roots of G that are not roots of M; it should say the corresponding simple coroots, since π₁ is a quotient of the cocharacter lattice; affects nothing.
