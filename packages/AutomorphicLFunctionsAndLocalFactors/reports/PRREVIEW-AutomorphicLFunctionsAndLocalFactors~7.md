# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 330bb72)

**Verdict:** needs changes

Incremental re-review of the 141 lines changed since f4dd981 (the diff: equal-characteristic scope of the local targets AL.0.3.1 and AL.1.1.1–AL.1.3.5, the moved-id map, the Hecke strip bound in AL.3.9.4, the restored Checks of AL.0.3.1 and AL.2.4.1, the Lean cleanup). One finding remains, carried from the previous report's R02; it is a pull-request-description edit, not a change to the folder. Every other previous finding is repaired, and the repairs introduce no new defect. The gate passes, the dependency check reports no problem, the file elaborates with `sorry` as its only warning, and the seeded sample is verified below. Line numbers are `README.md` unless marked `Suggested.lean`.

## R01 (P3) — The pull-request description still says rank-one Hecke continuation is built here

**Location:** the pull request's description, paragraph "Why Tau Ceti wants it": "AutomorphicSpectralTheory, the GL₂ and endoscopic transfer roadmaps and DirichletPadicLFunctions take rank-one Hecke continuation and the global standard L-function from here." Previous report R02, second part.

**Claim:** The description describes what the roadmap owns.

**Witness:** `README.md:15` says the consumers' "rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a", and `README.md:11` lists AL.1.6.2, AL.1.5.2 and AL.1.5.3 under "Identifiers owned elsewhere" with that owner. AnalyticNumberTheoryPartI §2.3a (its README line 1321) states `heckeContinuation` for every continuous unitary idele-class character.

**Repair:** Replace the sentence with "AutomorphicSpectralTheory, the GL₂ and endoscopic transfer roadmaps and DirichletPadicLFunctions take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a." In "Approach and generality", change "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument" to "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a's Hecke continuation", which is what `README.md:13` and AL.2.4.1 (`:1375`) say. Nothing in the folder changes.

## Previous findings

- R01 — repaired: `README.md:516–518` define `S(F)` at every nonarchimedean F as SmoothRepresentationsOfLocalGroups SR.1.1's `C_c^∞(F, ℂ)`, prove the conductor `ν(ψ)`, the annihilators `(P^m)^⊥=P^(−ν−m)`, the self-dual volume `q^(−ν/2)` and `f̂̂(x)=f(−x)` in positive characteristic from AL.0.1.8, AL.0.1.9 and AL.0.1.13; the hypothesis lines of AL.0.3.1 and AL.1.1.1–AL.1.3.5 now read "F is a local field … of either characteristic"; `:11` says AL.0.1 is the characteristic-free form of §5.3g's lattice formulas. The repair puts the three AL.0.1 inputs in AL.0.3.1's *Needs:* line and points AL.1.2.6, AL.1.3.1, AL.1.3.3, AL.1.3.4, AL.2.1.5 and AL.3.3.2 at AL.0.3.1 for positive characteristic, which is equivalent to the requested per-target listing.
- R02 — partly repaired: `README.md:17–32` ("Identifiers owned elsewhere") map AL.0.2, AL.0.3.2–AL.0.3.5, AL.0.4.1–AL.0.4.3, AL.0.5.1, AL.1.5.2, AL.1.5.3, AL.1.6.2, AL.1.7.1–AL.1.7.2 and AL.2.5.1–AL.2.5.2 to their owners; the consumers' citations of AL.1.6.2 (five), AL.1.5.3 (two) and AL.0.2 (one) all resolve through it. The description half is R01 above.
- R03 — repaired: `README.md:1865` proves boundedness of `Λ_H(ω,·)` on finite vertical strips from the `n=1` integral of AL.2.4.1 split at `|x|=1`, with the boundary terms vanishing for ω nontrivial on the norm-one idele classes, and identifies it with §2.3a's `Λ_H` on `Re(s)>1`.
- R04 — repaired: `README.md:74` cites "§2.1a, the K-Bessel kernel `besselK`, its evenness `K_(−ν)=K_ν` and its half-order value `K_(1/2)(x)=√(π/(2x))e^(−x)`"; the §§0.29–0.29b and §2.22a clauses are gone from the contract row and live in the moved-id map.
- R05 — repaired: AL.0.3.1 has one API bullet per law (`:525–528`) and five Checks (`:532–536`); AL.2.4.1 has three Checks (`:1375–1377`).
- R06 — repaired: `Suggested.lean:293` reads `def gjZetaIntegral {F : Type*} [Field F] [MeasurableSpace F] (n : ℕ)`.
- R07 — repaired: the three comment blocks are deleted and the docstring paragraph (`Suggested.lean:20–21`) is the one sentence requested.

