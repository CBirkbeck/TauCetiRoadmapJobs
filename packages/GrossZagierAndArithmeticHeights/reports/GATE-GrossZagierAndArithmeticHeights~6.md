# GATE-GrossZagierAndArithmeticHeights~6

## H01 (CBirkbeck) — applied

§2.11 (`TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`) used to assume (C),(H) and build the symbol only by contracting the g>0 Arakelov kernel of §2.8. It now holds on every compact connected Riemann surface. For deg b=0, a degree-zero Green function g_b is harmonic off |b| with ddᶜg_b=−δ_b, unique up to a constant, and ⟨a,b⟩_v:=−2Σn_i g_b(x_i). The outline proves existence (cutoffs plus the compact Green operator of ComplexComparisonPartII C5.3, since ∫ω=deg b=0), the principal law (g_{div f}=−log|f|), symmetry (Green's second identity), uniqueness (Jac(C) is compact, and a point in genus 0), and the logarithmic-singularity law that §7.19 consumes. The g>0 Arakelov presentation (Σm_j g_Ar(y_j,·) is a degree-zero Green function of b) and the genus-zero principal-divisor/Weil-reciprocity presentation are now separate API bullets. The Gross–Zagier locator states the symbol for an arbitrary compact Riemann surface (gz86 lines 478–491, pp. 236–237).

The same pattern is repaired at four other places:
- **Line 47.** The convention now says that the complex symbol needs no probability form and covers genus-zero curves.
- **§7.17.** A clause now states that no genus condition is imposed.
- **§2.9.** *Needs* now cites the C5 Green operator for the Green equation against c₁(ξ̂), with §2.8 kept only for the Arakelov instance.
- **Supplier table.** The ComplexComparisonPartII row now lists §2.11 as a consumer.

§§7.68 and 7.87 consume §2.11 through §7.17 and needed no edit. §§2.5–2.8, 2.10, 2.12 and 2.13 are genuinely g>0, or genus-free at finite places, and are unchanged.

Two Checks were added to §2.11:
- **Weil reciprocity on ℙ¹.** For a=(1)−(2) and b=div t, both orders give −2log 2; the unsquared convention gives −log 2.
- **Reviewer's scope case.** N=2, D=−7, k=4, LMFDB 2.8.a.a, with −7≡1 mod 8, so 2 splits and (C),(H) hold. With the Hauptmodul t=(η(z)/η(2z))^24 (simple pole at ∞, simple zero at the cusp 0), ⟨(x)−(∞),(x′)−(0)⟩=log|t(x)−t(x′)|²−log|t(x)|². This matches the normalizations of §§7.17 and 7.68 at N=2.

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Existence/uniqueness of g_b (§2.11) | genus 0, b=(0)−(∞) on ℙ¹; b=0; deg b=1 | g_b=−log\|t\|+c; g_0=const; deg 1: ∫ω=1≠0, so no solution (masses 0 vs −1) | holds for deg 0, fails for deg 1 as it should | degree-zero hypothesis kept |
| Principal law, squared | ℙ¹, a=(1)−(2), b=div t | −2(−log\|t\|) at 1 and 2: log1−log4=−2log2 | agrees with Σn log\|f\|² | none |
| Symmetry | same pair, reversed: a=div((t−1)/(t−2)) | f(0)=1/2, f(∞)=1, so log(1/4)=−2log2 | symmetric | Check added |
| Unsquared wrong model | same | −log2 ≠ −2log2 | excluded by Check | Check kept/added |
| Arakelov presentation (g>0) | ddᶜ_y Σm_j g_Ar(y_j,y) | Σm_j(μ_Ar−δ_{y_j})=(deg b)μ_Ar−δ_b=−δ_b | is a degree-zero Green function | API bullet |
| Log-singularity law | b with mult m at x | ⟨(y)−(y₀),b⟩=−2g_b(y)+2g_b(y₀); −2(−m log\|z\|)=m log\|z\|² | continuous after subtracting m log\|z\|²; matches §7.19's subtraction of ord·ord·log\|g\|_v with \|·\|_v=\|·\|² | none |
| ddᶜ normalization | log\|z\| on ℂ | (i/π)∂∂̄ log\|z\| = (i/π)(¼)(2πδ)(−2i)dx∧dy = δ | ddᶜg_b=−δ_b with g_b~−m log\|z\| is consistent | none |
| N=2 Check vs §7.17 (2.3d) | x′→∞; x→0; x→∞ | log\|t(x′)\|²=4πy′+O(1); t(w)=2¹²/t(−1/(2w)), so −log\|t(w)\|²=4π Im w/(2\|w\|²)+O(1); G→log1=0 | matches 4πy′, 4πy/(N\|z\|²) with N=2, and §7.68's zero limit at ∞ | Check added |
| (C),(H) at N=2, D=−7 | parity, coprimality, splitting | −7 odd, gcd(7,2)=1, −7≡1=1² mod 8; (−7/3)=(2/3)=−1 so r_A(3)=0 | all hold; disjoint branch | Check added |
| X₀(2) genus | genus formula | g=1+μ/12−ν₂/4−ν₃/3−ν∞/2 with μ=3, ν₂=1, ν₃=0, ν∞=2: 1+1/4−1/4−0−1=0 | μ_Ar would divide by 2g=0 | scope Check |

### Ownership and citations

§2.11 remains owned here; this is the reviewer's own recommendation, and HeightsRationalPointsAndObstructions §§0.22–0.24 supply point-metric functions, not this curve symbol. The new *Needs* `ComplexComparisonPartII:C5/harmonic-projection-green` was resolved at the head of its open roadmap pull request: §C5.3 supplies the harmonic projection and Green map on compact boundaryless manifolds, its Checks include ℙ¹, and ComplexComparisonPartII is earlier in the merge order. The LMFDB page 2.8.a.a is a new locator under the existing `lmfdb` key. The manifest is outside the files this job may edit, so the worker should add that locator to `cited_for` (§2.11). `Suggested.lean` is unchanged: the symbol is not among its headline statements. No `#check` comparison was needed because no Lean declaration changed.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: Build completed successfully (8981 jobs). The only message is the expected `declaration uses 'sorry'` at Suggested.lean:38:8.
- Gate, after commit `07a320c6`: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
