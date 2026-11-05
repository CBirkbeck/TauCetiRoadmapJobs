# FIX-DESIGN-PELModuliPartII~2 — repair report

Review resolved: REV-DESIGN-PELModuliPartII (nine findings F01–F09). Files changed: `packages/PELModuliPartII/design/README.md`, `packages/PELModuliPartII/design/plan.json`, `packages/PELModuliPartII/sources.toml` (new). The README's target sections are rendered from `plan.json`, so every target statement, *Needs:* line, source and Check in the README matches `plan.json` field for field.

## F01 (P1) — applied

U2/mixed-framed-space: the Acceptance line "deg α=q^(n+1)" → deleted. The degree Check now gives deg α=q² and rejects 27 at n=2, q=3 (27²=729≠81). Worked check 2 says the same. Evidence: LZ22 line 2850–2862, where α*λ_X=λ_Y×ϖλ_E and X is principal.

## F02 (P1) — applied

G1 → new theorem U3/exotic-components: two components for every finite K/ℚ_p (LL22 Lemma 2.4 and footnote 8, p. 10; Wu16 §3.4, Theorems 5.17–5.18), with three Checks. G2 → deleted, and U7/ramified-global-geometry gets a negative n=2 Check (RSZ21 Remark 6.8, line 1741–1744). The `gaps` list now holds only supplier contracts.

## F03 (P1) — applied differently

Requests and rescope paragraphs → "From X" contracts and four supplier gaps. The roadmap now owns U0/strict-module-display, U0/rz-representability, U6/cm-moduli-integral, U9/basic-hom-comparison and U9/formal-arithmetic-quotient. Zink displays are a gap to PELModuli §M2.15, not to the board design FiniteFlatGroupsPartII, which is not an allowed supplier. No A6 gap is declared, because nothing here consumes it. Row-by-row details are below.

## F04 (P2) — applied

U7/split-drinfeld-level and U7/split-integral-geometry → deleted. Their consumers now cite IgusaVarieties §IG.0.31 and EndoscopicTransfer §10.2: U7/global-integral-gluing and U8/integral-hecke-system (statement and *Needs:*). The level-zero split smoothness is now a clause of U7/semiglobal-local-types (LZ22 §11.4, p. 76, line 3314–3324, with the RZ17 §8 Lubin–Tate condition). U7/semiglobal-rsz has a new Check identifying it as the level-zero model of §IG.0.31.

## F05 (P2) — applied

The split proposal and every mention of PELModuliPartIII are deleted. The 189 items are routed to SelmerIwasawaCohomologyPartII: D1→§2.2, D2→§2.3, D3→§§2.2–2.3, D5→§2.4, D6→§§2.6, 5.2, 5.4, D4→its gap:unitary-special-compatibility, D0→its gap:unitary-incidence. Scope records U8 as owner of the LTXZZ22 §§4.2, 5.2 models. Downstream consumers names that roadmap and its gap:native-shimura.

## F06 (P2) — applied

Every target now has an item-by-item `*Needs:*` line, which replaces "Prerequisites". Every layer header has a computed `*Needs:*` line, which replaces "Layer imports". Atlas labels are resolved to sections. The gate now places the roadmap after IgusaVarietiesAndTorsionConcentration (output below).

## F07 (P3) — applied

All the listed locators are corrected, and the same §2.2 error is also fixed in U1/rank-one-lift. Atlas labels are replaced by section citations everywhere, rather than given a label map. The pins are restated as 6b7abb3 and a91d3aa, with line numbers. `sources.toml` now records all 16 works, including Howard19, Kraemer03, LRZ26, LL21 and RZ17. Details are below.

## F08 (P3) — applied differently

Imposing ϖ=u² is impossible in general, because ϖ∈O_{F⁺} is global and u is local. Instead, U9/exotic-uniformization and Conventions now require val_u(ϖ)=1 and record h′=(u²/ϖ)·h^exo with a unit factor, so the identification is an isometry exactly when ϖ=u². There is a new n=2 Check. The U8/mixed-global-moduli degree Check now uses u₀λ₀, and the stray ϖλ₀ line is deleted.

## F09 (P3) — applied

