# Review of CohomologyComparisons (pull request #1064 at 830e424)

**Verdict:** accepted

Incremental re-review of the 80 lines changed since fff3df0 (`README.md`: the supplier-names sentence of Conventions, the two pins and the `TauCeti.expSMulHom` clause of the supplier contracts, the AInfCohomology citations by section and target title in the supplier contracts and §§0.1, 2.2, 2.9–2.13, 2.16–2.17, 2.24, 4.2, 4.5, 4.7, and eight `*Needs:*` section titles; `Suggested.lean`: the module docstring), and a check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 6–9 read "meant to state the headline theorems … each with `sorry`. It states none, because none is statable at the pins; the list below says what each lacks."; no line exceeds 100 characters.
- R02 — repaired: no `AInf.` or `Semistable.` name remains in `README.md` (0 occurrences); line 63 reads "AInfCohomology §AI.2.2 (*Full faithfulness of Fargues realization*)"; all 14 titles cited occur at AInfCohomology's open head in the section cited.
- R03 — repaired: lines 438, 446, 623, 645, 784, 919, 974, 1040 give the headings of §§2.7, 2.12, 2.14, 2.16 as they read at lines 378, 412, 428, 448; lines 446 and 919 add "the Hodge–de Rham theorem".
- R04 — repaired: the description reads "Adds the new roadmap folder `TauCetiRoadmap/CohomologyComparisons` … `Suggested.lean` declares nothing" and "the targeted Lake build … succeeds"; no sentence claims definitions, theorems or a `sorry` warning.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §0.1 component equations, now cited to *Cyclotomic period elements* | primitive `ε`; `ε=1` | `θ(ξ)=Σ_{j<p}ζ_p^j=0`; `(Σ[ε^{1/p}]^j)([ε^{1/p}]−1)=[ε]−1`; `ε=1`: `μ=0` | supplier's API lists `μ=ξφ⁻¹(μ)`, `ker θ=(ξ)`, `ker θφ⁻¹=(ξ̃)`; Checks list `ε=1` | none |
| §0.1 `θ̃=θφ⁻¹`, cited to *Frobenius-shifted Fontaine map* | `μ`, `ξ̃` | `θ̃(μ)=θ([ε^{1/p}]−1)=ζ_p−1`; `θ̃(ξ̃)=θ(ξ)=0`; reversed `φ`: `θφ(ξ̃)≠0` | same direction as the supplier, kernel `(ξ̃)` | none |
| §0.1 `w(μ)=0`, `w(ξ)=p`, cited to *Witt residue specialization* | `ε↦1` in `k`; `p=2` | `w(μ)=1−1=0`; `w(ξ)=Σ_{j<p}1=p`; `p=2`: `w(ξ)=2` | supplier: `μ↦0`, `ξ,ξ̃↦p` | none |
| Supplier contract, `TauCeti.expSMulHom` | signature at the pin | `(hx : IsNilpotent x) : Multiplicative R →* Aˣ`; `IsNilpotent.exp : A → A` | "takes a nilpotence proof and lands in the units" correct | none |
| §4.2, clause (iv) of *Arithmetic Hyodo–Kato interface* | clauses (i)–(iv) of the supplier | (i)–(iii) are the `W(k̄)` base changes; (iv) is the `B_st⁺` identification with `N_left=(e⁻¹N_raw)⊗1+1⊗N_p` | clause number and content agree | none |
| §4.5, *Rational normalization of Hyodo–Kato monodromy* | `e=1`; Tate witness `φ=diag(1,p)`, `N=E₁₂` | `N_norm=N_raw/e` both sides; `Nφ=pE₁₂=pφN`; reversed relation gives `E₁₂=p²E₁₂`, false | convention equal to the supplier's `N_HK,p=e_K⁻¹N_raw`, `Nφ=pφN` | none |
| §4.12 `*Needs:*` (sample), Hodge–de Rham theorem of §2.14 | genus 0, genus 1 | `g=0`: `V=0`, `Fil¹=0=H⁰(Ω¹)`; `g=1`: `dim V=2`, weights 0, −1 once each, `dim Fil¹=1=h^{1,0}` | the first theorem of §2.14 is the one used | none |
| §2.24 full-faithfulness input | finite free BKF modules | supplier §AI.2.2: `M↦(T,Ξ)` fully faithful on finite free objects; classification is §AI.2.3 | title and section agree | none |
| Supplier contract, §AI.7.2 titles | `𝔽_p` | *Bökstedt periodicity*: `π_*THH(𝔽_p)=𝔽_p[u]`, `|u|=2`; the two other titles define `THH`, `φ_p`, `X^{t𝕋}` | three titles present in §AI.7.2 | none |

Rows for statements the diff leaves untouched stand as in the previous review, of fff3df0.

- Remark, no change asked: HodgeTateAndCanonicalSubgroups (open) cites `CohomologyComparisons` §2.15; the id survives as the run-in target "**2.15 Hodge–Tate degeneration.**" at line 440.
- Cross-roadmap citations resolved at AInfCohomology's open head: 14 target titles, each in the section cited (§AI.0.1 two, §AI.0:integral.1 one, §AI.2.2 one, §AI.6.4 two, §AI.6.5 five, §AI.7.2 three); 31 `Layer 2.n (title)` citations compared with the headings and run-in titles of Layer 2, all equal.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to `lake-manifest.json`): `TauCeti.expSMulHom` (`TauCeti/RingTheory/Nilpotent/Exp.lean:249`), `TauCeti.PadicTateTwist.finrank` (`TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean:201`), `inter_mem_spaRationalFamily` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.lean:250`), `WittVector.frobeniusEquiv_symm_teichmuller` (`TauCeti/RingTheory/WittVector/Frobenius.lean:49`), `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`), `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`), `IsNilpotent.exp_add_of_commute` (`Mathlib/RingTheory/Nilpotent/Exp.lean:77`), `AdicCompletion.isAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Completeness.lean:181`).
- Seeded sample (0.3, 1.2, 1.7, 1.10, 2.18, 2.22, 4.3, 4.8, 4.10, 4.12, 5.2, 5.5, 5.6, 5.10, 6.4a): only §4.12 lies in a changed passage, by its `*Needs:*` line (row above); no source locator changed, so none was read again.
- Title and description against the head: the title is the README's; "adds the new roadmap folder" (1530 insertions, 0 deletions, three files), "declares nothing" (empty namespace), the four main results (§§3.3–3.5 and 5.3–5.4, 4.3, 4.10, 6.3), the three consumers (Downstream consumers, line 1443) and the Mathlib coefficient rings all hold; no section number, pin or supplier name the change touched is quoted.
- Gate at 830e424, run again: every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2248 edges, 0 problem(s)`; CohomologyComparisons is at merge-order line 183, AInfCohomology 83, PrismaticCohomologyPartIV 136. No file changes outside the folder against the base.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; the file declares nothing, so the binder check and the one-tactic probe have nothing to test.

Overlap check: read AInfCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV; nothing shared (AInfCohomology's *Canonical rational comparison and descended map agreement* leaves the filtered enhancement over `C` to this roadmap; the overlap list reports no dropped id, no second copy and no other pull request changing this folder).

Source independence: changed passages only; the changed passages cite no source and change no source locator, so 0 passages were compared with 0 sources; the new wording was read beside the AInfCohomology targets it cites and shares only their titles; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- none.

## Source issues

- none

## For the human reviewers

- none
