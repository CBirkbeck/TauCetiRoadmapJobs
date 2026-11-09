# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at d35fbb7)

**Verdict:** needs changes

This is an incremental re-review of the 37 lines changed since 0e699b2. The five folder findings of the previous review (R01–R05) are repaired, and the repairs introduce no new problem. One finding remains: R06, about the pull-request description, is not repaired. It is P3, does not block, and needs no edit to the folder. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` (written `:N`) unless `Suggested.lean` is named.

## R01 (P3) — The pull-request description still contradicts the README (carried from the previous review's R06, not repaired)

**Location.** The description is unchanged. It still says:

- "…take rank-one Hecke continuation and the global standard L-function from here";
- "The common adelic Tate/Fourier prefix and the rank-one scalar comparison are consumed from ArithmeticGaloisRepresentations §2.7";
- that #248 (LFunctions) and #253 (ZerosOfLFunctions) "must merge first, and the merge-order block below lists them";
- that #785 (ReductiveGroupsPartII) is among "open pull requests of ours".

**Claim.** The description misstates ownership and dependencies, and the human who gives final approval reads it.

**Witness.**

- `:2501` says the consumers' "rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- `:11` gives the local and adelic Fourier analysis to AnalyticNumberTheoryPartII §§5.3g–5.3h and the local zeta integral to its §5.3j.
- `TauCetiRoadmap/LFunctions`, `TauCetiRoadmap/ZerosOfLFunctions` and `TauCetiRoadmap/ReductiveGroupsPartII` are folders on main (39d3d60).
- The merge-order block lists neither #248 nor #253.

**Repair.** Edit only the description; the folder needs no change.

- Change "take rank-one Hecke continuation and the global standard L-function from here" to "take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a".
- Replace the §2.7 sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7".
- Delete the LFunctions/ZerosOfLFunctions sentence.
- Drop ReductiveGroupsPartII from the list of open pull requests.

**Tested.** After these edits, every statement left in the description matches `:11`, `:25` and `:2501` and the folders on main.

## Previous findings

- R01 — repaired: `:326` "U=ℤ·1 is closed but not compact; its annihilator is ℤ·1 (AL.0.1.3), which is not open, so compactness of U cannot be dropped"; `:439` "the compact-support hypothesis cannot be dropped". AL.0.1.4/AL.0.1.11 now assume joint continuity.
- R02 — repaired: `:1212` and `Suggested.lean:288–293` say the GJ theorem gives the rank-one equation with continuations identified only on `Re s > c`, "so neither statement implies the other".
- R03 — repaired: `:1888` cites Lecture 9 §5 for equal or adjacent ranks and "the outline of the completed-tensor extension … which that text does not carry out"; Gelbart–Shahidi Theorem 4.1 and Corollary 4.2 cover all ranks.
- R04 — repaired: `:2323` now ends "…; **ArithmeticGaloisRepresentations**, §2.7, Local constants." Both "AL.4 conditional … comparison" entries are gone. Neither phrase occurs anywhere in the README.
- R05 — repaired: `:1002` "`ρ(ω|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(ω)` with `ρ₀(ω) = 𝔤(ω, ψ)^{−1}` for a ramified character `ω` of conductor `𝔣 = P^c` normalized by `ω(ϖ) = 1`, hence unitary."
- R06 — not repaired: the description still says the consumers "take rank-one Hecke continuation and the global standard L-function from here". It is carried as R01 above.

## Verified sound

### Gate, dependency check, scope and elaboration (run on this head)

**Gate.** `gate … --base origin/main` printed the following line and exited 0. The worker's own run also reports `build=0`.

```text
gate AutomorphicLFunctionsAndLocalFactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check.** It printed `depcheck: 239 roadmaps, 2340 edges, 0 problem(s)` and exited 0.

- There is no UPWARD, CYCLE or `moved:` line.
- This roadmap is at line 94 of the merge order.
- The two `*Needs:*` lines that changed (`:331`, `:2323`) cite only Mathlib names, targets of this README, and ArithmeticGaloisRepresentations §§2.4, 2.5 and 2.7. ArithmeticGaloisRepresentations is an earlier supplier in the merge order.

**Scope.**

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.**

- `lake env lean` on `Suggested.lean` exits 0 in 6.5 s.
- It prints exactly 14 `declaration uses sorry` warnings and nothing else, at lines 75, 80, 91, 125, 138, 164, 222, 294, 370, 386, 432, 527, 610 and 686. These are the previous lines, shifted by 4 after the docstring at 288.

**`#check @` audit.**

- I re-ran `#check @` on `AL2.godementJacquetLocal` and `TateZeta.localZetaIntegral_functionalEquation` in a scratch copy. All instance and hypothesis binders are present.
- The two `signatures.md` leads (`hbesselK`) are the false positives already explained in the previous report: `hbesselK` appears as an anonymous premise.
- No statement changed, so the other 31 elaborated types are as the previous audit recorded them.

**One-tactic probe.** On a scratch copy, `first | rfl | simp | infer_instance | trivial | norm_num | decide | omega` left unsolved goals at all 14 `sorry`s. There is no padding by the probe.

**Mathlib names newly cited, checked at the pin with `#check`:**

- `isOpen_lt`: `Continuous f → Continuous g → IsOpen {b | f b < g b}`, for an order-closed target;
- `generalized_tube_lemma`: compact `s`, compact `t`, open `n ⊇ s ×ˢ t` give open `u ⊇ s`, `v ⊇ t` with `u ×ˢ v ⊆ n`; it is used with `t = {w₀}`;
- `IsLocallyConstant.continuous`;
- `IsLocallyConstant.iff_exists_open`;
- `ZMod.toCircle` and `ZMod.toCircle_apply`, which give `exp(2πi·j.val/N)`, so `toCircle 1 = −1` for N=2;
- `IsTopologicalAddGroup`, `Real.fourierChar`, `fourierIntegral_gaussian`, `AddChar.map_add_eq_mul` and `VectorFourier.fourierIntegral_comp_add_right`.

`IsLocallyConstant.isOpen_fiber` was dropped from `:331`, and no other passage uses it for AL.0.1.4.

### The changed passages

**AL.0.1.4 (`:318`).**

- U is a native additive subgroup by the pairing data (`:264`), so the image of `u↦ψ(L(u,w))` is a subgroup of the circle.
- The "no subgroup in the right half-plane" step is correct. For 0<|θ|<π/2, the least k with k|θ|≥π/2 has (k−1)|θ|<π/2, so π/2≤k|θ|<π and `cos(kθ)≤0`. For θ=0.4π: k=2 and cos=−0.809. For θ=0.1: k=16, kθ=1.6 and cos=−0.0292.
- The conclusion uses no group topology on W, as the text says.

**AL.0.1.11 (`:431`).** The inference is sound:

- AL.0.1.4 gives `U⊥` open;
- AL.0.1.10 (`:415`) gives `Ff(w+a)=Ff(w)` for `a∈U⊥`;
- translation is a homeomorphism of W;
- `IsLocallyConstant.iff_exists_open` closes the argument.

Nothing else in the README cites AL.0.1.4 or AL.0.1.11 by number or title; the only citation is AL.0.1.11's own `*Needs:*` at `:443`.

**AL.1.3.5 (`:1002`, `:1006`).**

- I recomputed Tate's local equation directly on ℚ₃ for the quadratic unit character, with ω(3)=1, ψ(x)=exp(−2πi{x}₃) and ν=0. With f=1_{1+3ℤ₃}, Z(f,ω,s)=m, where m is the multiplicative volume of 1+3ℤ₃.
- `f̂=(1/3)ψ·1_{(1/3)ℤ₃}`. Only valuation −1 contributes, so `Z(f̂,ω⁻¹,1−s)=(1/3)3^(1−s)·m·(e^(−2πi/3)−e^(−4πi/3))=m·(−i)·3^(1/2−s)`.
- Hence γ=−i·3^(1/2−s) and ρ=1/γ=i·3^(s−1/2). This is the Check's value, and it agrees with formula (ii) and with `𝔤=−i`.
- The convention ρ=γ⁻¹ is the one that reproduces the unramified value printed at `:1002`. With ν=1, q=3 and s=0.3, `3^(−0.2)(1−3^(−0.7))/(1−3^(−0.3))=1.53396=1/γ`. The reverse convention gives the reciprocal.
- For a general ramified ω, `𝔤⁻¹=conj 𝔤=ω(−1)N𝔣^(−1/2)Σ_ε ω(ε)ψ(ε/ϖ^(ν+c))`. Tate's test function `ψ·1_{ϖ^(−ν−c)O}` has transform supported on `−1+𝔣`, which gives the same `ω(−1)` factor, so ρ₀=𝔤⁻¹ in general.
- The supplier's standard character is `ψ_(ℚ_p)(x)=exp(−2πi{x}_p)` (ArithmeticGaloisRepresentations README line 502, at its open head). Its worked sum `−i√3` (line 2318) matches.

**`AL2.godementJacquetLocal` docstring (`Suggested.lean:288–293`) and `:1212`.**

- At Lean `n=0`, the equation `Zd(1−s)·Pd(q^(s−1)) = ε(q^(−s))^k·Z(s)·P(q^(−s))` gives `γ=εq^(−ks)P(q^(−s))/Pd(q^(s−1))`, as written.
- For χ=1, Φ=1_O and ν(ψ)=0 (P=Pd=1−T, ε=1, k=0, q=5, s=0.7), this gives 1.764826, equal to `L(1−s)/L(s)`.
- In the Lean statement, both Z and Zd are tied to their integrals only on `c < s.re`, as both texts now say.
- The README's index is the rank and the Lean index is the rank minus one (`GL (Fin (n+1))`). So README n=1 and Lean n=0 are both rank one, with determinant exponent s in both: `s+(n−1)/2` against `s+n/2`.

**Strip-bound locators (`:1864`, `:1888`).**

- CogdellFields lines 19–21 put the unramified calculation in Lecture 7, the archimedean case in Lecture 8 and global L-functions in Lecture 9.
- Lines 3341–3372 (printed pp.72–73) give the strip bound through finite K-finite realizations only for m=n and m=n−1.
- Lines 3373–3382 outline m<n−1 and leave it unwritten. Lines 3383–3386 defer to Gelbart–Shahidi.
- GelbartShahidi2001 line 34 says its L-functions are completed. Lines 445–450 state Theorem 4.1 on printed p.87. Lines 492–493 state Corollary 4.2 on printed p.88: `s(s−1)L(s,π×π′)` is bounded on every finite vertical strip for cuspidal π, π′ of GL_n and GL_p in all ranks.
- Both locators are therefore correct. The `GL₄×GL₂` Check at `:1886` is m=n−2, covered by Gelbart–Shahidi and not by Cogdell, as the new text says.

**AL.4.2.1 `*Needs:*` (`:2323`).** All seven entries resolve:

- AL.R.2 at `:601`, AL.2.1.4 at `:1199`, AL.3.2.3 at `:1527` and AL.4.1.1 at `:2278`;
- ArithmeticGaloisRepresentations §2.4 "Arithmetic Weil–Deligne adapter" at its line 1978, §2.5 "Local factors" at 2081 and §2.7 "Local constants" at 2266, at its open head.

The compatible arithmetic realization stays a stated hypothesis at `:2317`.

**Anchors in the changed AL.1.3.5 paragraph.** `#standard-test-function-evaluations` and `#local-constant-gauss-sum` resolve to the ArithmeticGaloisRepresentations headings at its lines 2332 and 2272.

### Seeded sample: Check for the theta-Mellin formula (AL.3.5.1, `:1707–1709`; untouched, re-read)

- CogdellColumbia lines 256–267 (§1.1.3, printed p.4) define the theta series and `E(g,s;Φ,η)=|det g|^s∫Θ′_Φ(a,g)|a|^(ns)η(a)d×a` for Re(s)>1, with the ξ=0 term removed.
- Lines 273–289 (printed p.5) give continuation, the poles, the functional equation and the `P′=P_(n−1,1)` section sum.
- The Check gives `3¹·5·2^(2·1)=60`; dropping n gives `3·5·2=30`.
- The central-character API bullet holds: substituting a↦az⁻¹ gives `|z|^(ns)·|z|^(−ns)η(z)⁻¹`.
- The locator "§1.1.3, pp.4–5" is correct. The README flags no locator as unverified.

### Adversarial table

Rows for statements the diff leaves untouched are carried from the previous report (r15, at 0e699b2) with its values. Rows marked **new** were computed this round.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| **new** AL.0.1.4, theorem under joint continuity | U={0}; ℚ_p, U=ℤ_p, ψ standard | U⊥=W, open; U⊥=ℤ_p, open | Pass |
| **new** AL.0.1.4, circle lemma | θ=0.4π; θ=0.1 | k=2, cos(0.8π)=−0.809; k=16, cos(1.6)=−0.0292; both ≤0 | Pass |
| **new** AL.0.1.4 Check `:326` | ℝ, ψ=e, U=ℤ | U⊥=ℤ (`e(nw)=1` for all n iff w∈ℤ), not open; U not compact, so only compactness fails | Pass |
| **new** AL.0.1.4 Check `:327` | ℤ/2, V discrete, W indiscrete, U=V | `toCircle 1=exp(πi)=−1`; U⊥={0}; W's opens are ∅ and W; `{(0,0),(0,1),(1,0)}` is not open in V×W, so the pairing is not continuous | Pass |
| **new** AL.0.1.11 | ℚ_p, f=1_{ℤ_p}, self-dual μ; ℝ, U={0} | Ff=1_{ℤ_p}, constant on ℤ_p-cosets; f supported in {0} gives Ff≡f(0)·0=0 | Pass |
| **new** AL.0.1.11 Check `:439` | `e^(−πx²)`, ψ=e(x), Lebesgue | `fourierIntegral_gaussian` with b=π, t=−2πy gives `e^(−πy²)`; Ff(0)=1, Ff(1)=0.043214; support ℝ ⊄ {0} | Pass |
| **new** AL.1.3.5 ρ, ramified (`:1002`) | ℚ₃ quadratic, ω(3)=1, ν=0, f=1_{1+3ℤ₃} | direct: γ=−i·3^(1/2−s); s=0.3: 1/ε=0.80274i, `3^(s−½)/𝔤`=0.80274i; wrong model ρ₀=𝔤 gives −0.80274i | Pass |
| **new** AL.1.3.5 ρ, unramified | q=3, ν=1, s=0.3 | `3^(−0.2)(1−3^(−0.7))/(1−3^(−0.3))`=1.53396; 1/γ=1.53396 | Pass |
| **new** AL.1.3.5 Check `:1006` | the same ℚ₃ datum | 𝔤=3^(−½)(e^(−2πi/3)−e^(−4πi/3))=−i (numerically −1.0000i); Tate's ψ_p=e(+{x}) would give +i | Pass |
| **new** GJ docstring γ at n=0 (`Suggested.lean:288–293`) | χ=1, Φ=1_O, ν(ψ)=0, q=5, s=0.7 | `P(q^(−s))/Pd(q^(s−1))`=1.764826; `L(1−s)/L(s)`=1.764826; ν=1 gives ε₀=q^(½), k=1 | Pass |
| **new** "neither implies the other" (`:1212`, Lean) | χ=1, f=1_O | rank one asserts integrability at s=½ (0<½+0); GJ at n=0 holds with c=5 and is silent at s=½; rank one states no P or monomial ε | Pass |
| **new** AL.3.9.2 / AL.3.9.4 locators | CogdellFields 3357–3386; GelbartShahidi2001 445–450, 492–493 | Cogdell: m=n and n−1 done, m<n−1 outlined; GS: Thm 4.1 p.87, Cor 4.2 p.88, all n and p; `GL₄×GL₂` (m=n−2) covered by GS only | Pass |
| **new** AL.4.2.1 *Needs:* | heading scan | 7 entries, 7 resolved (4 here, 3 at the ArithmeticGaloisRepresentations head); 0 occurrences of "AL.4 conditional" | Pass |
| AL.3.5.1 theta–Mellin (sample, re-read) | point mass, n=2, \|det\|=3, θ=5, \|a\|=2, s=1 | 60; 30 without n; source `\|a\|^(ns)` | Pass |
| `AL0.pointSupported_finiteJet` (r15) | T=δ₀′ on ℝ, f=x·e^(−x²); T=0 | f(0)=0, f′(0)=1, δ₀′(f)=±1: N=0 fails, N=1 works | Pass |
| `AL0.BesselHalfOrderDerivative` (r15) | c=1 | 0.166597 both sides | Pass |
| `AL0.BesselLaplaceMellin` (r15) | m=1, t=0.3, s=1.2 | quadrature 0.03091; closed form 0.030923 | Pass |
| `hbesselK` vs AnalyticNumberTheoryPartI `besselK` (r15) | its Suggested.lean:626 | identical bodies | Pass (`rfl`) |
| `archimedeanEigenSpace` convention (r15) | ℝ, χ(a)=a⁻¹ | δ₀′ scales by a⁻¹; χ=1 gives δ₀ | Pass |
| `finiteEigenSpace_finrank` (r15) | χ=1; χ=\|·\|⁻¹ | ℂδ₀; `L(−1,1)=(1−q)⁻¹` finite, dimension 1 | Pass |
| `localZetaIntegral_functionalEquation` (r15) | 𝔽₃((t)), χ=1, f=1_O | Z=(1−3^(−s))⁻¹ on Re s>0; γ=(1−3^(−s))/(1−3^(s−1)) | Pass |
| `hmod` pins a (r15) | x=0; x=ϖ | a(0)=0; a(ϖ)=q⁻¹ | Pass |
| `archimedeanLocalFunctionalEquation` (r15) | ℝ Gaussian; ℂ `e^(−2πzz̄)` | Γ_ℝ(s); `(2π)^(1−s)Γ(s)=πΓ_ℂ(s)` | Pass |
| `AL2.godementJacquetLocal` statement (r15) | trivial GL₂ rep, Φ=1_{M₂(O)} | `(1−q^(−s−½))⁻¹(1−q^(½−s))⁻¹`, Re s>½; P(0)=1 | Pass |
| GJ dual transform (r15) | `fourierIntegral … (−Y)` | `∫ψ(tr XY)Φ`; exponent (1−s)+n/2 | Pass |
| `casselmanNewvector` (r15) | unramified PS; Steinberg; n=c−1 | n+1; n; 0 | Pass |
| `newvectorLevelExists`, `hinf` (r15) | ramified χ∘det, GL₂(ℚ₃) | χ(2)=−1, no fixed vector; excluded | Pass |
| `localK1 F 0` (r15) | unit ideal | GL₂(O) | Pass |
| `whittakerUniqueness` (r15) | GL₁; trivial GL₂ rep | rank 1; rank 0 | Pass |
| `rsIntegrand` representative-independence (r15) | y′=yu | ψ(u⁻¹)ψ⁻¹(u⁻¹)=1 | Pass |
| W̃ character (r15) | `w ᵗu⁻¹ w⁻¹` | superdiagonal −u_{i,i+1}; ψ⁻¹-Whittaker | Pass |
| `rankinSelbergLocal` exponent (r15) | GL₂×GL₁ point masses | 12; 24 with exponent s | Pass |
| `rankinSelbergLocalEqualRank` (r15) | GL₁×GL₁, Φ=5, \|det\|=2, s=1 | 60 | Pass |
| AL.3.2.3 Check, ramified (r15) | ℚ₃ quadratic | 3/2 at s=1; rootwise product 1 | Pass |
| `genericNewform` (r15) | GL₁, c=1; χ∘det of GL₃ | a line; excluded by `hwhit` | Pass |
| AL.3.5.2 residues (r15) | n=2, g=1, η=1 | −κΦ(0)/2; κΦ̂(0)/2 | Pass |
| AL.1.3.1 Check (r15) | ℚ₃, ψ₀(3·), ν=1 | 𝔤=−i; ε=−i·3^(1−2s); −3i at s=0 | Pass |
| AL.1.6.1 Check (r15) | χ₄ over ℚ | Gauss sum −2i; product 1 | Pass |
| AL.0.3.1 alternating Check (r15) | 𝔽₃((t)), a=(t⁻¹,0) | f̂̂(a)=1, f(−a)=0 | Pass |
| AL.0.3.1 Mat₂ Check (r15) | ν=1 | vol 3⁻²; scalar volume gives 27 | Pass |
| AL.2.1.8 (r15) | factorization | (qα−β)(α−qβ) | Pass |
| AL.1.4.4 table (r15) | real discrete, k=2 | ε=−1; shift ½ | Pass |
| AL.2.2.4 central character (r15) | g∈K₀(p^c) | last row (g₂₁,1) | Pass |
| AL.3.10.3 Check (r15) | ℙ¹/𝔽₃, t²+1 | q_v=9; ε∝(z²)⁻¹ | Pass |
| AL.3.12.2 degrees (r15) | χ(V⊗V∨) | h¹=(2g−2)n²+2d | Pass |
| AL.3.16.1 (r15) | r=0.7 | 0.21911 | Pass |
| AL.5.4.1 (r15) | p=3, k=0, j=1, α=1 | −4/3 | Pass |
| AL.5.2.2 (r15) | y²=x³−x, p=3 | a(3)=0; a_α(3)=−3≠1 | Pass |

### Ownership and overlaps

- The changes add no object. They only rescope two Fourier lemmas, rewrite locators and Checks, and delete two `*Needs:*` entries.
- `overlaps.md` lists no open pull request that changes this roadmap, no id this README cites that another pull request drops, and no id defined only by an open revision.
- The citation leads in `citations.md` are this roadmap's own `Suggested.lean` names (the gate's `readme-ids-missing=0` confirms they are declared) and the supplier names that the previous report resolved. No cross-roadmap citation is unresolved.
- The previous report's ownership checks against the closest open roadmaps stand unchanged.

### Remarks (no change requested)

- The new Check at `:327` writes `ZMod.toCircle` without backticks, as the untouched Check at `:280` does. The name is unambiguous and nothing depends on it.

## Not verifiable

- **Tate's thesis** (the scan listed in References). The sources cache has no extracted text of it, and OCR is unavailable on this worker. The new AL.1.3.5 text rests on ρ=γ⁻¹. I pinned that convention instead by the unramified value the README prints and by the direct ℚ₃ computation in the table. I did not compare it with Tate's printed formula for ρ₀.
- **Ownership against every open pull request.** I checked it only through `overlaps.md` and the previous report's targeted searches. The changed passages introduce no new object, so I ran no new search.

## Source issues

- **Misprint** in CogdellFields at Lecture 9 §5, printed p.73: the archimedean equal-rank sum writes the second Whittaker function with a stray trailing "y" after its index; it should be W′_{v,i}; affects nothing.
- **Misprint** in CogdellFields at Lecture 9 §5, printed p.73: the sentence concluding the K-finite cases reads "the there are" finite collections of cusp forms; it should read "then there are"; affects nothing.