Deleted: 78 duplicated Acceptance lines in 40 targets, the Atlas names, the Lean-style Check names, the dated lines, the pipeline ids in the README, and the companion paragraph, which is replaced by a section on headline statability. Three weak Checks are rewritten. Narrative passages are removed and ASCII mathematics is converted to Unicode. No Lean file exists at this stage.

## Details of F02, F03, F07 and F09

### F02
G1 → new theorem U3/exotic-components. It holds for every finite K/ℚ_p, p>2, L/K ramified, n even ≥2: there are two components, distinguished by κ₂, with the Bruhat–Tits description. The locators are LL22 Lemma 2.4 and footnote 8, p. 10 (LL22 line 437–451), Proposition 2.28, pp. 22–23, and Wu16 §3.4 and Theorems 5.17–5.18. It has three Checks. U3/exotic-smoothness now states only smoothness, for all K. G2 deleted. U7/ramified-global-geometry has a negative Check from RSZ21 Remark 6.8 (RSZ21 line 1741–1744). Both `gaps` entries are removed.

### F03 rows
The rescope paragraphs and the `requests` list are deleted. The contracts section now gives each supplier as a "From X" block. Rows:

- FiniteFlatGroups R07.2. Owned here as U0/strict-module-display (Mih19 Part III). Zink's equivalence over nilpotent bases is `gap:zink-display-equivalence`, with supplier PELModuli §M2.15, not FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII TD.0. That board design is not an allowed supplier. It also treats only complete-local bases, and FiniteFlatGroups' scope assigns displays to PELModuli. The rank-one lifts cite EndoscopicTransfer §§7.6, 10.2.
- SF.4. Owned here as U0/rz-representability (RZ96 Theorems 2.16 and 3.25). IgusaVarieties §IG.0.27 is cited as its special case.
- SF.1. Owned here as U9/formal-arithmetic-quotient.
- PELModuli M4. Owned here as U6/cm-moduli-integral (RSZ21 §4.1, p. 17).
- GN.2. Now `gap:hermitian-local-global` to AdelicAlgebraicGroups §4.1, the same contract SelmerIwasawaCohomologyPartII declares. The roadmap also cites PELModuli §§M3.1–M3.2 and GN §§2.7, 2.9.
- RG2.3. Now `gap:unitary-multichain-stabilizer` to §RG2.3.5.
- LT.3. Dropped (see F04).
- AdicSpacesPartII R2. Now AdicSpacesPartIII Layer F0 and §R2.9. §R2.9 already builds the Berthelot generic fibre on FS_C, so no gap is needed.
- C5. Now `gap:bad-prime-projectivity` to §§C5.5, C5.18.
- Faltings R28.4. Now EndoscopicTransfer §§8.3, 8.10, plus the new target U9/basic-hom-comparison (RZ96 Lemma 6.28, Corollary 6.29).
- A6. No gap is declared, because no target of this roadmap consumes Zhang21 Lemmas 7.10(b) and 7.11. The ledger records them as not consumed here.

### F07
The locators are corrected as listed, against the texts read:

- U1/product-embedding: LZ22 §2.11 (2.11.0.1), p. 15, and Zhang21 §3.1 (3.2), p. 880.
- U1/special-hom and U1/rank-one-lift: LZ22 §2.2, p. 11. This is the same pattern in a second target.
- U2/almost-self-dual-rz and U2/almost-self-dual-geometry: LZ22 §10.1, pp. 63–64.
- U3/exotic-special-hom: (2.1) and footnote 9, p. 11. U3/rank-one-source and U3/exotic-rz now cite Definition 2.3 and Lemma 2.4.
- U4/absolute-exotic: Definition 2.59, p. 38. U4/exotic-relative-functor: pp. 38–40.
- U9/nearby-framing-datum: Zhang21 §7.3 (7.3)–(7.4) and footnote 3.
- U6/eisenstein-condition: adds RZ17 (8.2), p. 28, and Zhang21 footnote 3.
- U7/semiglobal-local-types: semistability is on p. 76.
- U8/mixed-global-moduli: §A6.13.
- U6/rsz-datum: adds PELModuli §M5.5.

