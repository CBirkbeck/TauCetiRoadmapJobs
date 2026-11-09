# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 0e699b2)

**Verdict:** needs changes

This is an incremental re-review. It covers the 12 lines changed since 49f4e99, all in `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, at `:282`, `:458` and `:1587–1593`. Line numbers refer to that file unless marked otherwise. `Suggested.lean` is unchanged.

The two folder findings of the previous review are repaired. The repairs introduce no new problem. The only remaining finding concerns the pull-request description, not the folder. It is P3 and does not block.

## R01 (P3) — The pull-request description still contradicts the README (carried from the previous review's R03, not repaired)

**Location:** the pull-request description, which is unchanged. It still says:

- the consumers "take rank-one Hecke continuation and the global standard L-function from here";
- "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument";
- "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7";
- LFunctions (#248) and ZerosOfLFunctions (#253) "both must merge first, and the merge-order block below lists them";
- ReductiveGroupsPartII (#785) is one of the "open pull requests of ours".

**Claim:** The description misstates ownership and dependencies, and the human who gives final approval reads it.

**Witness:**

- `:2500` says "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` gives the Fourier analysis to AnalyticNumberTheoryPartII §§5.3g–5.3h and the local zeta integral to its §5.3j.
- `TauCetiRoadmap/LFunctions`, `TauCetiRoadmap/ZerosOfLFunctions` and `TauCetiRoadmap/ReductiveGroupsPartII` are folders on main (86b3953).
- The merge-order block does not list #248 or #253.

**Repair:** Edit only the description; the folder needs no change.

1. Replace the first sentence with "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
2. Replace the second sentence with "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a."
3. Replace the third sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
4. Delete the LFunctions/ZerosOfLFunctions sentence.
5. Remove ReductiveGroupsPartII from the list of open pull requests.

**Tested:** Each replacement sentence matches what `:11`, `:13`, `:25–27` and `:2500` say at this head.

## Previous findings

- R01 — repaired: `:1587` now reads "Genericity gives a level m with `π^(K₁(P^m))≠0`: this is Jacquet–Piatetski-Shapiro–Shalika, Théorème (5) … For `n≥2` smoothness alone gives no level". The order sentence adds "the existence of c", and `:1589` adds the `χ∘det` Check.
- R02 — repaired: `:282` cites "Mathlib `AddSubgroup.zmultiples`" and `:458` cites "Mathlib `HasCompactSupport.of_support_subset_isCompact`".
- R03 — not repaired: the description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here". It is carried as R01.

## Verified sound

### Gate, dependency check and elaboration (run on this head)

**Gate.**

- `gate … --base origin/main` printed: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. It exited 0.
- The worker's run on the same head also reports `build=0`.

**Dependency check.**

```text
depcheck: 239 roadmaps, 2337 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Diff scope.**

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `git diff 49f4e99 HEAD` touches only `README.md`, with 6 insertions and 6 deletions.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.**

- `lake env lean` on `Suggested.lean` exits 0 in 15 s.
- It prints exactly 14 `declaration uses sorry` warnings and nothing else. They are at lines 75, 80, 91, 125, 138, 164, 222, 290, 366, 382, 428, 523, 606 and 682, the same lines as at 49f4e99.

**Lean audit carried from the previous report.** The file is unchanged since 49f4e99, so the previous report's results stand:

- the `#check @` audit of all 33 declarations found no dropped binder;
- the one-tactic probe failed on all 14 `sorry`s.

I re-read `signatures.md`. Its two leads are the Bessel theorems, and both are false positives: `hbesselK` appears as the anonymous premise `(∀ ν c, besselK ν c = …) →` in the elaborated type of `AL0.BesselHalfOrderDerivative` and of `AL0.BesselLaplaceMellin`.

### The R02 repair, checked at the pin with `#check`

- `AddSubgroup.zmultiples : [AddGroup G] → G → AddSubgroup G`. The probe `(1:ℝ) ∈ AddSubgroup.zmultiples 1` elaborates.
- `HasCompactSupport.of_support_subset_isCompact : [R1Space α] → IsCompact K → Function.support f ⊆ K → HasCompactSupport f`.
- AL.0.1.12 assumes W is Hausdorff, and `inferInstance : R1Space X` from `[T2Space X]` elaborates, so the lemma applies as cited.
- The negative control also elaborates: the multiplicative support of `1_[0,1]` on ℝ is `[0,1]ᶜ`, which is not compact. So the old multiplicative citation was wrong.

### The R01 repair, checked against the sources

**HumphriesGJTests.**

