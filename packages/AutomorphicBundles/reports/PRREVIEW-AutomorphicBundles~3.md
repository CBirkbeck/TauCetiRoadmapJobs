# Review of AutomorphicBundles (pull request #1069 at fd74684)

**Verdict:** needs changes

Incremental re-review of the 38 lines changed since `54e21dd`. The folder's changes repair all four previous findings and introduce no new problem; both findings below are in the pull request's description, not in the folder.

## R01 (P3) — The description says the roadmap constructs the coefficient group

**Location:** pull request description, first paragraph after the summary block: "From a Shimura datum it constructs the coefficient group and the associated bundles of its torsors".

**Claim:** At this head the coefficient group `Gᶜ = G/Z_s` is imported from ShimuraData §4.9; the roadmap owns only the representation-factorization adapter. The sentence describes an earlier head.

**Witness:** `TauCetiRoadmap/AutomorphicBundles/README.md` lines 4–5 ("it uses the shared coefficient group to construct the associated bundles of its torsors"), line 46 (Scope), and 0.1 (lines 419–420): "the algebraic quotient `Gᶜ = G/Z_s` supplied by ShimuraData §4.9".

**Repair:** Replace the clause with the README's: "From a Shimura datum it uses the shared coefficient group of ShimuraData §4.9 to construct the associated bundles of its torsors".

## R02 (P3) — The description announces red-team passes that the branch already contains

**Location:** pull request description, the Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The passes are not "to follow": the head's history contains them, and two review-repair commits after them, which changed target numbering, supplier ownership and `Suggested.lean`.

**Witness:** `git log origin/main..fd74684`: six commits titled "red-team repairs (…)" (`b7d55356` … `218de510`), then `055b77ef`, `54e21dd7`, `fd74684b`.

**Repair:** Write "…for the port from the accepted explorer package; author-side red-team passes and two rounds of review repairs are included in this head."

## Previous findings

- R01 — repaired: References reads "arXiv:2211.06922v2, 10 April 2025" with the v2 link; 10.5 and 10.6 cite "[Lan22], Proposition 3.4(4–6), pp.7–9"; 3.5 marks AG 3.3.1 as the torus case and Milne90 Remark 6.1 as the general group.
- R02 — repaired: 3.9 and 11.17 read "PELModuli M0 (PEL data); ShimuraData §3.8 (compact duals)"; 11.16, 11.17 and the supplier table name M5.2 and M5.5 (`unitaryDatum_U11`).
- R03 — repaired: 12.8 states `HodgeLineFJ_I` injective "on `AF(k,M)` for every `M`, with no condition on `c`"; 12.9 states recognition "for `HodgeLineFJ` and the base-level family, for every `M₁ ⊂ M`".
- R04 — repaired: the 11.8 Check reads "over a field in which `3≠0`, `J(nonidentity)=2` and `J(identity)=1` … violates the cocycle because `4≠1`".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 12.8, transfer of injectivity to `HodgeLineFJ` (changed) | `H : ℤ → ℤ²`, `a ↦ (a,0)`, `γ : ℤ² → ℤ`, `(x,y) ↦ x`; control `γ = 0` | `γ∘H = id` injective, `H` injective, `γ` not: no condition on `c` needed. Control: `H` injective, `γ∘H = 0`: transfer runs only from `FJ^C` to `HodgeLineFJ`, as written | agrees | none |
| 12.9, recognition for `HodgeLineFJ` (changed) | `M₁ ⊂ M` arbitrary; `M₁ = 0`; `M₁ = M` | If `H_M(s) = im(x)`, `x` in the base-level `M₁`-family, then `FJ^C_M(s) = Γ(c_M)(im x) = im(Γ(c_{M₁})x)` by naturality of `c`, so 12.9 gives `s ∈ AF(k,M₁)`; converse by naturality of `H`. `M₁ = 0`: `H(s) = 0 ⇒ s = 0`, which is 12.8. `M₁ = M`: trivial | agrees | none |
| 12.2 identity `Γ(c)∘HodgeLineFJ = FJ^C` (cited by both) | ShimuraCompactifications §7.15 at its head | §7.15 (its lines 2534–2553) still defines `HodgeLineFJ` for any module `M`, valued in `Γ(M^Z, p_*Ψ(ℓ) ⊗ … ⊗ M)`, "`M` need not be flat": the map 12.8–12.9 transfer to exists for every `M` there | consistent | none |
| 11.8 Check (changed) | `K = ℚ, 𝔽₂, 𝔽₃, 𝔽₅` | `J(t)² − J(t²) = 4 − 1 = 3`: `ℚ`: 3 ≠ 0; `𝔽₂`: `0 ≠ 1`, and `3 = 1 ≠ 0`; `𝔽₅`: `4 ≠ 1`; `𝔽₃`: `4 = 1`, now excluded by "`3≠0`" | Check true on its stated range | none |
| 3.9, 11.16, 11.17, supplier table (changed citations) | PELModuli and ShimuraData at their open heads | PELModuli: "Layer M0: Linear algebra and reflex fields" (line 424), "M5.2 Siegel moduli `A_{g,D,n}`" (3533), "M5.5 Unitary PEL data with prescribed signatures" (3663), `unitaryDatum_U11` signature `(1,1)` (3695); no "compact dual" in it. ShimuraData "3.8 Compact dual" (529) | every citation resolves | none |
| References, Diamond22 (changed) | cached v1 and v2 texts | v2 (cover "10 Apr 2025", Diamond22 line 5): §6.1 on p.23 (line 1045), Prop. 6.2.1 p.24 (1104), Prop. 6.5.1 p.27 (1286), Remark 6.5.2 p.28 (1366), §2.10 p.7 (281). v1 has them on pp.24, 25, 28, 29, 7 | README pages are v2's, reference now v2 | none |
| 10.5, 10.6 locator (changed) | Lan22 | Proposition 3.4 opens at Lan22 line 345 (p.7, before the page-8 marker at 361); items (4), (5), (6) at lines 418, 424, 435 (p.8–p.9); proof at 467 (p.9) | pp.7–9 correct | none |
| 1.1 `finiteTensorStabilizer` (Lean headline, untouched) | elaboration at this head | `lake env lean` on `Suggested.lean`: only `79:8: warning: declaration uses sorry`; signatures as in the worker's file, `[CharZero k]`, `[FiniteDimensional k V]`, comodule instance and `IsFaithful` present | unchanged | none |