The label map is applied differently: labels are replaced by sections everywhere instead of being mapped. The pins are 6b7abb3 and a91d3aa, with lines. The manifest has 16 entries.

### F09
The following are deleted:

- the 78 Acceptance lines in 40 targets that duplicated Checks;
- the "Atlas name" lines and Lean-style Check names;
- the dated "Read" lines;
- the pipeline ids in the README (the ownership table is now by source);
- the companion-file paragraph, replaced by a "Headline theorems" section that names what is not statable at the pins.

The weak or wrong Checks are rewritten: UnitaryRZ.productNoSwap now holds for n≥1, AdmissibleCMData gets an inert-clause example, and the KramerIsocrystal trace Check is computed. The narrative ("packet", "now", "this run") is removed. ASCII mathematics is now Unicode (ā, L̆, ℰ̄, ℚ_p and so on). There is no Lean file at the design stage, so no Lean padding exists.

## Checks run

Dependency check (`gate --candidate packages/PELModuliPartII/design/README.md --only PELModuliPartII`):

    candidate: PELModuliPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 640 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line, and the exit status was 0. `sources check packages/PELModuliPartII/sources.toml` reported 0 problems. `roadmaps resolve` reported no cross-roadmap citations found nowhere and no Lean names found nowhere. No machine path appears in the changed files.

No gate failures were listed in the brief. Lean elaboration was not run: the design stage has no `Suggested.lean`, and this job may not create one.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| U2/mixed-framed-space degree | n=2, q=3 | (deg α)²=9·9=81 ⇒ 9; q^(n+1)=27 ⇒ 729≠81 | holds at q² | F01 |
| U3/exotic-components | n=2; t(Λ) | dim V_Λ∩comp = t/2−1 = 0; Λ⊊M vertex ⇒ t(M)=t(Λ)−2·len(M/Λ)=0, which is not allowed | one point per component at n=2 | new Checks |
| U3/exotic-components swap | g with κ₂=1 | Wu16 (3.24): N(κ)≅N(κ′) when κ(g)=κ′−κ | labels depend on framing | Check reworded (no claim of U(V)-surjectivity) |
| U0/strict-module-display | O=ℤ_p; μ_{p∞}; ℚ_p/ℤ_p; ℚ_p(√p) twist over O_K/(p) | rank P/Q 1 vs 0; π acts by −π≠π mod π² (p odd) | holds | non-strictness test moved from O_K to O_K/(p) (π must be nilpotent) |
| U0/strict-module-display duality | relative height 1, dim 1 | dual dim 1−1=0 ⇒ étale ⇒ not biformal | holds | Check |
| U0/rz-representability | n=1 unramified | strict N_1=Spf O_L̆ vs unstructured d(h−d)=[K:ℚ_p]·[K:ℚ_p] | holds | an earlier draft claimed ℤ copies for free height: false (exact polarization forces height 0), replaced |
| U0/rz-representability | spin condition | i(u)=0 on Lie is a closed locus, so spin is open | holds | stated as open |
| U6/cm-moduli-integral | R=k[ε], R[x]/(x²) | (x+α)∋x² ⇔ α²=0 ⇒ α=εc; Kottwitz fixes c; rank-only allows all c | holds | Check |
| U6/cm-moduli-integral | F imag. quadratic, p ramified | rel. height 2/2=1 ⇒ Lubin–Tate, unique lift | étale at p | Check |
| U9/basic-hom-comparison | supersingular E, K=ℚ; ordinary E | dim 4=4 at ℓ and at p (D_{1/2}); ordinary: 2≠4 | hypothesis necessary | Checks |
| U9/formal-arithmetic-quotient | Γ=ℤ shift; Γ={±1}⊂U(V) | (X,−ρ)≅(X,ρ) via −1 ⇒ trivial action ⇒ not a torsor | holds | hypothesis (ii) strengthened from "free on 𝔐_red" to neighbourhoods disjoint from translates |
| U9/exotic-uniformization | n=2, val_u(ϖ)∈{0,1} | val(u²/ϖ)=1−val_u(ϖ); dual of self-dual Λ is (u²/ϖ)^−1Λ | unit iff val=1 | F08 |
| U7/ramified-global-geometry n=2 | uv=t²·unit | dim m/m²=3 > 2 | not regular | negative Check |
| U7/semiglobal-local-types split | v₀ ramified over p | LZ22 (MS) needs the Lubin–Tate condition | added to clause | RZ17 §8 cited |
| U1/product-embedding no-swap | n=1 | (1,0)+(1,0)=(2,0)≠(1,1) | fails for n≥1 | Check widened |
| U5 trace factor | A,B | Tr(u⁻¹)=u⁻¹+ū⁻¹=0 ⇒ Tr(u⁻¹δ(A+uB))=2δB; δ⁻¹Tr gives 2B | factor 2 needed | Check computed |
| U6 inert clause | F⁺_v=ℚ_p(√p), F_v unram./F⁺_v | {(σ,+),(σ,−)} pulled back; {(σ,+),(σ̄,−)} is a CM type, not pulled back | discriminates | Check replaced |