- Line 13: F is any nonarchimedean local field. This matches the README's generality, which includes positive characteristic.
- Lines 63–87 are §2, p.2, which has no subsections, so the corrected locator "§2" is right. Lines 86–87 say every generic irreducible π is isomorphic to an (irreducible) induced representation of Langlands type.
- Lines 129–137 are (3.1) and Theorem 3.2, p.3. They give the existence of a minimal level for the `ω_π(k_{nn})`-isotypic `K₀(p^m)` space and a line at `c(π)`.

**CogdellFields.**

- Lines 2211–2217: the standing hypothesis of Lecture 6 is a unitary generic π over a nonarchimedean local field.
- Lines 2468–2470: ψ is unramified, and f(π) is read off from ε.
- Lines 2474–2497 are Theorem 6.3. Page 53 of the PDF is printed p.49 and page 54 is printed p.50. Theorem 6.3(iii) defines the last-row `K₁(p^t)` and states vanishing for `t<f(π)` and dimension one at `t=f(π)`.
- So "Lecture 6, Theorem 6.3, printed pp.49–50 … for unitary generic π" is exact.

### Build order and consumers of AL.3.3.5

- The new *Needs* entry "AL.3.3.2 … for the existence of c" agrees with the order sentence at `:1587`. It also agrees with `:252`, where AL.3.2.1–AL.3.3.3 precede AL.3.3.5.
- The *Needs* line of AL.3.3.2 at `:1573` does not cite AL.3.3.5, so there is no cycle.
- The rank-two case agrees: AL.2.2.2 at `:1290–1292` already treats the existence of a level as Casselman's theorem for infinite-dimensional π.
- `roadmaps grep 'AL\.3\.3\.5|Generic finite-place newforms|genericNewform'` finds one outside consumer, EndoscopicTransferAndUnitaryTraceComparison. The id is unchanged and the hypotheses are unchanged, since genericity was already assumed, so nothing breaks.
- The overlap index reports no dropped ids and no other pull request that changes this roadmap.

### Seeded sample: Check for the theta-Mellin formula

This is AL.3.5.1, at `:1706–1708`. It is untouched, and I re-read it.

- `CogdellColumbia` lines 264–267 give `E(g,s;Φ,η)=|det g|^s∫Θ′_Φ(a,g)|a|^{ns}η(a)d×a` for `Re s>1`.
- The Check's value is `3¹·5·2^(2·1)=60`. Dropping n gives `3·5·2=30`.
- The locator "§1.1.3, pp.4–5" is correct.
- The README flags no locator as unverified.

### Remark (not a finding)

The board's `sources.toml` entry `CogdellFields` still has locator "Lecture 6, Theorems 6.1–6.2" and `cited_for = ["AL.3.2.3", "AL.3.3.2"]`. The worker may want to add Theorem 6.3 and AL.3.3.5 to it. The folder is unaffected.

### Adversarial table

