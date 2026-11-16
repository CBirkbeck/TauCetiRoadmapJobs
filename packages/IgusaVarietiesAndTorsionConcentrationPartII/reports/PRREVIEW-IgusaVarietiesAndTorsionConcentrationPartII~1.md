# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at b96db01)

**Verdict:** needs changes

## R01 (P3) — The §8.1 negative control for `F⁺ ≠ ℚ` is false

**Location** `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentrationPartII/README.md` line 216: "`F = 𝒦` (`F⁺ = ℚ`) with `B = F` is not a Case 2 datum. Without the condition `F⁺ ≠ ℚ` the trace comparison of Layer 9 … would be applied outside its range."

**Claim** The Check is false. The Case 2 ramification condition already rules out `F⁺ = ℚ`, so a definition without `F⁺ ≠ ℚ` admits no extra datum. The Check therefore discriminates nothing.

**Witness** Take `F = 𝒦 = ℚ(i)`. The prime 2 ramifies in `F`, and `Spl_{F/F⁺} = Spl_{𝒦/ℚ}` contains no ramified prime, so the ramification condition fails. CS17 line 3293 (footnote 27) records that (2) implies (1).

**Repair** Replace the bullet by: "- `F = 𝒦 = ℚ(i)` (`F⁺ = ℚ`) with `B = F` is not a Case 2 datum: `2` ramifies in `F` and does not split in `F/F⁺ = 𝒦/ℚ`, so the ramification condition fails. Every imaginary quadratic field has a ramified prime, so the ramification condition implies `F⁺ ≠ ℚ` ([CS17] §5.1, footnote 27, p. 730). The condition `F⁺ ≠ ℚ` is recorded in the form in which Layer 9 uses it (EndoscopicTransferAndUnitaryTraceComparison §6.15). A definition that dropped the ramification condition would admit `F = 𝒦`."

## R02 (P3) — §9.1 restates only part of the supplier's `θ`

**Location** `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentrationPartII/README.md` line 437: "The involution `θ` is defined by `g^♯ = Φ ᵗ(g^c)⁻¹ Φ⁻¹`."

**Claim** The sentence defines `θ` only through `g^♯`. It leaves out the action `(λ, g) ↦ (λ^c, λ^c g^♯)` and the block matrix `Φ_n⃗`. It also restates part of a definition that belongs to a supplier.

**Witness** EndoscopicTransferAndUnitaryTraceComparison §6.6(d), at its open head, gives `θ(λ, g) = (λ^c, λ^c g^♯)` with `g^♯ = Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹`. §9.1's *Needs* line already lists §§6.6–6.10.