## Ownership and citations

Searched by object (`roadmaps grep`, main and open heads, and the board package designs):

- O-displays and strict O-modules: only PELModuli §M2.15 (Zink displays). The board design FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII TD.0 has complete-local displays only.
- RZ96 Theorem 3.25 and Corollary 6.29: no owner.
- Two exotic components: no owner.
- CM moduli at ramified primes: none.
- Formal quotients by discrete groups: none.

So this roadmap owns the six new targets. Every cross-roadmap section cited was read at the current open head:

- PELModuli §§M0.4–M5.5;
- AbelianSchemes §§A4.1–A6.13;
- FiniteFlatGroups R07.1 and §§R07.2.10, .17, .20, .26;
- EndoscopicTransfer §§7.6, 8.3, 8.10, 10.2;
- IgusaVarieties §§IG.0.27, IG.0.31;
- AdicSpacesPartIII F0 and R2.9 (main);
- SchemeAndStackFoundations Layers 1, 4 (main);
- AlgebraicModuli §1.3;
- GN §§2.7, 2.9;
- PadicHodgeTheory §§3.3–3.5, 8.3;
- ShimuraVarieties §§1.7, 2.5–2.7, 4.5, 5.10, 6.7;
- AdelicAlgebraicGroups §4.1;
- RG §RG2.3.5;
- ShimuraCompactifications §§C5.5, C5.18;
- SelmerIwasawaCohomologyPartII §§2.2–2.6, 5.2, 5.4.

The absence of formal schemes, p-divisible groups and abelian schemes at the pins was checked by grep of the pinned Mathlib and Tau Ceti.

## Sources

All 16 works were fetched by the sources service. LL22, LL21 and RSZ21 are recorded as the author copies the design cites; their digests match the design's. LL22's arXiv v2 numbers differently, which is noted in the manifest. Zhang21 and LTXZZ22 are recorded as arXiv v3, with notes that the cited numbering was checked against the published pagination. The NSF copy of LTXZZ22 timed out, and the Tsinghua host is in no licence class, so neither was used. No text is missing, and no `needs-references.toml` was written.

## For the maintainer

- New contracts on earlier roadmaps:
  - PELModuli §M2.15 (gap:zink-display-equivalence);
  - AdelicAlgebraicGroups §4.1 (gap:hermitian-local-global, the same as SelmerIwasawaCohomologyPartII's);
  - ReductiveGroupsPartII §RG2.3.5;
  - ShimuraCompactifications §§C5.5, C5.18.
- The LubinTate…LT.3, AdicSpacesPartII R2, FaltingsFiniteness R28.4, SchemeAndStackFoundations SF.1/SF.4 and GN.2 contracts are withdrawn.
- SelmerIwasawaCohomologyPartII's gap:native-shimura names ShimuraVarieties; U8 here supplies those models. Re-pointing that contract is outside this package.
- Deleted target names that others might cite: U7/split-drinfeld-level and U7/split-integral-geometry.
- New names: U0/strict-module-display, U0/rz-representability, U3/exotic-components, U6/cm-moduli-integral, U9/basic-hom-comparison, U9/formal-arithmetic-quotient.
- The roadmap's placement moves to after IgusaVarietiesAndTorsionConcentration.