The rows for the changed statements are new. The rows marked (r13) cover statements this diff leaves untouched, carried from the previous report with its values.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| AL.3.3.5 existence of c (`:1587`, repaired) | `χ∘det` on `GL₂(ℚ₃)`, χ the ramified quadratic character, `c(χ)=1` | `k≡1 mod 3 ⇒ det k≡1 ⇒ χ(det k)=1`, so fixed by `K(P)`; `diag(2,1)∈K₁(P^m)` for all m acts by `χ(2)=−1`, so `π^(K₁(P^m))=0` for every m. π is not generic, so the repaired text asserts nothing | Pass |
| AL.3.3.5 Humphries passage `m≥max(m₀,c(ω_π))` | `χ₁⊞1` on `GL₂(ℚ₃)`, `c(χ₁)=1`; `St⊗χ`, χ quadratic ramified; unramified PS | `m₀=1`, `c(ω)=1`, and `k∈K₁(P)` has `k₂₂≡1`, so `ω(k₂₂)=1`; `m₀=2`, `ω=χ²=1`, `c(ω)=0`, max 2, and the K₀(P²)-line is K₁(P²)-fixed; `m₀=0`, `K₁(P⁰)=GL₂(O)`, spherical line | Pass |
| AL.3.3.5 "for `n≥2` smoothness alone gives no level" | n=1; n=2 | `K₁(P^m)=1+P^m=K(P^m)` at n=1, so smoothness suffices and the restriction to `n≥2` is needed; at n=2, the `χ∘det` row | Pass |
| AL.3.3.5 new Check (`:1589`) | n=3, `χ` of `ℚ₃^×` with `c(χ)=1` | `diag(u,1,1)`: last row `(0,0,1)`, so it lies in `K₁(P^m)`; acts by `χ(u)`, which is −1 at `u=2`; fixed by `K(P)` | Pass |
| AL.3.3.5 *Needs* and order (`:1593`) | AL.3.3.2's *Needs* (`:1573`) | AL.3.2.3, ANTII §5.3g, AL.0.3.1 and SR.3; no AL.3.3.5, so the edge is downward | Pass |
| AL.0.1.1 *Needs* (`:282`) | `AddSubgroup.zmultiples (1:ℝ)`, `ψ=exp(2πi·)` | `U=ℤ`; `U⊥={w : e^(2πinw)=1 ∀n}=ℤ`; `1∈U⊥`, while `e^(πi)=−1` puts `1/2∉U⊥`, as the Check at `:278` says | Pass |
| AL.0.1.12 *Needs* (`:458`) | `ℚ₃`, `f=1_{ℤ₃}`, ψ unramified | `Ff=1_{ℤ₃}`, support `ℤ₃⊆K=ℤ₃` compact, so `HasCompactSupport`; with the multiplicative lemma, `{f≠1}=ℚ₃∖ℤ₃` is not compact | Pass |
| `AL3.genericNewform` (r13) | `St⊗χ`, `c(χ)=1`; unramified PS; GL₁ | c=2; c=0; c=`c(χ)`; finrank 1; ℓ≠0 on the line | Pass (r13) |
| `newvectorLevelExists`, `hinf` (r13) | ramified `χ∘det` without `hinf` | no level, so `hinf` is needed | Pass (r13) |
| `casselmanNewvector` (r13) | unramified PS c=0; St c=1; n=c−1 | `n+1`; `n`; `(c−1)+1−c=0` | Pass (r13) |
| `whittakerUniqueness` (r13) | n=0; trivial GL₂ | rank 1; rank 0; rank, not finrank | Pass (r13) |
| `godementJacquetLocal` (r13) | trivial GL₂, `Φ=1_{M₂(O)}` | `((1−X)(1−qX))^(−1)` at `X=q^(−s−1/2)`; `P(0)=1` | Pass (r13) |
| `localZetaIntegral_functionalEquation` (r13) | `𝔽₃((t))`, χ=1, `f=1_O` | `Z=(1−3^(−s))^(−1)`; `γ=(1−3^(−s))/(1−3^(s−1))` | Pass (r13) |
| `archimedeanLocalFunctionalEquation` (r13) | ℝ, χ=1, Gaussian | `Z=Γ_ℝ(s)`; `γ=Γ_ℝ(1−s)/Γ_ℝ(s)` | Pass (r13) |
| `finiteEigenSpace_finrank`, `archimedeanEigenSpace` (r13) | χ=1; ℝ, `χ(a)=a⁻¹` | `ℂδ₀`; `ℂDδ₀`; dimension 1 | Pass (r13) |
| `pointSupported_finiteJet` (r13) | `δ₀`, `δ₀′`, T=0 | N=0; N=1; empty dsupport | Pass (r13) |
| `BesselHalfOrderDerivative` (r13) | c=1 | `0.166597` on both sides | Pass (r13) |
| `BesselLaplaceMellin` (r13) | m=1, t=0.3, s=1.2 | `0.030923` on both sides | Pass (r13) |
| `rankinSelbergLocal` (r13) | GL₂×GL₁ | `rsWeyl F 0 0=I`; `∏(1−α_iβq^(−s))^(−1)`; 12, not 24 | Pass (r13) |
| `rankinSelbergLocalEqualRank` (r13) | GL₁×GL₁, point mass | `2·3·5·2¹=60` | Pass (r13) |
| AL.3.5.1 theta–Mellin Check (sample) | point mass, n=2 | 60; 30 without n | Pass (re-read) |
| AL.0.3.1, AL.1.3.1, AL.1.2.2, AL.2.1.8, AL.3.6.1, AL.3.16.1–2, AL.3.12.3, AL.3.9.3–4, AL.5 (r13) | as listed in r13 | `ε=−i·3^(1−2s)`; `(qα−β)(α−qβ)`; `1/cosh(πr)`; `−4/3`; `E″(0)=2(log p)²` | Pass (r13) |

## Not verifiable

- **Jacquet–Piatetski-Shapiro–Shalika, "Conducteur des représentations du groupe linéaire", Théorèmes (4)–(5).** This text is paywalled and was not read. The repaired passage cites it through Humphries (arXiv:1903.02031v2, Theorem 3.2) and CogdellFields Theorem 6.3, and I checked both.
- **Atobe–Kondo–Yasuda and Casselman (1973).** Their locators in AL.3.3.5's source line are unchanged and were not re-read.
- **Ownership against the 466 open pull requests.** I checked this only by the targeted search for the changed target's id and names, which found one consumer. I did not read every open roadmap.

## Source issues

- **Misprint** in HumphriesGJTests at Theorem 3.2, p.3: the source says the `K`-fixed space of a ramified representation is empty; it should be the zero subspace; affects nothing.
- **Misprint** in CogdellFields at Lecture 6 §3, just before Proposition 6.5, printed p.49: the source writes the first ε-factor of the double-application identity with arguments π×π; it should be π×π′; affects nothing.
