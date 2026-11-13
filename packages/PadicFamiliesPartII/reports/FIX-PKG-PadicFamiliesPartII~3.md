# FIX-PKG-PadicFamiliesPartII~3 — repair round for REV-PKG-PadicFamiliesPartII~2

Files edited: `packages/PadicFamiliesPartII/README.md`, `packages/PadicFamiliesPartII/Suggested.lean` (module docstring only), `packages/PadicFamiliesPartII/sources.toml` (BCGP25 and AIP15 locators, AIP15 author spelling and venue), `packages/PadicFamiliesPartII/design/plan.json` (top-level `gaps` list only: two `needs` rewritten, one entry added; every other key was checked unchanged by a JSON comparison). `metadata.toml` is unchanged.

All seven findings were checked against the sources and are correct, and each is applied. Two repairs differ in detail from the review's suggestion. R04's new targets are numbered 7.1a/7.1b, so that the cited §§7.2–7.8 keep their numbers. R06 keeps the chart-criterion verification only for the mixed Hilbert–Siegel models, because AutomorphicBundlesPartII §5.1 already verifies it on the Siegel p-level spans.

## REV-PKG-PadicFamiliesPartII~2/R01 (P1) — applied

Verified: BCGP25 line 1187 defines `H_i(𝔤,M) = H^{−i}(E ⊗^L_{U(𝔤)} M)`. Line 2690 (Thm 3.5.11) and lines 1386–1395 (Cor. 2.3.33: `H^{−i}(CE ⊗ M̂) = Ĥ_i`, dual `= H^i(𝔲, M̂^∨)`) show that the coefficient is homology.

§7.2 (2): `HCS(H^i(𝔲_{P_w},M))` → `HCS(H_i(𝔲_{P_w},M))`, with `H_i`, Thm 2.3.13 and the duality stated; API bullet → homology. §7.5: Sen action on `H_*`; `HC` of the complex `E ⊗^L M`. New Checks: GL₂ weights 1, 4 against 2, 1/2 (§7.2); `E ⊗^L E` in degrees `[−1,0]` (§7.5). §7.1's Check labelled cohomology.

## REV-PKG-PadicFamiliesPartII~2/R02 (P2) — applied

Verified: BCGP25 Cor. 3.5.4 and Rem. 3.5.5 (lines 2638–2652) are on printed p. 57, not p. 58. They assume infinitesimal character λ.

§7.2 (1): "For M ∈ O_{λ-alg} … `⊕_w`" → "if M has infinitesimal character λ … one direct factor per distinct character", generalized at singular λ; locator p. 57. The functor and (2) stay general. New negative-control Check: `det` at λ = 0 (central value −2 against 0), covered at λ = (1,1). Harish-Chandra from LocallyAnalyticRepresentationsOfLocalGroups §4.1.

## REV-PKG-PadicFamiliesPartII~2/R03 (P2) — applied

Verified: BCGP25 lines 2606–2609 define `Loc : D⁻(U(𝔤)) → D(D̃^la)`. Lines 2661–2663 give the CE complex, lines 2670–2678 the (𝔤,B) structure, line 3520 the definition of `VB_red`, and line 3523 Rem. 4.5.18.

§7.2: "G-equivariant sheaf …; Loc is exact" → derived triangulated `RHom_{𝔤,∗₂}(M, C^la)`, CE complex of LB-sheaves, (𝔤,B)-equivariance (§3.5.8); Check: trivial module has `H¹ ≠ 0`. §7.4 route and Check; §8.3 → `Ext¹` of derived `µ−µ₀`-invariants, with Check. gap:solid-vb-sen (README, plan) now names derived `VB_red`, `VB⁰` and its tube version.

## REV-PKG-PadicFamiliesPartII~2/R04 (P1) — applied

Verified: the supplier package (`packages/HigherHidaAndColemanTheory/README.md` §§5.2–5.5, 6.2) has finite-slope theory only, with algebraic or analytic-character coefficients. BCGP25 lines 3112–3118 and Def. 4.6.35 (line 3949) need the full functor.

New owned targets §7.1a (`HCS_{Q,w,λ}`, Def. 3.4.17) and §7.1b (`HC`, `HC_cusp`, `D^b` extension, `HC^fs`; Thms 4.6.45, 4.6.56–4.6.58), with APIs and Checks: zero, SL₂ Verma-to-simple, finite slope versus full, support amplitudes. Wired into §§7.2, 7.5, 7.6, 8.3 *Needs*, standing hypotheses, Scope, Dependencies. Numbered 7.1a/7.1b so cited §§7.2–7.8 keep numbers. No Lean declaration.

## REV-PKG-PadicFamiliesPartII~2/R05 (P2) — applied