The rows for all other statements stand as in the previous review, of `54e21dd`; the diff changes no Lean statement.

- Gate at `fd74684` (worker's run): every rule 0, `build=0`, `depcheck=0`, "Every check passed". Dependency check re-run: `depcheck: 245 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The roadmap is at line 185 of the merge order, after CohomologyComparisons (183), ShimuraCompactifications (165), HilbertModularVarietiesAndShimuraCurves (164), ShimuraData (118), ShimuraVarieties (107).
- Elaboration: `sorry` the only warning. Folder: `README.md`, `Suggested.lean`, `metadata.toml`; nothing changed outside the folder; `Suggested.lean` not changed since `54e21dd`.
- Source locators checked against the text this round: 3 (Diamond22 v1 and v2, Lan22 Proposition 3.4, LanPEL Proposition 7.1.2.14 at lines 23309–23325 for the wording of 12.8–12.9).
- Cross-roadmap citations resolved this round: 6 (PELModuli M0, M5.2, M5.5 `unitaryDatum_U11`; ShimuraData §3.8, §3.9; ShimuraCompactifications §7.15). The change adds no supplier: ShimuraData and PELModuli were already cited.
- Seeded sample: none of its fifteen targets lies in a changed passage (the changes are in 3.5, 3.9, 10.5, 10.6, 11.8, 11.16, 11.17, 12.8, 12.9, the supplier table and References).
- Pull request text: the description's other sentences were read against the head and agree with it (the folder's three files, the two real-bodied definitions and one theorem of `Suggested.lean`, the consumers named under Downstream consumers, the reuse of `HodgeLineFJ`, the 19 open suppliers of the dependency block against the README's supplier citations). Title agrees with the README's.
- Overlap check: read ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties (and AutomorphicBundlesPartII); shared objects: scalar `HodgeLineFJ` — owner ShimuraCompactifications §7.15, cited here; coefficient quotient `Gᶜ` — owner ShimuraData §4.9, cited here and by PerfectoidShimuraVarieties §6.1a; canonical subgroups — owner CohomologyComparisons §6.2; towers and `VB⁰` of Layer 10 — owner this roadmap, cited by the other two. `scratch/overlaps.md` lists no dropped id, no second copy, no other pull request changing this folder.
- Source independence: 5 passages compared with 3 sources (changed passages only), none shared: the composite-identity arguments of 12.8–12.9 do not occur in LanPEL's Proposition 7.1.2.14 or its proof; largest share Milne90, 39 of 202 locators; contents not compared again (the diff adds, removes or reorders no layer).
- Remark (untouched text, no change asked): Downstream consumers names AutomorphicGaloisRepresentationsPartII, PadicFamilies and IntegralIwasawaTheory, which the merge order places before this roadmap (lines 168, 175, 30).

## Not verifiable

- AG (Annals version of record): the pages "pp.418–419" kept in the changed 3.5 source line were not checked; AG was read only in its arXiv text in the previous review, where Proposition 3.3.1 is the torus statement.
- The items of the previous review's list (FC90, HarrisLoc, the Annals pages of CS and AG, DLLZ, DLLZRH, LLZ) stand as there; no changed passage depends on them.

## Source issues

- none

(The three issues recorded in the review of `54e21dd`, in Scholze15, LanIntro and LanPEL, stand; none was found in the passages read this round.)

## For the human reviewers

- none