**Repair** Replace the sentence by: "`θ` is the automorphism of `𝒢_n⃗` of EndoscopicTransferAndUnitaryTraceComparison §6.6(d), `θ(λ, g) = (λ^c, λ^c g^♯)` with `g^♯ = Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹`."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.1 compact data, Cases 1–2 | `F=𝒦=ℚ(i)`, `B=F`; quaternion datum `(2,0)/(0,2)`; `n=1` | Ramified prime 2 ∉ Spl, so Case 2 is excluded without `F⁺≠ℚ` (R01). Quaternion datum: `d=0`, SV3 fails. `n=1`: `d=0`, SV3 holds vacuously | R01 |
| §8.3 local datum at split `p` | `S_i={τ,τ′}`, signatures `(1,1),(2,0)`, `n=2`, `c_i=1` | `κ(μ_i⁻¹)=−3`, `κ(μ_{i,τ}⁻¹)=−1`; translating by `p` adds 2. Average `((−½,−1),(−½,−1))` pairs with `2ρ` to `1=d` | sound |
| §8.5 dual ideal | `n=2`, `q_v=7`, `ℓ=11`, roots `{1,2}`; control `deg`, `q=5∈𝔪` | `T₁≡3`, `T₂≡5`; `ι` gives `5`, `9`; `P≡X²−5X+8`, roots `{7,9}={7·1⁻¹,7·2⁻¹}`. Control: `X²−X`, root 0, rule fails | sound |
| §8.7 `IsStrongGenericAt` (Lean def) | `n=0`; `{3,3}`; `{1,2}` at `q_v=7`, `ℓ=11`; `v∣ℓ` | `n=0`: `v` maximal and `ℓ∉v`. `{3,3}`: ratio 1 fails. `{1,2}`: ratios `2,6∉{1,7}`, holds. `v∣ℓ`: false | sound |
| §8.8(a) `infinite_setOf_isCompletelySplitStrongGenericPrime` | `n=0`; general `r` with witness `p₀` | `n=0`: the completely split primes `≠ℓ` are infinite. Same Frobenius class in `Gal(L̃/ℚ)` gives `Frob_{P′}=Frob_{gP₀}∈Gal(L̃/F)` and `p≡p₀ (mod ℓ)` | true; `simp` fails |
| §8.8(b) `infinite_setOf_isStrongGenericAt_degree_one` | `n=0`; `v₀` of residue degree 2 | Degree-one primes of class `C` in `Gal(L_r(ζ_ℓ)/F)` have positive density. `q_v≡q_{v₀} (mod ℓ)` through `ζ_ℓ`, and `r(Frob_v)` is conjugate to `r(Frob_{v₀})` | true; `simp` fails |
| §8.9 dimension zero | wholly definite `n=2`, `[F⁺:ℚ]=2`, `p` inert in `F⁺`; `T⁴−1` at `ℓ=5` | Newton point `((−½,−½),(−½,−½))`, `d_b=0`, `J≅Res GL₂`. Conventions localization gives `ℤ₅`; ordinary localization gives `ℤ₅⊕ℚ₅` | sound |
| §9.1 stable Igusa identity | `n⃗=(n/2,n/2)`; `n⃗=(n)` | `ι(G,G_n⃗)τ(G_n⃗)=τ(G)/2`, matching `ε=½` (CS17 line 3592); otherwise `ε=1`. `θ` restated in part (R02) | R02 |
| §9.2 Newton reduction | `GL₂`, `D^×`; generic PS `ψ₁/ψ₂≠\|·\|^{±1}`; trivial rep | LJ of generic PS is 0 (supplier §10.32). Trivial rep goes to `−1_{D^×}≠0`, so the genericity hypothesis is needed | sound |
| §9.3 spectral expansion | `φ_p=0`; coefficients `+1,−1` on one eigensystem | Both sides 0. Coefficients cancel, so (2) asserts nothing, consistent with the "total coefficient" wording | sound |
| §9.6 / CS17 Thm 5.5.7 | definite `G_ℝ`; split `GL₂`, signature `(1,1)` | `B(G,μ⁻¹)` is a point and the statement is empty. Basic `J=D^×` is killed; ordinary `J=GL₁²` survives | sound |
| §10.1 proper endoscopy vanishes | `n=2`, `d_v=2`, `G_{1,1}`; central `γ` | `d_v∤n₁=1`, so no `(G,H)`-regular image. Central `(X−γ)²`: isotypic degree 2, divisible by `d_v` | sound |
| §10.3 Matsushima coefficient | `n=1`, `ℚ(i)`; `GU(1,1)` with `e=2` | `ep(1)=1` for `(𝔪_G,K_∞)`, full pair gives 0. `GU(1,1)`: `ep(1)=2`, `K_max` gives 1 | sound |
| §10.4 division-algebra Galois reps | `B=F` vs `B` division; `q_v=7`, trivial `Π⁰_v` | Shin-BCU lines 13–17, 41–54 cover `B=F` only, so the gap is declared. Polynomial `X²−8X+7` from `S(T₁)=8`, `S(T₂)=1` | sound |
| §10.6 / CS17 Cor 5.6.3 | `n⃗=(n)`; definite `G_ℝ` | Same as §9.6 with the trivial datum; definite case empty | sound |
| §11.1 contraction | `S′=S`; finite residue field | Trivial. Image of `𝕋^{S′}` in a finite field is a domain, hence a field | sound |
| §11.2 Hochschild–Serre, (c) | hyperspecial `K_p`; `n=1` `ℚ(i)`, `Λ=ℤ[i]`; `n≥2`, Iwahori | `H^a(K_p,−)≠0` possible for `a>0`, so only `j≤i`. `⟨1,i⟩=1` and `K⊂Γ(5)`. Iwahori: `∏(u_j−1)=q₁E₁₁` forces `eΛ=0`, contradiction | sound |
| §11.5 / CS17 Thm 6.3.1(1) | `n=1`; two constructions avoiding `q` | `ρ_𝔪` is the class field theory character. Brauer–Nesbitt and Chebotarev glue on a density-one set | sound |
| §11.6 / CS17 Thm 6.3.1(2) | wholly definite; `F⁺` real quadratic, `n=3`, `(1,2),(0,3)` | `d=0`: `H^j=0` for `j>0`, for every `𝔪`. Auxiliary pair through `u` tests `𝔭₁` only | sound |
| §11.7 / CS17 Thm 1.1 | `p` split vs inert in `F⁺` | `(e,f,g)=(1,1,4)`: complete splitting holds. `(1,2,2)`: it fails, yet the pair is auxiliary | sound |
| §11.8 / Remarks 1.3, 1.7.1 | `n=1`, `ℓ=3`, `𝔪₂∌3`; `V=𝔽_ℓ`, `K′=K` | Ordinary localization contains `ℚ₃`, which is not finite, so the restriction to `𝔪∋ℓ` is needed. With `V=𝔽_ℓ`, (2) is §11.6 | sound |