Verified: supplier README line 1396 (§9.6 item 4) says "U on the middle term intertwined with `p^(−k−1)U` on the last", that is `θU = p^{−k−1}Uθ`. AIP15 lines 1511–1521 and 1538 give `Θ_α U = p^{m}UΘ_α`.

Scope: "uses them as stated there" → import with `θ∘U = p^{k+1}U∘θ` (AIP15 Prop. 7.2.3, p. 34; proof of 7.3.1, p. 35). New contract gap:klingen-bgg-normalization (HigherHidaAndColemanTheory §9.6), same slug in `plan.json`; in §6.4 *Needs* and Layer 6 Dependencies. New §6.4 Check, k = 3: `1` against `−7`. Source-issue bullet and References cite AIP15.

## REV-PKG-PadicFamiliesPartII~2/R06 (P2) — applied

Verified: AutomorphicBundlesPartII §5.2 (at its open head, README lines 943–957) gives `R^iπ_*(E(−nD′)) = 0`, i > 0, n ≥ 0 for formally subcanonical E, also over opens and finite coefficient algebras. Its canonical n = 0 case is excluded. §5.1 supplies the chart criterion.

gap:partial-hasse-regularity (README, plan): "relative toroidal-to-minimal acyclicity of the cuspidal coefficients" → only the §7.21 chart criterion on mixed Hilbert–Siegel models (also mod `p^n`), §5.2's hypothesis; canonical coefficients excluded. New supplier block; `AutomorphicBundlesPartII §5.1, §5.2` in §3.3, §4.4 *Needs* and Layers 3–4 Dependencies; §3.3 Check (subcanonical against canonical, n = 0).

## REV-PKG-PadicFamiliesPartII~2/R07 (P3) — applied

Verified: the GSp4NonregularModularityLifting README (open head, line 129) cites E6/four-pieces, S7/sen-cousin, S7/de-rham-classicality, F8/four-modules … F8/central-character and K2. These labels exist only in `design/README.md`.

New table at the end of Scope, headed "Former design numbering | Section": one row per id of K2, E6, S7, F8 (31 rows); the imported K2 Klingen items map to HigherHidaAndColemanTheory §9.6 or §9.7. Every destination title was compared with its design title.

## Checks

- **Lean.** `lake env lean packages/PadicFamiliesPartII/Suggested.lean`, run from the content checkout, gave exit 0 with no output, both before and after the docstring edit. There is no `TauCeti.*` import, so nothing was built. The file declares nothing: every headline is unstatable at the pins, as the docstring says. The `#check @name` scratch pass therefore had no declarations; nothing changed there. The docstring now also names the derived localization and the BGG-coefficient higher Coleman functors among the missing carriers of §§7.5–7.8.
- **Depcheck** (prescribed command):

