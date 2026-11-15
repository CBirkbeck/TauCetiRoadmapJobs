# Review of PrismaticCohomologyPartIII (pull request #1070 at dd23fb3)

**Verdict:** needs changes

Incremental re-review of the 6 lines changed since cc1571e (all in the README), and the first check of the title and description against this head. The previous finding is repaired and the three changed passages are sound; the one finding is the gate's `statement-hygiene` failure in `Suggested.lean`.

## R01 (P3) — `letI` in the signatures of two theorems (gate `statement-hygiene`, 2 hits)

**Location:** `TauCetiRoadmap/PrismaticCohomologyPartIII/Suggested.lean` lines 69 and 89: "`letI := HasExt.standard (Sheaf X.smallEtaleTopology AddCommGrpCat.{u + 1})`" in `etale_comparison_perfectoid` and `etale_cohomology_vanishes_above_one`.

**Claim:** The gate refuses a `letI`/`haveI` in a signature; it fails at this head with `statement-hygiene=2`, so the folder cannot be accepted. The elaborated types already drop the `letI`, so the instance each statement is about is not visible in it.

**Witness:** Gate at dd23fb3: "line 69: P3 `letI` in the signature of theorem `etale_comparison_perfectoid`", "line 89: P3 `letI` in the signature of theorem `etale_cohomology_vanishes_above_one`".

**Repair:** Delete lines 69 and 89, and add to each theorem, as its last binder before the colon (after `(n : ℕ)` in the first, after `(hξ : IsUnit (ξ.coeff 1))` in the second):

```lean
    [HasExt.{u + 1} (Sheaf (Spec (.of (Localization.Away (p : perfectoidQuotient p S ξ)))).smallEtaleTopology
      AddCommGrpCat.{u + 1})] :
```

Tested on a scratch copy: it elaborates with the same three `sorry` warnings and nothing else, and the gate's scanners give `statement-hygiene=0` on it. `HasExt` is `Prop`-valued (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` line 55) and `HasExt.standard` (line 92) discharges it, so the statement is unchanged.

## Previous findings

- R01 — repaired: line 852 "finite-projective φ-modules over the extended Robba ring of `C^♭` (PhiGammaModulesAndIwasawaCohomology §1.0b, the ring `R̃` of SW20 Definition 13.4.3 that AInfCohomology §AI.2.3 also uses)"; line 60 carries the same parenthesis.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.11 proof route (reworded): `p(m−i) ≥ m+1` iff `m ≥ (pi+1)/(p−1)`; chain `φ_i(N^{≥m}) ⊂ ξ^{p(m−i)} ⊂ N^{≥p(m−i)}` | `(p,i,m)` = (2,1,3), (2,1,2), (3,1,2), (2,0,1), (2,0,0) | bound 3: `p(m−i)=4=m+1` holds; `2<3` fails, as it must below the bound; bound 2: `3=m+1` holds; bound 1: `2=m+1` holds; `m=0`: `0<1`, and `φ−1` on `Δ̂/p` has kernel ⊇ `F_p` | consistent with the statement; the bound implies `m>i`, so the integral inclusion (needs `m ≥ i`) applies | none |
| §6.11 route against BMS2 Lemma 7.22 | BMS2 lines 2197–2218 (printed pp.52–53) | hypotheses (perfectoid `C` of characteristic 0, `A` p-torsion-free quasisyntomic over `O_C`), `ξ̃=φ(ξ)`, `ξ̃≡ξ^p` mod `p`, `ξ^kΔ̂ ⊂ N^{≥k}Δ̂`, target `N^{≥m+1}`: all at the locator | supported; locator "p. 52" correct | none |
| Lines 60 and 852: one extended Robba ring behind both suppliers | PhiGammaModulesAndIwasawaCohomology §1.0b and §1.0c; AInfCohomology §AI.2.3, at their open heads | §1.0b: "the bounded and full extended Robba rings" for perfect uniform `R`, used by §1.0c's `periodModuleBundleComparison R d`; AI.2.3 cites SW20 Definition 13.4.3 for "φ-modules over the extended Robba ring"; at `R=C^♭` both are that ring | clause correct in both places | none |
| `etale_comparison_perfectoid`, `etale_cohomology_vanishes_above_one` under the R01 repair | `S=F_p`, `ξ=p`; `n=0`; elaborated type | `ξ₁=1` unit, `R=F_p`, `R[1/p]=0`: `Spec` empty, all `H^i=0`; `ξ₀=0`, `W=0`, kernel and cokernel 0; `n=0`: `ZMod 1` and `W(T)/(1)` both 0; binder elaborates to `[CategoryTheory.HasExt (Sheaf (Spec …).smallEtaleTopology AddCommGrpCat)]` | both sides agree; statement unchanged by the repair | R01 |

Rows for all other statements stand as in the previous review, of `cc1571e`.

- Gate at dd23fb3 (rerun): every scanner 0 except `statement-hygiene=2`, FAIL (R01); the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The change adds one citation, PhiGammaModulesAndIwasawaCohomology §1.0b (merge order 33, this roadmap 86): downward.
- Elaboration: `lake env lean` on `Suggested.lean`, three `declaration uses 'sorry'` warnings (lines 64, 84, 96), nothing else; the diff changes no Lean line, so signatures and the padding probe stand as in the previous review.
- Source locators read: 1 (BMS2 Lemma 7.22 and proof; the only sampled target in a changed passage is §6.11). Cross-roadmap citations resolved: 3 (PhiGammaModulesAndIwasawaCohomology §1.0b, §1.0c; AInfCohomology §AI.2.3). Library declarations opened: 3 (`HasExt`, `HasExt.standard`; `Sheaf.H` at `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` line 56).
- Title and description against the head: no sentence contradicted and no change left unstated. Checked: a new folder of three files; the five Lean declarations; §§6.4, 6.7, 6.20, 7.22, 7.26 behind the summary's claims; no TC or K-theory input in Layer 6 (the trace identification is §7.0); the consumers of "Why Tau Ceti wants it" against `## Downstream consumers`; the curve imported from PhiGammaModulesAndIwasawaCohomology.
- Nothing changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Remark, no change asked: line 64 still says "The extended Robba ring comes from AI.2.3"; consistent with lines 60 and 852, which say it is the same ring as §1.0b's.
- Overlap check: read PrismaticCohomologyPartII, PrismaticCohomologyPartIV, CohomologyComparisons, AInfCohomology (and PhiGammaModulesAndIwasawaCohomology §§1.0b–1.0c); nothing shared in the changed passages. The extended Robba ring is owned by PhiGammaModulesAndIwasawaCohomology §1.0b and AInfCohomology §AI.2.3, not here; no other roadmap states BMS2 Lemma 7.22.

Source independence: changed passages only; 1 passage compared with 1 source (§6.11 proof route against BMS2 lines 2202–2218: at most 2 consecutive words shared, and the order of the argument is the roadmap's own), none shared; the two other changed passages are supplier citations with no source text. Largest share BS23-FCRYS, about 87 of 227 source mentions; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- SW20 Definition 13.4.3 (lines 60, 852): not read this round; cited by number, and the same locator is in AInfCohomology §AI.2.3.

## Source issues

- none

## For the human reviewers

- none
