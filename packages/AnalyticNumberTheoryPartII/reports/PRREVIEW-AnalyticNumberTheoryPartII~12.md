# Review of AnalyticNumberTheoryPartII (pull request #1167 at 0717d3f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AnalyticNumberTheoryPartII/` at 0717d3f, the same head that r11 read. The folder has not changed since r11. The open pull requests around it have moved.

- r11's two blocking findings are now repaired by edits to those other pull requests. They are listed under "Previous findings".
- This review raises six findings: one P2 and five P3.

## R01 (P2) — AutomorphicFormsOnReductiveGroups constructs §5.3h's character identification as its own `addChar_equiv`

**Location.**
- `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:676` says: "the continuous characters of `V_𝔸/V` are the `ψ(B(·,y))` with `y∈V`, each for exactly one `y`".
- `README.md:7` says: "This part is their single owner."

**Claim.** Two open roadmaps own the same theorem.
- AutomorphicFormsOnReductiveGroups (#1037 at 753cac0, ORDER.txt line 58) constructs, in its §4.3, the identification of `F` with the characters of `F\𝔸_F`, and names it `addChar_equiv`. For `V=F` this is the statement of §5.3h quoted above.
- Its line 48 also says that ArithmeticGaloisRepresentations §2.7 "owns" the trace character, local self-duality, restricted-product duality and the self-annihilator. But ArithmeticGaloisRepresentations (#856 at 2cbcfe8, `README.md:2304–2309`) now takes all of these from §§5.3g–5.3h. The ownership #1037 names is therefore stale.

**Witness.** #1037 `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:665`: "supplies surjectivity of `addChar_equiv`: `ξ↦ψ(ξ·)` identifies the additive group of `F` with the continuous characters of `F\𝔸_F`… Construct this compact-quotient adapter here." Running `grep -c AnalyticNumberTheoryPartII` on that file returns 0.

**Repair.** This roadmap is earlier in the merge order (line 50), so it keeps the theorem.
1. In #1037 §4.3 (`README.md:663–667`), cite AnalyticNumberTheoryPartII §5.3h for the bijection `ξ↦ψ(ξ·)`. Keep `fourierCoeff`, `fourier_expansion` and `fourierCoeff_translate` as #1037's own targets.
2. In #1037 line 48 and line 1333, name §§5.3g–5.3h, not ArithmeticGaloisRepresentations §2.7, as the owner of the character foundations.
3. Add an AutomorphicFormsOnReductiveGroups §4.3 bullet to this README's Downstream consumers (`:3103–3111`).

Tested on the instance: at #856's head, ArithmeticGaloisRepresentations §2.7 already consumes §5.3h this way (`README.md:2305–2306` cites `adeleRing_selfDual`). After step 1, every roadmap that states the character identification cites §5.3h.

## R02 (P3) — Six AnalyticNumberTheoryPartI declaration names cited here are declared nowhere in AnalyticNumberTheoryPartI

**Location.** These names appear at `README.md:43`, `:829` and `:831`:
- `.siegel_gap` (§0.31b);
- `dedekind_residue_lower_of_zero_gap` and `near_one_dedekind_zero_quadratic_subfield` (§2.31e);
- `dedekind_residue_subpower_lower` (§2.31e);
- `besselK_neg` and `besselK_one_half` (§2.1a).

**Claim.** This is supplier drift. AnalyticNumberTheoryPartI at #1126 (70913eb) states each of these facts in prose:
- §0.31b at `README.md:839` states the uniform gap;
- §2.31e at `:1870` lists "the residue lower bound from a zero gap … the quadratic subfield carrying a near-one Dedekind zero, and the subpower residue lower bound";
- §2.1a at `:1207` and `:1212` states `K_(−ν)=K_ν` and the value of `K_(1/2)`.

None of the six names appears in its README or its `Suggested.lean`. The worker's `roadmaps resolve` did not catch this, because the only occurrences are in this README itself (and in ArithmeticStatisticsPartV, which copies them).

**Witness.** Across main and all 466 open heads, `roadmaps grep --fixed` finds each of the six names only in #1167 and #1175. Running `grep -c` for them in AnalyticNumberTheoryPartI's `README.md` and `Suggested.lean` gives 0 for each. PartI's Lean declares only `besselK` (line 589) and `landau_siegel_exclusion` (line 112).

**Repair.** Replace each backticked name with a prose citation of the section that states the fact. For example:
- "the residue lower bound from a zero gap of AnalyticNumberTheoryPartI §2.31e";
- "§0.31b's uniform gap, whose constant is §0.34's `landau_siegel_exclusion`";
- "§2.1a's evenness `K_(−ν)=K_ν` and half-order value".

Alternatively, have AnalyticNumberTheoryPartI introduce these names.

## R03 (P3) — The adelic definitions of §§5.3j–5.3n have no Checks

**Location.** `README.md:694–736`, the sections §5.3j (`d^×x_v`, `z(f_v,ω_v,s)`), §5.3k (the quotient measure `dġ`), §5.3l (`dg`, `t(g)`, `ι`), §5.3m (Siegel sets, and the Lean definitions `gl2Rational` and `gl2Integral`) and §5.3n (`I(χ₁,χ₂,z)`, `E(φ,z,g)`, `M(z)`).

**Claim.** Each of these sections defines objects, and five later roadmaps consume them. None has a `**Checks.**` list. The house rule requires at least three discriminating Checks per definition, and §§5.3f–5.3h each have them.

**Witness.** `awk` over `README.md:606–737` finds Checks after §§5.3a, 5.3b (inline), 5.3d, 5.3e, 5.3f, 5.3g and 5.3h. It finds none between `:694` and `:737`.

**Repair.** Add Checks of the following kind. Each value below was computed for this review.
- §5.3j (all at `s=1` unless stated):
  - On `ℝ`, `z(e^(−πx²),1,s)=π^(−s/2)Γ(s/2)`, which equals 1 at `s=1`; using `dx/(2|x|)` gives `1/2`.
  - On `ℂ`, `z(e^(−2π|z|²),1,s)=(2π)^(1−s)Γ(s)`, which equals 1 at `s=1`.
  - At an unramified place, `z(1_(O_v),1,s)=(1−q^(−s))^(−1)` and `d^×x(O_v^×)=1`. Without the `(1−q⁻¹)⁻¹` factor the mass at `q=2` is `1/2`.
- §5.3k:
  - For `ℤ≤ℝ` with counting measure and Lebesgue measure, `dġ` is Lebesgue measure on `[0,1)` with mass 1.
  - Doubling `dh` halves `dġ`.
  - Negative control: for the `ax+b` group with `H` its diagonal subgroup, `Δ_G|_H≠Δ_H=1`, and there is no invariant measure on `H\G`.
- §5.3l:
  - `t(diag(2,1/2))=2` at the real place, whereas the raw ratio is 4.
  - `t(γ)=1` for `γ∈B(ℚ)`, by the product formula.
  - `ι(n(x))` is the lower unipotent `n⁻(−x)`.
- §5.3m:
  - The double-coset count is 1 for `ℚ` and 2 for `ℚ(√−5)`.
  - `diag(p,1)` at `v=p` has integral entries but lies outside `gl2Integral`, so the inverse-entry condition is needed.
- §5.3n:
  - The unramified local intertwiner at `q=2`, `z=3` is `(1−2⁻³)/(1−2⁻²)=7/6`.
  - At the real place, `∫(1+x²)^(−3/2)dx=2=Γ_ℝ(2)/Γ_ℝ(3)`.
  - With `|t₁/t₂|^z` in place of `|t₁/t₂|^(z/2)`, the chamber would be `Re z>1`, not `Re z>2`.

## R04 (P3) — Downstream consumers omits two roadmaps that cite the adelic harmonic analysis

**Location.** `README.md:7` says: "Downstream consumers lists those roadmaps and what each takes." `README.md:3103` says: "The adelic harmonic analysis of Layer 5 has these consumers, each later in the merge order".

**Claim.** The list names five roadmaps. Two more now cite these sections:
- ProbabilisticAndMetricNumberTheory (#1421, ORDER.txt line 60) takes §5.3k, including `exists_unique_quotientMeasure`.
- ClassicalArithmeticCompletion's revision (#1409 at aa03308) takes §5.3g directly. That roadmap is on main and does not appear in ORDER.txt, so "each later in the merge order" would no longer be true.

**Witness.**
- #1421 `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6347`: "AnalyticNumberTheoryPartII §5.3k (`exists_unique_quotientMeasure`, its extension to nonnegative Borel functions, its scaling law…)".
- #1409 `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14073`: "AnalyticNumberTheoryPartII §5.3g supplies the standard character ψ_v…".

**Repair.**
1. Add a ProbabilisticAndMetricNumberTheory bullet (§5.3k: the quotient measure, its Borel extension, scaling and inversion).
2. Add a ClassicalArithmeticCompletion §7.12a bullet (§5.3g: trace characters, self-dual measures, local Schwartz–Bruhat spaces, Fourier inversion).
3. Reword `:3103` to say "with these consumers" in place of "each later in the merge order".
4. After R01's repair, add AutomorphicFormsOnReductiveGroups §4.3 as well.

SieveMethodsAndPrimePatterns (§5.29) and ArithmeticDirichletSeriesPartII (§4.5c) also cite this roadmap. They may be added to the first paragraph.

## R05 (P3) — PolylogarithmFunctions assigns §4.1 a comparison that §4.1 does not state

**Location.** `README.md:127` says: "The periodic/polylog series is `zΦ(z,s,1)`, not `Φ(z,s,1)`." No supplier contract names PolylogarithmFunctions.

**Claim.** PolylogarithmFunctions (#1320, ORDER.txt line 38, earlier than this roadmap) says that AnalyticNumberTheoryPartII §4.1 owns two things:
- the comparison `Liₙ(z)=zΦ(z,n,1)` for every `n∈ℤ` and `|z|<1`;
- its continuation along the paths of its Layer 2.

§4.1 states only the series identity. It never names PolylogarithmFunctions' `Liₙ`, and no Layer 4 target compares the continued `Φ` with `Liₙ`'s branches. So the hand-off has no owner. The comparison itself is true: `zΦ(1/2,2,1)=Σ_(n≥1)2^(−n)n^(−2)=0.5822405=π²/12−(log 2)²/2=Li₂(1/2)`.

**Witness.** #1320 `TauCetiRoadmap/PolylogarithmFunctions/README.md:1137`: "**AnalyticNumberTheoryPartII** §4.1: owns `lerch_transcendent.polylog`, the comparison `Liₙ(z) = z Φ(z,n,1)` … It also owns continuation of the comparison … using Layer 2".

**Repair.** Choose one of the following.
- **Take the hand-off here.** Add a "From PolylogarithmFunctions" supplier contract (§1.3, the disc series; Layer 2, branches and monodromy). Add a §4.1 bullet: "for `n∈ℤ` and `|z|<1`, `Liₙ(z)=zΦ(z,n,1)`". Add a §4.5 statement that the comparison continues along paths in `ℂ∖{0,1}` on which the branches match.
- **Give it back.** Have PolylogarithmFunctions drop the hand-off.

## R06 (P3) — Five sentences point to a "normalization convention" that Conventions does not contain

**Location.** Each of these sentences sends the reader to the normalization convention:
- `:324` (§4.6), on Theorem 6.1(2) at `m=0`: "See the normalization convention."
- `:531` (§4.17a): "This corrects the published `(3.28)`, as recorded in the normalization convention."
- `:1039` (§5.15): "corrected conductor convention the normalization convention."
- `:2078` (§6.17h), on the "(6.2) … recorded in the normalization convention".
- `:2113` (§6.19): "as specified in the normalization convention".

Also `:2068` says: "Conventions records that discrepancy and the missing `−1/4`."

**Claim.** Conventions (`:17–27`) records only the Barnes normalization and the missing `−1/4` of Jorgenson–Smajlović–Spilioti. It says nothing about:
- Lagarias–Li III (3.28);
- Lagarias–Li III Theorem 6.1(2);
- Blomer's conductor row;
- the `(6.2)` Gamma coefficient.

The sentence at `:1039` is also not grammatical.

**Witness.** `grep -n "3.28\|6.1(2)\|conductor\|(6.2)"` over `README.md:17–27` returns nothing. The corrections themselves appear only in §4.6 (`:324`), §4.17a (`:531`) and §5.1 (`:551`).

**Repair.** Choose one of the following.
- Add one sentence per discrepancy to Conventions: `(3.28)` on `Z₁`, Theorem 6.1(2) at `m=0`, Blomer's δ₀ and ψ±2 rows, and JSS `(6.2)` at `m=0` against `(8.4)`.
- Point each sentence at the section that actually records the correction, for example `:1039` → "with the corrected conductor table of §§5.1 and 5.16".

## Previous findings

- **r11 R01 — repaired**, by the other pull requests.
  - #856 at 2cbcfe8, `ArithmeticGaloisRepresentations/README.md:2303–2309`: "the standard additive character … are AnalyticNumberTheoryPartII §5.3g; … `F⊥ = F` (`TauCetiRoadmap.AnalyticNumberTheoryPartII.adeleRing_selfDual`) … are its §5.3h".
  - #851 at 04dd46e, `GeometryOfNumbersAndQuadraticArithmetic/README.md:1099`: "the adelic Schwartz–Bruhat space … are those of AnalyticNumberTheoryPartII §§5.3g–5.3h".
  - This pull request's description now lists only #1126 under "Depends on".
- **r11 R02 — repaired.** #1409 at aa03308, `ClassicalArithmeticCompletion/README.md:14073`: "AnalyticNumberTheoryPartII §5.3g supplies the standard character ψ_v of each completion F_v". The remaining consumer-list step is now R04.
- **r11 R03 — remains repaired.** `Suggested.lean:290` declares `adeleRing_selfDual`, and `README.md:677` names it.
- **r11 R04 — remains repaired.** `README.md:682`: "it contains `F` because `ψ` is trivial on `F`".

## Verified sound

**Gate, dependency check and build.**
- My gate rerun on 0717d3f prints `gate AnalyticNumberTheoryPartII: set_option=0 … statement-hygiene=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The worker's gate adds `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2351 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This roadmap is at ORDER.txt line 50, after AnalyticNumberTheoryPartI (49).
- `changes.md` shows no file changed outside the folder.

**Elaboration.**
- I appended `#check @name` for all 31 declarations to a scratch copy of `Suggested.lean` and ran it through `lake env lean`. It exits 0, prints 14 `sorry` warnings and nothing else.
- The elaborated types keep every binder. Examples:
  - `exists_unique_restrictedAddHaar` keeps `[Countable ι]`, `[∀ i, SecondCountableTopology (G i)]`, `[BorelSpace (Πʳ …)]` and `Fact (∀ i, IsOpen (B i))`.
  - `exists_unique_quotientMeasure` keeps `[LocallyCompactSpace ↥H]` and both `IsMulRightInvariant` instances.
- Each type matches its README statement in generality.

**One-tactic probe.** I replaced each of the 14 `sorry`s with `simp`, `rfl`, `infer_instance`, `aesop`, `decide`, `norm_num`, `trivial` and `positivity`, in eight scratch files. All 112 attempts fail (14 errors per file), so no statement is padding.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). 92 backticked library names and modules were checked by declaration grep; all resolve. Among them:
- `ZMod.LFunction` (`Mathlib/NumberTheory/LSeries/ZMod.lean:85`) is defined as `N^(−s)Σ_jΦ(j)hurwitzZeta(j/N,s)`. This is §4.15's identity, so §4.15's derived reading is consistent.
- `DirichletCharacter.LFunction` (`…/LSeries/DirichletContinuation.lean:60`);
- `HeckeCoset` and `IsHeckeTriple.of_diagonal` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:157`, `:91`);
- `haarMeasure`, whose `to_additive` form is `addHaarMeasure` (`Mathlib/MeasureTheory/Measure/Haar/Basic.lean:520`);
- `DoubleCoset.Quotient` (`Mathlib/GroupTheory/DoubleCoset.lean:79`);
- `NumberField.dedekindZeta_residue` (`…/NumberField/DedekindZeta.lean:57`);
- `Polynomial.bernoulli` (`…/BernoulliPolynomials.lean:48`, with `B₁(X)=X−1/2`);
- `SchwartzMap.tsum_eq_tsum_fourier` (`…/Fourier/PoissonSummation.lean:215`);
- `PontryaginDual` (`…/PontryaginDual.lean:40`);
- Tau Ceti `UniversalCover` and `basepointLift` (`TauCeti/AlgebraicTopology/UniversalCover/Basic.lean:70`, `:151`);
- `HeckeCosetModule.mul_comm_of_antiInvolution` (Tau Ceti).

**Cross-roadmap citations resolved** (main 7bf4638 and the open heads). 19 sections or ids were opened:
- VonNeumannAlgebras V10.Hecke, V10.AffineHecke, V10.AffineAP and V10.AffineType (main `README.md:2494–2766`). V10.AffineType proves type III with no finer type ("No finer type is inferred"), so §§6.41–6.42's `III₁` refinement is new.
- OperatorAlgebraDynamics D1, D2 and D7 (`:148`, `:221`, `:603`).
- AmenableGroups Layer 6, including the directed-union step for all abelian groups (`:404–406`).
- UniversalCovers Stages 0 and 2 (`Completed/…:63`, `:98`).
- FuchsianOrbifolds Layers 0, 1, 2 and 4.
- DifferentialGeometry Layer 12 (`:910–931`): `laplaceBeltrami := divergence ∘ mgradient`, the measure, and Green.
- ProfiniteArithmetic Layer 0; ZerosOfLFunctions Layer 1 and 6.4d; GlobalNumberFields Layers 4, 5 and 10.
- AnalyticNumberTheoryPartI §§0.9, 0.23a, 0.31b, 0.34, 2.1a, 2.3a, 2.5, 2.7, 2.15, 2.21, 2.31e, 3.23 and 3.24 at #1126. The sections all exist; R02 lists the names that do not.
- Incoming ids: 18 section ids that other heads cite from this README all exist here (§§4.1, 4.5c, 5.3f–5.3n, 5.4–5.7a, 5.21, 5.28, 5.29).
- `overlaps.md` reports no open pull request that changes this folder or drops a cited id.

**Ownership.** I compared the five closest roadmaps in `overlaps.md`, and every roadmap that cites this one (`roadmaps grep`, 214 lines), against `README.md:7` and `:11–15`. The findings are R01, R04 and R05. No other open head states an object this roadmap owns.

**Sources read at their locators** (15 seeded targets).
- [R101], the arXiv v1 of [94] (1506.06161v1): Theorem 2.3 at p.13, Theorem 4.1 at p.33. (2.5) prints `+sΦ`, and (4.4)/(4.9) print `−s`. The README's "minus sign" is right (see Source issues).
- [95] (1005.4967v2): Theorem 2.1, (2.7)–(2.10), p.5, matches §4.9 and `lerch_completed_functional_equations` term for term.
- [99] (1005.4712v2):
  - Lemma 3.3, (3.20)–(3.25), pp.12–13;
  - Lemma 3.4, (3.28)–(3.35), pp.14–15;
  - Theorem 2.1's proof, (3.36)–(3.37), pp.15–16;
  - §1 (1.1)/(1.3)/(1.4), pp.1–2, gives only the Hurwitz and periodic series. §4.15 says the Dirichlet comparison is derived and points to `ZMod.LFunction`.
- LOWW:
  - line 588–595 and 624–630 (p.12): the definitions of §5.9 and its dual (Prop. 3.7(3));
  - line 606–636 (pp.12–13): Proposition 3.7, residues `A_k(1+3^(−r(α)−r₂))` and `B_k3^(−r(α)/2)`;
  - line 643 (p.13): Lemma 3.8, used by §5.27.
- [102], read as arXiv 0907.4867v1. §2.1 (7)–(16), Lemma 2 (27)–(28), (29) and (31)–(36) carry the README's equation numbers. The R1–R4 regions match §5.18's `B₀–B₃`. (33)'s `B₁` entries agree with `H diag(r) Hᵀ/4` from §5.23's table: `(0,0)`: `−4^(1−s)`, `(0,1)`: `4^(1−s)−2`, `(0,2)`: `2^(1−s)−2^s`, all times `π^(s−½)Γ((1−s)/2)/((4^s−4)Γ(s/2))`.
- [117] (0907.1456v1) §1, p.2: the ratio set over `gA∩A`, with `gμ(Z)=μ(g⁻¹Z)`. This is §6.5's convention exactly.
- [112] Connes–Marcolli: Definition 3.6 at printed p.446; (3.135), (3.139) and (3.140)–(3.141) at p.475; (3.142) at p.476; (3.138), used by §6.40, at p.475.
- [116] (2512.16681v2): (1.3) at p.3 and (8.8) at p.28 lack the `−1/4`, as Conventions says; §4, (4.2)–(4.6), pp.13–15, is used by §6.4a.
- [109] Heath-Brown (open copy, matwbn): Theorem 1 and Corollary 1 at p.237, Corollary 2 and Theorem 2 at p.238. They match `quadratic_large_sieve` and `quadratic_fourth_moment` exactly.

**Adversarial table** (36 rows).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.4 `(z∂_z+c)∂_cΦ=−sΦ` | `z=1/2,c=1,s=−1` | `Φ=c/(1−z)+z/(1−z)²=4`; LHS `=Φ(s−1)` route `=4`; `−sΦ=4`; `+sΦ=−4` | Holds; `+s` fails | None |
| §4.9 even/odd FE | `a=c=1/2` | multipliers `e^(−πi/2)=−i`, `i·(−i)=1`; `L₊=ζ−ζ=0` | Holds | None |
| §4.15 | `χ₄`, `s=2`; `q=1` | `(ζ_H(2,¼)−ζ_H(2,¾))/16=(17.1973−2.5419)/16=0.91597=G`; `ζ_H(s,1)=ζ(s)` | Holds | None |
| §5.9 | `O_F³`; trace test | weight `1/|S₃|=1/6`; `uv(u−v)`: `b=1` fails `3∣b` | Holds | None |
| §5.11 | Dirac on a point; `h=diag(2,1)∈GL₂(ℚ)` | `3·2^(2s)`; `|2|_𝔸=2·½=1` | Holds | None |
| §5.12 | `ξ=R/(s−1)+T/(s−5/6)` | `C(1)=R/6`, `C(5/6)=−T/6`; residues `6C(1)=R`, `−6C(5/6)=T` | Holds | None |
| §5.17 | `d=9,ψ1,n=3`; `d=1,ψ2,n=3`; `d=3` period | `0`; `−1`; `(3/1)=1,(3/13)=1`, period `12=4d` | Holds | None |
| §5.18 | `(−2,−2)`, `(0,0)`, `Q` | in `B₄∖B₃`; not in `B₅`; `Q(10,10)=1083/4`; `min(2|x|²+3−Q)=0` at `(−3/2,−3/2)` | Holds | None |
| §5.22 | `ψ1,d=1,s=−1`; `d=9` | `(1−2)(−1/12)=1/12`; `(1−3^(−s))ζ₂(s)` | Holds | None |
| §5.23 | `ψ−2,s=0`; `ψ2,s=½`; `ψ1,s=0` | `√(8/π)/√π=0.90032`; `1`; `1/Γ(0)=0` | Holds | None |
| §5.26 | `B(0)[(1,0),(1,0)]` | `(2/π+4/(3π)+2/π+0)/4=4/(3π)` | Holds | None |
| §5.27 | order of `c_αβ` at 1 | real: 1; complex: 2 (`sin(5π/6)=½≠0`); `ξ(0)` order `≥n−1`: `n=1`→0, `n=2`→1 | Holds | None |
| §6.4 | `{λ}`; `λ_j=1`; `cλ` | `λ^(−s)`; tsum `0` (divergent); `c^(−s)` | Holds | None |
| §6.5 | `β=1,q=2` | `μ(2Ẑ)=½`; density `2`; inverse `½` | Holds | None |
| §6.15 | `{λ₁,λ₂}`; genus 2 | `det′(cΔ)=c²λ₁λ₂=c^(ζ(0))det′`; `ζ(0)=−4/3` | Holds | None |
| §6.45 | `x′₂,x₂`, `β=2` | both sides `2^(1−β)=½`; with `σ_(−iβ)`: `2^(1+β)=8`; `φ(e(½))=−½=(6/π²)(−π²/12)` | Holds | None |
| `lerchContinuation_solvable` | basepoint `(½,−1,½)` | `z∉{0,1}`, `c∉−ℕ`; denominator `1+e^(−t)∈[1,2]`, integrable | Well posed | None |
| `lerch_completed_functional_equations` | `(1−s,1−c,a)∈D` | `0<Re(1−c)<1` | Holds | None |
| `complexHurwitzContinuation_exists` | `m=0,1`; `c=1,½,1+i` | `−½`, `−1/12`, `0`, `−½−i` | Holds | None |
| `barnesG_asymptotic` | `N=1`, `r>0`; `|t+z|` bound | `B₄−B₄({t})=−{t}²(1−{t})²≤0`; `|t+z|²−(t+|z|)²cos²(θ/2)=(1−cosθ)(t−|z|)²/2≥0`; `log A=0.2487545=1/12−ζ′(−1)` | Holds | None |
| `quadratic_large_sieve` | `M=1,N=3` | `0` (`a=(1,−1)`), `4` (`a=(1,1)`); HB Thm 1 | Holds | None |
| `quadratic_fourth_moment` | `σ=½,1`; principal | `Q+Q(1+|t|)`; `Q+1`; `ζ` pole at `σ=1,t=0` excluded by `χ≠1` | Holds | None |
| `quadraticDoubleSeries_continuation` | `A` row 1; `e` table | `(½,½,½,−½)` at `(ψ1ψ1),(ψ1ψ−1),(ψ−1ψ1),(ψ−1ψ−1)` = Blomer (32); `e=+1,−1,−1,+1` | Holds | None |
| `exists_unique_restrictedAddHaar` | `Ẑ`; `p⁻¹ℤ_p` box; `2μ₂` | `1`; `p`; `2`; finite mulSupport | Holds | None |
| `adeleRing_selfDual` | `ψ(1/6)`; `ψ′=e(x_∞)` | `e(1/6−½−2/3)=1`; `ψ′(½)=−1` | Holds | None |
| `exists_unique_quotientMeasure` | `ℤ≤ℝ`; `ax+b` vs diagonal | Lebesgue on `[0,1)`, mass 1; `Δ_G|_H=a^(±1)≠1` | Holds; hypothesis needed | None |
| `gl2_classNumber` | `ℚ`; `ℚ(√−5)` | 1; 2 | Holds | None |
| `firstEisenstein_generate` | characters `ζ=1,i,−1,−i` | `e_(1,¼)↦(0,−i/2,0,i/2)`; `1+8e_(1,¼)²↦(1,−1,1,−1)=e(½)` | Holds | None |
| `critical_scaling_measure_unique` | `δ₀`; `β=1` | `2_*δ₀=δ₀≠2δ₀`; Haar | Holds | None |
| `supercritical_scaling_measures` | `ν=δ₁`, `β=2` | point `n` mass `n^(−2)·6/π²`; `Ẑ` mass 1; `W` mass `0.60793` | Holds | None |
| R01: §5.3h vs `addChar_equiv` | `F=ℚ` | both assert `ξ↦ψ(ξ·)` is a bijection `ℚ→(ℚ\𝔸)^` | Same theorem | R01 |
| R02: PartI names | grep at 70913eb | 0 hits for each of 6 names | Absent | R02 |
| R03: §§5.3j–5.3n | proposed Checks | `1`, `1`, `(1−q^(−s))⁻¹`; mass 1; `t=2`; `7/6`, `2` | Values hold | R03 |
| R04: consumers | #1421, #1409 | §5.3k and §5.3g cited; not listed | Incomplete | R04 |
| R05: `Li₂(½)` | `n=2,z=½` | `zΦ(½,2,1)=0.5822405=π²/12−(log2)²/2` | True, unowned | R05 |
| R06: Conventions | `:17–27` | 0 mentions of (3.28), 6.1(2), δ₀ row, (6.2) | Dangling | R06 |

## Not verifiable

- **Wright [103]** (GDZ, `PPN235181684_0270`). The fetch succeeded, but the scan is image-only and this worker has no OCR. Affected: §5.11's §§2–3 locators and §§5.3a, 5.3b, 5.3l–5.3n, 5.21a–5.21w. The mathematics of §5.11 was checked by computation (table rows).
- **Datskovsky–Wright [105].** Image-only, already in `needs-references.toml`. Affected: §5.12's Theorem 6.2(i)–(ii), p.71, and the order-one claim of §5.21t. The LOWW proof (line 637–641) attributes the order-one statement to Shintani and Wright 1982, not to DW.
- **Sarnak [115]** (IAS PDF). Image-only. Affected: §§6.4 and 6.15 at §1, (1.1)–(1.5), p.603. Both were checked by computation.
- **Published [94]** (Springer). The sources service classes the host as paywalled, so only [R101] (arXiv v1) was read. Its page numbers coincide with the README's for Theorems 2.3 and 4.1.
- **Published [102]** (Cambridge). The host is not classified. The equation numbers were checked in arXiv v1; the published pages 358–364 were not.
- **Tate [129]** (Cassels–Fröhlich). Not open access.
- **JSS (6.2) at `m=0`.** The text extraction cannot tell `(1+m)/2` from `1+m/2`, and PDF rendering is unavailable. The "incompatible Gamma coefficient" claim at `:2068` was therefore not confirmed. `(8.4)` (single `logΓ(s)`) agrees with Sarnak's `Γ₂(s)²/Γ(s)`.
- **AnalyticNumberTheoryPartI §0.34's source** (its reference [109], a 1 October 2026 preprint). Not read; that roadmap's review owns it. §5.7a's logarithmic bound depends on it. §5.7's `ε`-form does not (`README.md:814`).

## Source issues

- **Misprint** in R101 (Lagarias–Li III, arXiv v1) at Theorem 2.3(2), (2.5), p.13: the source says `(z∂_z+c)∂_cΦ=sΦ`; it should be `−sΦ`, as its own (4.4) and (4.9), pp.32–33, state; affects nothing.
- **Error** in R101 (Lagarias–Li III, arXiv v1) at Theorem 3.4, (3.28), p.27: the source says the `Z₁^k`-monodromy of every `f_p` vanishes; for `p=0` it is `(e^(2πiks)−1)f₀`, because `a^(s−1)` winds once about `a=0`; affects a stated result.
- **Misprint** in R95 (Lagarias–Li II, arXiv v2) at §2, (2.6), p.5: the source says `L^±=ζ(s,a,c)±e^(2πia)ζ(s,1−a,1−c)`; it should be `e^(−2πia)`, as in (2.7), (2.9) and Part I; affects nothing.
- **Misprint** in R95 (Lagarias–Li II, arXiv v2) at Theorem 2.1(2), p.5: the source says that (2.9) and (2.10) hold on `Ω̃`; it should name the functional equations (2.8) and (2.10); affects nothing.
- **Misprint** in R102 (Blomer, arXiv 0907.4867v1) at §2.1, p.4: the source says `ψ₂(n)=1` iff `n≡3,5` and `ψ₋₂(n)=1` iff `n≡5,7 (mod 8)`; these are the classes where each equals `−1`; affects nothing.
- **Misprint** in R102 (Blomer, arXiv 0907.4867v1) at §2.1, (11), p.4: the source repeats the first `δ₀` condition for `4d₀`; it should read `ψ=ψ₁, d≡3 (4)` or `ψ=ψ₋₁, d≡1 (4)`; affects nothing.
- **Misprint** in R102 (Blomer, arXiv 0907.4867v1) at proof of Lemma 2, p.9: the source says the tube `|Re s|²+|Re w|<5`; it should be `|Re w|²`; affects nothing.
- **Gap** in R109 (Heath-Brown, Acta Arith. 72) at Theorem 2, p.238: the source says `S(Q)` contains every real primitive character, including the conductor-one character, whose `ζ` has a pole at `σ=1, t=0`; it should exclude the principal character; affects nothing.
- **Error** in R116 (Jorgenson–Smajlović–Spilioti, arXiv v2) at (1.3), p.3, and (8.8), p.28: the source says the constant is `2ζ′(−1)−log√(2π)` per unit `−χ(X)`; with its `Z_I(1)=e^(2C log 2π)` this exceeds Sarnak's `det′Δ` by `e^((g−1)/2)`; it should include `−1/4`; affects a stated result.