```text
depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines.

- **`roadmaps resolve`.** Two leads came back. "HigherHidaAndColemanTheory §§9.6" and "LocallyAnalyticRepresentationsOfLocalGroups §§3.5" are both board packages earlier in ORDER (lines 255 and 253; this roadmap is at 256). Both cited sections exist in `packages/<Name>/README.md`, so neither is a missing roadmap. No Lean name is found nowhere.
- **Gate failures.** The brief lists none.

## Ownership

I searched by object, using `roadmaps grep` over main and the open heads, and grep over `packages/*/README.md`. The searches were for "higher Coleman sheaf/functor", "HCS", and Coleman near "category O / BGG / Verma". There are no matches outside this package, so §§7.1a–7.1b are owned here, as the Scope sentence explains.

The search did find LocallyAnalyticRepresentationsOfLocalGroups (a board package earlier in the order), which owns three objects these sections use. They are cited, not restated:
- λ-smooth solid representations (§3.5);
- the Harish-Chandra isomorphism for split reductive algebras (§4.1);
- finite-dimensional Kostant homology `H_q(𝔫,V)` (§4.6).

Relative vanishing is imported from AutomorphicBundlesPartII §5.2 (R06). No `Suggested.lean` declaration exists, so no qualified-name collision is possible.

## Adversarial pass on added and changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.2 (2) homology coefficient | GL₂ standard rep, `xe₂=e₁`, `t=diag(2,1)` | `H₀`: wt ε₂, value 1; `H₁=𝔫⊗Ee₁`: wt 2ε₁−ε₂, value 4. `H⁰`: ε₁, value 2; `H¹`: 2ε₂−ε₁, value 1/2 | same dims, different weights; agrees with LARLG §4.6, `(0,1),(2,−1)` | homology stated; Check |
| §7.2 (2) degenerate | M = 0; `𝔲_{P_w}=0` | Loc(0)=0; `H₀=M`, `H_{i>0}=0` | consistent | none |
| §7.2 (1) inf. character | GL₂, λ=0, M=det; λ=(1,1) | scalar on det = 2, on Loc = −2. Characters `−(w·0)` give 0 (sum of `wρ−ρ` = 0); `−(w·(1,1))` give −2 | λ-alg alone insufficient | hypothesis; Check |
| §7.2 (1) singular λ | GSp₄, λ=(1,1;w) | Sen values `−1−w/2` (×2), `−2−w/2` (×2) (§7.8 Examples) | repeated χ, so generalized factors | wording |
| §7.2 derived | GL₂, λ=0, M=E | `H₀(𝔲,E)=E`, `H₁=𝔲`, dims 1,1, so `H¹(Loc)≠0` | sheaf reading false | derived def.; Check |
| §7.1a twist | `t=diag(p,1)`, µ=ε₁ | µ(t)=p, slopes +1 | detects λ | Check |
| §7.1a central sign | 𝔪_w=𝔱, ν=(1,1), z=I | `HCS(z)=ν(I)=2=Θ_hor(−I)`, so `Θ_hor(I)=−2` | matches R02 value | Check |
| §7.1a fibres | zero; dim-n M; Verma | 0; n; ∞ | as stated | Check |
| §7.1b amplitude | modular curve, ℓ(1)=0, ℓ(s)=1, d=1 | cusp `[0,0]`,`[0,1]`; full `[0,1]`,`[1,1]` | opposite bounds | Check |
| §7.1b Verma-to-simple | 𝔰𝔩₂, ρ=1 | `s·0=s(1)−1=−2`; `M(−2)⊂M(0)`, quotient dim 1 | three-term triangle defined | Check |
| §7.1b fs vs full | 1-dim space, U=0 | fs dim 0, full dim 1 | fs comparison does not define HC | Check |
| §7.4 uses all of Loc | M=E | `H¹(Loc(E))≠0` kept by `VB_red`, lost by `VB⁰(H⁰)` | as stated | route; Check |
| §7.5 coefficient | `E⊗^L_{U(𝔲)}E`, dim 𝔲=1 | `H⁰=E` (wt 0), `H^{−1}=𝔲` (wt α); cohomology gives `H¹=𝔲^∨` (wt −α) | degrees `[−1,0]` | Check |
| §8.3 Ext¹ | invariants of 0 on X: `X⊕X[−1]`; triangle `j_!A→L→B[−1]` | H¹: `0→j_!A→Ext¹→B→H²(j_!A⊕j_!A[−1])=0` | extension of B by `j_!A` | restated; Check |
| Klingen normalization | `θe=f`, `Ue=αe`, `Uf=βf`; k=0,3 | `β=p^{−k−1}α`; all degrees `s−(k+1)<−3 ⇔ s<k−2`; H⁰ `s<k+1`; k=3: `−3+4=1`, `0+4=4`; printed: `−7` | supplier ranges need `+k+1` | gap; §6.4 Check |
| R06 vanishing | subcanonical n=0; canonical n=0; π=id | §5.2 gives `R^{i>0}=0`; canonical: no claim; id: 0 = 0 | gap narrowed, no canonical claim | gap; §3.3 Check |
| R07 table | E6/four-pieces, S7/sen-cousin, F8/central-character, K2/euler-zero | → §7.8, §8.4, §9.7, §3.5; titles match design lines 1057, 1151, 1315, 453 | links resolve | table |

## For the maintainer

- **Request to a supplier.** gap:klingen-bgg-normalization asks HigherHidaAndColemanTheory to restate §9.6 item 4 as `θ∘U = p^{k+1}U∘θ`. Its stated ranges `s<k−2` and `s<k+1` already presuppose that exponent.
- **New suppliers.** AutomorphicBundlesPartII §§5.1–5.2 and LocallyAnalyticRepresentationsOfLocalGroups §§3.5, 4.1, 4.6 are new suppliers. Both are earlier in ORDER, and depcheck is clean.
- **No renumbering.** New sections are §§7.1a and 7.1b; no section, layer or Lean name changed.
- **`design/plan.json`.** Only the gaps were touched. Its `nodes` do not yet list §§7.1a–7.1b, and its `sourceIssues` were not edited; both are outside the allowed field.
- **A duplication lead this round did not act on (outside the findings).** LocallyAnalyticDistributionsPartII is now at ORDER line 199, earlier than this roadmap. Its §2.5 owns the Arens–Michael envelope `𝒰(𝔤) = lim_r U(𝔤)_r` and its coadmissible modules, which is the algebra that §7.1 here proves Fréchet–Stein. The Scope claim that "no roadmap earlier in the merge order states it" should be re-checked against that section next round.
- **Consumer contract left open.** GSp4NonregularModularityLifting also carries a "horizontal-control contract" addressed to this roadmap (Borel two-weight and GL₂-parabolic one-weight modules, horizontal `Λ[Δ]`-freeness). It is not one of these findings and is not addressed here.
- **Ownership against open pull requests.** Checked with the roadmaps tools by object, as above. No open-PR overlap list was given (`overlaps.md` lists none that change this roadmap).