## Verified sound

**Gate and dependency check.** The worker's gate at 330bb72 reports every count 0, `build=0`, OK. Dependency check, run by me on this head:

```text
depcheck: 238 roadmaps, 2358 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The files changed outside the folder: none. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; the import is the single line `import Mathlib`; no `set_option`, `lemma`, `#eval`, `#print` or `#synth`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly 12 `declaration uses sorry` warnings, at lines 66, 71, 82, 116, 129, 155, 213, 256, 313, 387, 403 and 449. The file has 27 declarations, as before.

**`#check` audit.** A scratch copy with `#check @` for all 27 declarations elaborated. `AL2.gjZetaIntegral` now carries `[inst : Field F] [inst_1 : MeasurableSpace F]` only; `AL2.godementJacquetLocal`, which mentions it, still carries `IsNonarchimedeanLocalField`, `BorelSpace` and irreducibility explicitly. The two binders the signatures scan flags as lost are the Bessel theorems' `hbesselK`, present as an anonymous hypothesis in both elaborated types. No other type changed since the previous head.

**One-tactic probe.** On the scratch copy, the only headline whose statement the diff touches, `godementJacquetLocal`, was given `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (exact le_rfl) | (norm_num; done) | (aesop; done)` in place of `sorry`; it fails, so it is not padding. The other eleven headlines are untouched and were probed in the previous report.

**Seeded sample.**

| Target and locator | What was read, and the outcome |
|---|---|
| Check for the theta-Mellin formula (`README.md:1700–1702`, AL.3.5.1; Cogdell, Columbia lectures, §1.1.3, pp.4–5) | Cached text `af30e112…` (the author-page PDF). Lines 256–267 (p.4): `E(g,s;Φ,η)=|det g|^s ∫_{k^×\𝔸^×} Θ′_Φ(a,g)|a|^{ns}η(a)d^×a` for `Re s>1`, η unitary, `Θ′` omitting `ξ=0`. Lines 273–277 (p.5): continuation, simple poles at `s=iσ, 1+iσ` when `η=|·|^{−inσ}`, and `E(g,s;Φ,η)=E(ᵗg⁻¹,1−s;Φ̂,η⁻¹)`. Lines 279–289: the section with `e_n` and the `(n−1,1)` parabolic `P′`. Page 5 begins at line 271, so the page locator is right. The Check: `3·5·2^{2·1}·1=60`; omitting `n` gives `3·5·2=30`. Verified. The passage is unchanged since the previous review. |