- Source locators checked against the text: 47 (CS17 37, Shin-BCU 2, Shin09 3, Shin11 4, Shin12 1). All 15 sampled targets match in theorem number, page and hypotheses.
- Library declarations opened at the pins: 17, each at its cited file. Mathlib (8): `IsCMField` (CMField.lean:70), `maximalRealSubfield` (TotallyRealComplex.lean:126), `HeckeRing` (HeckeRing/Defs.lean:189), `IsArithFrobAt` (Frobenius.lean:184), `Ideal.inertia` (Ideal/Defs.lean:154), `Ideal.primesOver` and `Ideal.LiesOver` (Over.lean:379, 128), `HasDirichletDensity` (DirichletDensity.lean:81). Tau Ceti (9): `instRingHeckeRing` (Associativity.lean:484), `ofAmbient` and `onHeckeCoset` (Commutativity.lean:135, 165), the four Chebotarev declarations (FrobeniusPrimeSet.lean:93, 177; Chebotarev.lean:51, 74), and the two Negligible.lean declarations (lines 101, 254).
- Cross-roadmap citations resolved: 131 ids in 19 roadmaps (5 on main, 14 at open heads), none missing. The resolver lead `LocallySymmetric.FrankeInput` is ArithmeticLocallySymmetricSpaces ALS.5b.4's hypothesis name.
- Declared gaps: 3. Each has the same slug in `design/plan.json` and in the README contracts, and each needs a supplier change. EndoscopicTransferAndUnitaryTraceComparison §6.3 states only that `Ram_ℚ(ϖ)` is finite. AG2.7 «Unitary discrete-parameter export» keeps the Remark 5.5.6 comparison only for supercuspidal summands. AG2.2's assembly is stated for rank `2n`.
- Gate at b96db01: every check passed. Depcheck output: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. Nothing changes outside the roadmap folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 83 and 98), nothing else. `#check @` of the 4 declarations matches the README, with no lost binder. One-tactic probes (`simp`, `simp [IsCompletelySplitStrongGenericPrime]`) fail on both theorems, so neither is padding.
- Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, TorsionCohomologyInfrastructure, PotentialAutomorphyInfrastructure and ArithmeticLocallySymmetricSpaces. Three objects are shared, each with one owner per datum:
  - Strong decomposed genericity: the local predicate belongs to AutomorphicGaloisRepresentationsPartII AG2.7. The prime-of-a-number-field form `IsStrongGenericAt` is a variant kept here and stated in the Scope.
  - Dual ideal, Igusa duality and rational constituent: the parent's §§5.1, 5.2 and 5.4 (rank `2n`, non-compact). The compact rank-`n` forms are §§8.5, 8.6(2) and 11.4 here.
  - Stable Igusa trace identity: EndoscopicTransferAndUnitaryTraceComparison §§8.22 and 14.4–14.5 (non-compact). The compact Case 2 forms are §§9.1 and 9.3 here.

  No other open roadmap declares these names (`roadmaps grep`).