**Supplier citations the repair introduces or rescopes, resolved at the heads `roadmaps show` serves.**
- **SmoothRepresentationsOfLocalGroups SR.1.1** (its README line 1045, "Functions, measures and convolution"): `C_c^∞(X, M)` for an l-space X, spanned by `1_K·m` for K compact open, every f a finite sum over pairwise disjoint compact opens with a common refinement, and invariance under a compact open subgroup; no division in the coefficients. This is exactly what AL.0.3.1 and the AL.0.3.2 mapping line consume, in either characteristic.
- **AnalyticNumberTheoryPartI**: §0.29 (line 727) defines `IsCenteredOrderOne`; §0.29a and §0.29b are bold sub-blocks inside it with `pairedHadamard_factorization` and `pairedHadamard_derivatives_nonnegative`, so the AL.2.5.1/AL.2.5.2 mapping lines resolve. §2.1a (line 1184) has the bullets `K_(−ν)(x)=K_ν(x)` and `K_(1/2)(x)=√(π/(2x))e^(−x)`, as the contract row now says. §2.3a (line 1321) defines `A=|D_K|N𝔣(ω)`, `Λ_H(ω,s)=A^(s/2)L_∞∏L_v` with `Λ_H(ω,s)=W(ω)Λ_H(ω⁻¹,1−s)`, the unbalanced `Λ(s,ω)=A^(−s/2)Λ_H(ω,s)` with `Λ(s,ω)=W(ω)A^(1/2−s)Λ(1−s,ω⁻¹)`, and poles only for `ω=|·|^(it)` at `−it` and `1−it`. AL.2.4.1's `n=1` paragraph and Checks, and AL.3.9.4's "nonzero multiple of `A^(−s/2)Λ_H(ω,s)`", agree with these. §2.22a (line 1703) exists for the AL.1.7 mapping line.
- **AnalyticNumberTheoryPartII §5.3g** (line 657) opens "Let F be a number field and v a place", so the scoping "at completions of number fields" that the diff adds to every §5.3g, §5.3h and §5.3j citation is the supplier's actual scope.
- **ArithmeticGaloisRepresentations §2.7**, Standard-test-function evaluations (line 2321): `finiteStandardEvaluation` is stated for `F_v/ℚ_p` finite, with `d^×x=(1−q⁻¹)⁻¹dx_ψ/|x|_v`, which gives `O_v^×` the volume `q^(−ν/2)` of Tate's measure. So the diff's "at finite extensions of `ℚ_p`" on every citation of it, and its "outside that supplier's p-adic scope" for the positive-characteristic evaluations proved in AL.1.2.1, AL.1.2.3 and AL.1.3.5, are correct.
- **ClassFieldTheory layer 7** (`characterConductorExp`, its README line 1426): the attained conductor minimum is stated for a nonarchimedean local field, by the no-small-subgroups argument, so AL.1.1.1's widened hypothesis line has its conductor in equal characteristic.
- **AL.0.1.8, AL.0.1.9, AL.0.1.13** (`README.md:416, 432, 496`): stated for an arbitrary bilinear character pairing with measurable U, translation-invariant measures, the double-annihilator and volume-product hypotheses supplied explicitly. AL.0.3.1 supplies exactly these: `(P^(−ν−m))^⊥=P^m` and `vol(P^m)vol(P^(−ν−m))=1`. Mathlib's negative kernel in AL.0.1 and the positive transform of AL.0.3.1 give the same double transform, since `F⁺f(y)=F⁻f(−y)` (`:41`) implies `F⁺F⁺=F⁻F⁻`.
- **AL.3.10.3** (`:1917`) says "The equal-characteristic local-constant construction is a target here; ArithmeticGaloisRepresentations §2.7's p-adic epsilon theorem is not an equal-characteristic input", matching AL.1.3.1's new bullet that in positive characteristic ε is the scalar (3.23) itself.
- The consumers' citations of the moved ids (AutomorphicSpectralTheory lines 44, 1218, 1232, 1428, 1447; GL2AutomorphicRepresentationsAndTransfer lines 51, 289, 313, 319; DirichletPadicLFunctions lines 11, 298) name AL.1.6.2, AL.1.5.3 and AL.0.2, each of which the map at `:17–32` resolves. The overlaps scan reports no other pull request changing this roadmap, no cited id dropped by an open pull request and none defined only by an open revision. The 28 unresolved-name leads are this roadmap's own 24 Lean names, declared in `Suggested.lean`, and four supplier names resolved in the previous report (`curveDuality`, `smoothTrace` on main's EtaleCohomologyFoundations, `etaleTraceFormula` in InverseGaloisAndArithmeticFundamentalGroups, `artinConductor`/`artinConductorNat` in ArithmeticGaloisRepresentations); none of those passages changed.

**Ownership.** Hecke continuation has the single owner AnalyticNumberTheoryPartI §2.3a; the local Fourier analysis at number-field completions has the single owner AnalyticNumberTheoryPartII §5.3g; the equal-characteristic lattice duality and inversion, which §5.3g does not state, are owned here in AL.0.3.1 and nowhere else (searched the AnalyticNumberTheoryPartII and SmoothRepresentationsOfLocalGroups heads: SR.1.1 defines the function space, not its Fourier transform). Ownership against open pull requests other than these suppliers and the consumers above was not checked.

**Remark on untouched text (not a finding).** `README.md:1865` says the `n=1` integral "agrees with §2.3a's `Λ_H` on `Re(s)>1`" one sentence after calling it a nonzero multiple of `A^(−s/2)Λ_H`; the intended reading (agreement after multiplying by the constant and `A^(s/2)`) is fixed by that sentence, and the strip bound is unaffected since `A^(s/2)` is bounded on a strip.

**Adversarial calculations.** Rows marked "carried" are unchanged statements whose values were computed in the previous report (PRREVIEW-AutomorphicLFunctionsAndLocalFactors~6) and recomputed here; the other rows are the changed statements.

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
| AL.3.5.1 Check (sampled), `:1700` | point mass, `n=2`, `|det g|=3`, `θ₀=5`, `|a|=2`, `s=1` | `3·5·2^{2}=60`; without `n`: `30` | Pass (carried) | None |
| AL.0.3.1 conductor and annihilators, `:518` | `𝔽₃((t))`, `ψ=ψ₀∘res(·dt)`; `ψ(t·)`; general m | `res(t⁻¹dt)=1`, ψ trivial on O: `ν=0`, `O^⊥=O`; `ψ(t·)` trivial on `P⁻¹`, not `P⁻²`: `ν=1=0+ord(t)`, `O^⊥=P⁻¹`; `vol(P^m)vol(P^(−ν−m))=q^{−m}·q^{ν+m}·vol(O)²=q^ν vol(O)²`, so `vol(O)=q^{−ν/2}`: `1` and `3^{−1/2}·3^{1/2}=1` | Pass | None |
| AL.0.3.1 inversion `f̂̂(x)=f(−x)`, `:518` | `f=1_(a+P^m)` | `f̂(y)=ψ(ay)vol(P^m)1_(P^(−ν−m))(y)`; `f̂̂(x)=vol(P^m)vol(P^(−ν−m))1_(P^m)(a+x)=1_(a+P^m)(−x)`; same with Mathlib's negative kernel since `F⁺F⁺=F⁻F⁻` | Pass | None |
| AL.0.3.1 scaling law `(r(a)f)^=|a|^{−1}r(a^{−1})f̂`, `:527` | `ℝ`, `f=e^{−πx²}`, `a=2` | `(r(2)f)^(y)=∫e^{−4πx²}e^{2πixy}dx=½e^{−πy²/4}`; `½f̂(y/2)=½e^{−πy²/4}`; without `|a|^{−1}`: `e^{−πy²/4}` | Pass | None |
| AL.0.3.1 Checks `r(ϖ)1_O`, `r′(a)λ`, `:533–534` | `ϖ`; `λ=∫·ω d^×x` | `1_O(xϖ)=1⇔x∈P⁻¹`: `1_(P⁻¹)` (inverse convention: `1_P`); `λ(r(a⁻¹)f)=∫f(xa⁻¹)ω(x)d^×x=ω(a)λ(f)` (without the inverse: `ω(a)⁻¹λ`) | Pass | None |
| AL.1.1.2 convergence in positive characteristic, `:654` | `supp f⊆P^(−M)`, `σ=Re s>0`, `vol(O^×)=1` | shell `ϖ^nO^×`: `≤sup|f|·q^{−nσ}`; `Σ_{n≥−M}q^{−nσ}=q^{Mσ}/(1−q^{−σ})<∞` | Pass | None |
| AL.1.2.1 standard evaluation in positive characteristic, `:758` | `ω` unramified, `t=ω(ϖ)`; `q=3`, `t=1`, `s=1` | `z(s,ω;1_O)=Σ_{n≥0}t^nq^{−ns}=(1−tq^{−s})⁻¹`: `Σ3^{−n}=3/2=(1−⅓)⁻¹`; `1_O(xϖ⁻¹)=1_P(x)`, so `1_O−r(ϖ⁻¹)1_O=1_(O^×)` and `⟨z₀,1_O⟩=vol(O^×)=1` | Pass | None |
| AL.1.2.3 standard evaluation in positive characteristic, `:790` | `ω` ramified, `f^o=ω⁻¹1_(O^×)` | integrand `ω⁻¹ω|x|^s=1` on `O^×`, 0 elsewhere: value `vol(O^×)=1` | Pass | None |
| AL.1.3.5 (i)–(ii) in positive characteristic, `:971` | (i) `f^o=1_O`, `f̂^o=q^{−ν/2}1_(P^(−ν))`; `𝔽₃((t))`, `ω(ϖ)=−1`, `ν=0` and `ν=1`; (ii) `f^o=ω⁻¹1_(O^×)` | (i) `⟨z₀(1−s,ω⁻¹),f̂^o⟩=q^{−ν/2}(t⁻¹q^{s−1})^{−ν}=ω(ϖ^ν)q^{ν(½−s)}`: `1`, then `−3^{½−s}`; (ii) substituting `x=ϖ^{−(ν+c)}u`: `𝔤q^{−(ν+c)/2}ω(ϖ^{ν+c})q^{(ν+c)(1−s)}=ω(ϖ^{ν+c})q^{(ν+c)(½−s)}𝔤` | Pass | None |
| AL.2.4.1 Checks, `:1376–1377` | `K=ℚ`, `ω=1`, `Φ=e^{−πx²}⊗1_Ẑ`; `ω=|·|^(it)` | `Γ_ℝ(s)ζ(s)`: at 0, `Γ(s/2)∼2/s` times `ζ(0)=−½` gives residue `−1`; at 1, `Γ_ℝ(1)=1` gives `+1`; `ζ(0)=−½` is finite; `Z(s,|·|^{it},Φ)=Z(s+it,1,Φ)`, poles at `−it`, `1−it`, matching §2.3a's `Λ_H(|·|^(it),s)=|D_K|^(−it/2)Λ_H(1,s+it)` | Pass | None |
| AL.3.9.4 Hecke strip bound, `:1865` | `ω=χ₄` over `ℚ`, strip `−1≤Re s≤2` | boundary terms `∝∫_{𝔸^1/ℚ^×}χ₄=0`; on `|x|≥1`: `|x|^{Re s}≤|x|^2` and `|x|^{1−Re s}≤|x|^2`, both integrals against `|Φ|`, `|Φ̂|` finite; `Z(s,Φ_std)=c·Λ(s,χ₄)=c·4^{−s/2}Λ_H(χ₄,s)` with `Λ(s)=Γ_ℝ(s+1)L(s,χ₄)`; `|4^{s/2}|≤4` on the strip | Pass | None |
| `Suggested.lean:293` `gjZetaIntegral` | binder audit | `#check` shows `[Field F] [MeasurableSpace F]` only; `godementJacquetLocal` elaborates | Pass | None |
| `:59–63` `hbesselK` | §2.1a's `besselK` | same defining integral (its line 1186); `K_(1/2)(1)=√(π/2)/e=0.46107` against §2.1a's bullet `K_(1/2)(x)=√(π/(2x))e^(−x)` | Pass (carried) | None |
| `:66` `BesselHalfOrderDerivative` | `c=1, 2, 0.3` | LHS `0.1665972456`, `0.0247486376`, `1.4034805271`; RHS `0.1665972476`, `0.0247486378`, `1.4034805732` | Pass (carried) | None |
| `:71` `BesselLaplaceMellin` | `(m,t,s)=(1,½,2)`, `(2,¼,1.5)` | LHS `4.6627424734e−3`, `3.0772530337e−3`; RHS the same; exponent `s` for `s+½` gives `1.6529e−2`, `1.5427e−2` | Pass (carried) | None |
| `:82` `pointSupported_finiteJet` | `δ₀`; `δ₀′`; empty support; `E=0` | `N=0`; `N=1` (`f=xe^{−x²}`: `f(0)=0`, `δ₀′f=1`); `T=0`; `f(0)=0` forces `f=0` | Pass (carried) | None |
| `:116` `archimedeanEigenSpace.finrank` | `ℝ`: `χ=1`, `a⁻¹`, `|·|` | `δ₀(f∘e_a)=f(0)`; `(f∘e_a)′(0)=a⁻¹f′(0)`; `∫f(a⁻¹x)dx=|a|∫f`; one line each | Pass (carried) | None |
| `:129` `localZetaIntegral_functionalEquation` | `ℚ_p`, `χ=1`, `f=1_O`; `ℚ₃` quadratic; `𝔽₃((t))`, `χ=1` | `γ=(1−p^{−s})/(1−p^{s−1})`; `γ=−i·3^{1/2−s}`; in `𝔽₃((t))` with `ν=0`: `Z=(1−3^{−s})⁻¹`, `f̂=1_O`, same `γ`, now covered by AL.0.3.1 | Pass | R01 of the previous report, repaired |
| `:155` `archimedeanLocalFunctionalEquation` | `ℝ`, `e^{−πx²}`; `ℂ`, `e^{−2π|z|²}` | `Z=Γ_ℝ(s)`, `γ=Γ_ℝ(1−s)/Γ_ℝ(s)`; `Z=(2π)^{1−s}Γ(s)=πΓ_ℂ(s)` | Pass (carried) | None |
| `:213` `finiteEigenSpace_finrank` | `χ=1`; `χ=|·|`; ramified; `𝔽₃((t))` | `ℂδ₀` (`r′(ϖ)λ₀=λ₀−δ₀`); Haar `dx`; `z₀`; same proof in characteristic 3, inversion from AL.0.3.1 | Pass | R01 of the previous report, repaired |
| `:256` `genericNewform` | `n=0`, conductor `c` | `newformLocalK1 F 0 m=1+P^m`; invariants nonzero iff `m≥c`; rank 1 | Pass (carried) | None |
| `:313` `godementJacquetLocal` | trivial `GL₂`, `Φ=1_{M₂(O)}` | `Z=(1−q^{−s−½})⁻¹(1−q^{½−s})⁻¹`, `P=(1−q^{−½}T)(1−q^{½}T)`, `ε=1`; one-tactic probe fails | Pass (carried) | None |
| `:387`, `:403` GL₂ newvectors | `c=1`; `c=0`; `c=3`, `n=1` | dimensions `0,1,2`; `n+1`; `max(0,1+1−3)=0` | Pass (carried) | None |
| `:449` `whittakerUniqueness` | `n=0`; trivial `GL₂`; `W⊕W` | rank 1; `ψ(x)≠1` forces rank 0; `W⊕W` excluded by irreducibility | Pass (carried) | None |
| AL.1.6.1 root number | `χ₄` | normalized Gauss sum `−i`, times `i` at ∞: `W=1`, §2.3a's Check | Pass (carried) | None |
| AL.1.3.1 Checks, `ℚ₃` | `c=1`, `ν=0,1` | `𝔤=−i`; `ε=−i·3^{1−2s}` | Pass (carried) | None |
| Character signs | §5.3g, ArithmeticGaloisRepresentations §2.7, `:25`, `:893` | `ψ_ℝ=e^{2πix}`, `ψ_p=e^{−2πi{x}_p}` in all three (§5.3g line 657 read at this round) | Pass (carried) | None |
| AL.2.6.4 `W_{0,ν}(x)=√(x/π)K_ν(x/2)` | `ν=½` | `e^{−x/2}` | Pass (carried) | None |

Every row computes its values. The table covers the sampled target, all 12 headline theorems, both Bessel hypotheses and every changed statement (AL.0.3.1, AL.1.1.2, AL.1.2.1, AL.1.2.3, AL.1.3.5, AL.2.4.1, AL.3.9.4 and `gjZetaIntegral`).

## Not verifiable

- **Godement–Jacquet, LNM 260, Theorem 3.3**: paywalled, cited by locator and not read; `godementJacquetLocal` was checked on the instances above instead.
- **Sources outside the seeded sample** were not re-read at this head; the changed passages cite only Tau Ceti roadmaps and Mathlib, and their mathematics is computed in the table.
- **Ownership against open pull requests** beyond AnalyticNumberTheoryPartI, AnalyticNumberTheoryPartII, ArithmeticGaloisRepresentations, SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactorsPartII and the three consumers named above was not checked.

## Source issues

- none