- Source independence: 24 passages compared with 5 sources. Only phrasing that the mathematics forces is shared; the longest run is 7 words, in Lemma 5.4.3's hypothesis. Largest share: CS17, 128 of 160 locators. Contents compared with CS17: independent. Layers 9–11 follow CS17 §§5.2–5.5, 5.6 and 6.3, but the *Needs* lines force that order (Layer 10 needs §§9.2 and 9.5; Layer 11 needs §§9.6 and 10.6). Layer 8's §§8.8–8.9 have no CS17 counterpart.

## Not verifiable

- none

## Source issues

- **Misprint** in CS17 at Theorem 6.3.1(1), p. 757: the source says the similitude factor in `T_{i,v}` and in `G(ℚ_q)` is `ℤ_p^×`, `ℚ_p^×`; it should be `ℤ_q^×`, `ℚ_q^×` at the Hecke prime `q`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, p. 747, and Corollary 5.6.3, p. 750: the source says `S_i` is defined through `ι_p ∘ τ` with `ι_p : ℚ̄_p ≅ ℂ`, which is not a defined composite; it should be `ι_p⁻¹ ∘ τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7 and the paragraph before it, pp. 746–747: the source says the `r`-part is taken of `BC^p` of the unramified Igusa class; it should be `BC^S`, which is what the proof uses; affects nothing.
- **Misprint** in CS17 at Lemma 5.4.3, p. 741: the source says `Red^b_n⃗(π_p)` vanishes; it should be `Red^b_n⃗(π^n⃗_p)`; affects nothing.
- **Misprint** in CS17 at §5.3, p. 736: the source says `g^♯` is `Φ ᵗg^c Φ⁻¹`, which reverses products; it should be `Φ ᵗ(g^c)⁻¹ Φ⁻¹`, as in [Shin11] p. 1676 before (4.2); affects nothing.
- **Misprint** in CS17 at §5.2, p. 735: the source says Proposition 7.1 of [Shi11] gives the choice of `ϖ`; it should be Lemma 7.1 of [Shin11], p. 1722; affects nothing.
- **Misprint** in CS17 at §5.6, p. 749: the source says Lemma 6.4 of [Shi11] is used for extending from acceptable functions; it should be [Shin09] Lemma 6.4, author p. 20; affects nothing.
- **Misprint** in CS17 at the proof of Theorem 6.3.1, p. 759: the source says Theorem 5.5.5 is used; it should be Corollary 5.5.5; affects nothing.
- **Gap** in CS17 at the proof of Theorem 5.5.7, p. 748: the source says Shapiro alone identifies `B(G_i, μ_i⁻¹)` with `B(GL_n/F_{𝔭_i}, μ_{i,τ}⁻¹)`; it should follow Shapiro with translation by `p^{c_i}`, since the Kottwitz invariants differ when `S_i` has embeddings of signature `(n, 0)`; affects the proof.
- **Error** in CS17 at §5.1, p. 730: the source says `(G, {h})` is a Shimura datum in the sense of §2.1; it should exclude data definite at every real place with `n ≥ 2`, which fail axiom (3) of p. 660; affects the proof.
- **Error** in CS17 at Remark 6.3.3, p. 758: the source says exactly one `τ` has `p_τq_τ ≠ 0`; it should say two, `τ₀` and `τ₀c`, when the remaining place is indefinite, exactly one of them in `⋃_i S_i`; affects nothing.
- **Gap** in CS17 at the proof of Theorem 6.3.1, p. 758: the source says `H^i(S_{K^p})_𝔪 ≠ 0` for the least `i` with `H^i(S_K)_𝔪 ≠ 0`; it should be some `j ≤ i`, as Hochschild–Serre gives no more unless `K_p` is pro-`p`; affects nothing.
- **Gap** in CS17 at §5.6, p. 749: the source says base change of Kottwitz's division-algebra groups is in Shin's appendix to [Gol14]; it should be a separate base-change theorem, since that appendix treats hermitian spaces over `F` only; affects a stated result.

## For the human reviewers

- none
