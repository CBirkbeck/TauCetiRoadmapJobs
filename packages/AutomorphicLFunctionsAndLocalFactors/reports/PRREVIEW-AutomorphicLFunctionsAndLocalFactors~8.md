# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 330bb72)

**Verdict:** needs changes

This is a full review of the folder at 330bb72. The previous review read the same head, and nothing in the folder has changed since. Line numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` unless marked `Suggested.lean`. There is one blocking finding (R01) and eight P3 findings. R06 carries the previous review's only finding, which is not repaired.

## R01 (P2) — The finite-place local Rankin–Selberg theorem is statable at the pins but absent

**Location:** `Suggested.lean:23–25`: "The all-place Godement–Jacquet and Rankin–Selberg theorems, multiplicity one, converse theorems and rational-period twisting need smooth automorphic cuspidal representations, restricted tensor Whittaker models and archimedean globalizations…". The targets are AL.3.2.3 (`:1556`) and AL.3.3.2 (`:1591`).

**Claim:** AL.3.2.3 (the gcd of the local integrals) and AL.3.3.2 (the local functional equation), at a finite place, are the local Rankin–Selberg theorem of Jacquet, Piatetski-Shapiro and Shalika. Every global Rankin–Selberg, multiplicity-one, converse and higher-rank newform target here rests on it, so it is a headline result. `Suggested.lean` does not state it. The docstring's reason for leaving it out names global carriers, none of which the finite-place theorem uses.

**Witness:** Every carrier exists at the pins. `AL3.whittakerFunctionals` (`Suggested.lean:428`) supplies the functionals. Mathlib `QuotientGroup.measurableSpace` (`Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:138`) and `SMulInvariantMeasure` (`Mathlib/MeasureTheory/Group/Defs.lean:59`) supply an invariant measure on `GLₘ(F) ⧸ Nₘ(F)`.

**Repair:** Add `theorem rankinSelbergLocal` to `AL3`, for `GL_{m+2} × GL_{m+1}`. That is the adjacent-rank case, where no `x`-integral occurs. Use the binders of `AL2.godementJacquetLocal`, and add:

- an irreducible smooth admissible `π'` on `GL (Fin (m+1)) F`;
- nonzero `λ ∈ whittakerFunctionals (m+1) π ψ` and `λ' ∈ whittakerFunctionals m π' ψ⁻¹`;
- a nonzero measure `μ` on `GL (Fin (m+1)) F ⧸ N` with `SMulInvariantMeasure` and `IsFiniteMeasureOnCompacts`, where `N` is the upper-unitriangular subgroup, given a real body as `lastRowStabilizer` is.

The integral is `∫ x, λ(π(ι g) v) * λ'(π' g v') * (a (det g))^(s − 1/2) ∂μ` at `g = (Quotient.out x)⁻¹`. It is well defined because the integrand is left `N`-invariant. Here `ι : g ↦ diag(g,1)` is a monoid hom with a real body.

Conclude as `godementJacquetLocal` does: there are `P` with `P(0)=1` and an abscissa `c` such that every such integral converges for `Re s > c` and continues meromorphically; its product with `P(q^(−s))` is a Laurent polynomial; one such product is nonzero at each `s₀`; and the functional equation of AL.3.3.2 holds with a nonzero monomial `ε`. Cite the new name in AL.3.2.3 and AL.3.3.2, and in the list at `:223`.

**Tested:** take `m=0`. Then `N` is trivial, the quotient is `Fˣ` and `μ` is Haar. Let `π` be the unramified principal series with Satake roots `α₁,α₂`, and `π'=χ` unramified with `χ(ϖ)=β`. The spherical Whittaker function has `W(diag(ϖ^k,1))=q^(−k/2)h_k`, where `h_k=(α₁^(k+1)−α₂^(k+1))/(α₁−α₂)`. The integral is `Σ_k h_k(βq^(−s))^k=((1−α₁βq^(−s))(1−α₂βq^(−s)))^(−1)`. So `P(T)=(1−α₁βT)(1−α₂βT)`, `P(0)=1`, and the product is 1, which is nonzero at every `s₀`.

## R02 (P3) — 29 targets need later targets, and the layer Dependencies form cycles

**Location:** `:236`: "The document groups targets by layer; these finer dependencies specify their acyclic construction order." The Dependencies lines show the cycles: AL.2 at `:1453` ("the local and global analytic prefixes of AL.3"), AL.3 at `:2237` ("AL.4's determinant interface"), AL.4 at `:2334` ("AL.2–AL.3 local factors").

**Claim:** The layers are not in build order. The repository README's "No gaps" rule counts "a forward reference to a later layer" as a gap. I parsed every `*Needs:*` and Prerequisites line: there are 129 targets, 309 edges and no target-level cycle, but 29 edges point forward. They make layer-level cycles AL.1⇄AL.2, AL.2⇄AL.3 and AL.3⇄AL.4:

- AL.1.3.2 needs AL.2.1.2–AL.2.1.5, while AL.2.1.4 needs AL.1.2.4.
- AL.2.1.1 needs AL.3.1.1–AL.3.3.2, while AL.3.3.4 needs AL.2.1.1.
- AL.3.12.1 needs AL.4.1.1, while AL.4.2.1 needs AL.3.2.3.

AL.1's Dependencies (`:1123`) do not list AL.2.

**Witness:** AL.1.3.2's *Needs:* (`:924`) starts "The Godement–Jacquet zeta integral (AL.2.1.2), … The Godement–Jacquet functional equation (AL.2.1.5) at `n=1`". AL.R.5, placed before AL.0, needs "AL.3 strong multiplicity one" (`:290`).

**Repair:** Make these moves:

1. AL.1.4.1 after AL.1.4.3.
2. AL.1.3.2–AL.1.3.3 to the end of AL.2.1, after AL.2.1.5.
3. AL.4.1.1 into AL.2.1 after AL.2.1.5. It needs no target of this roadmap.
4. AL.2.1.1 into AL.3.3, after AL.3.3.3.
5. AL.2.3.1–AL.2.3.2 after AL.3.3.4.
6. AL.2.6.3–AL.2.6.4 after AL.3.6.3.
7. AL.3.10.1 into AL.0 after AL.0.3.7, with AL.R.3 directly after it.
8. AL.R.4 after AL.3.6.3.
9. AL.R.5 after AL.3.7.2.

Then renumber, and add one old → new line for each moved id. Other roadmaps cite AL.1.3.2, AL.1.3.3, AL.2.1.1, AL.2.6.4, AL.3.10.1, AL.4.1.1, AL.R.3, AL.R.4 and AL.R.5. Replace the sentence at `:236` with the layer order, and make each layer's Dependencies list only earlier layers.

**Tested:** rebuilding the parsed graph in the moved order gives 0 forward edges.

## R03 (P3) — Two Lean names that other roadmaps cite have no mapping

**Location:** the map "Identifiers owned elsewhere" (`:17–31`). The paragraph at `:886` maps only ClassicalArithmeticCompletion's `TateZeta.epsilonFactor…` names.

**Claim:** Two names that other roadmaps cite as this roadmap's appear nowhere in this README:

- ClassicalArithmeticCompletion, on main, cites three names this roadmap no longer declares.
- GlobalShtukasAndFunctionFieldLanglands cites `TwoLegShtuka`, which an earlier revision of this roadmap removed.

**Witness:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:271–273` on main links `#standard-additive-character` and cites `AL0.StandardAdditiveCharacter.conductor`, `.diagonal` and `.nontrivial`. Neither those names nor that anchor occurs here. GlobalShtukasAndFunctionFieldLanglands cites `TwoLegShtuka` at its README lines 96, 907 and 922.

**Repair:** Add two lines to `:19–31`, without backticks as at `:886`:

- "AL0.StandardAdditiveCharacter.conductor, .diagonal and .nontrivial, cited by ClassicalArithmeticCompletion, and AL.0's self-dual Haar measure: AnalyticNumberTheoryPartII §5.3g (conductor `𝔇_v^(−1)`, nontriviality, self-dual measures) and §5.3h (triviality on the global field)."
- "TwoLegShtuka, cited by GlobalShtukasAndFunctionFieldLanglands: the two-leg shtuka of Two-leg unramified shtukas (AL.3.10.8)."

**Tested:** AnalyticNumberTheoryPartII §5.3g (its README line 682) states the conductor `𝔇_v^(−1)` and the nontriviality of ψ, and defers triviality on `F` to §5.3h. Its line 3171 already lists ClassicalArithmeticCompletion as a consumer of exactly these.

## R04 (P3) — The supplier row misstates Tau Ceti's cusp-form abscissa bound

**Location:** `:73`: "In the coefficient normalization the recorded absolute-convergence bound is Re(s)>k/2+1 and the comparison includes width⁻ˢ."

**Claim:** The pinned `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le` gives `(k+1)/2`, not `k/2+1`.

**Witness:** `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:145–147` bounds the abscissa by `((k:ℝ)+1)/2`. The value `k/2+1` is the hypothesis `hs` of `CuspForm.LSeries_qExpansion_coeff_eq` (`:177–178`). At `k=2` the two bounds are 3/2 and 2.

**Repair:** Write "`CuspForm.abscissaOfAbsConv_qExpansion_coeff_le` gives absolute convergence on `Re(s)>(k+1)/2`, and `CuspForm.LSeries_qExpansion_coeff_eq` identifies the series with `width^(−s)·ModularForm.L` on `Re(s)>k/2+1`."

## R05 (P3) — The stabilization Check gives the value under the wrong name

**Location:** `:2393`: "`α=1,β=3` satisfies only the product condition and gives `a_β(3)=−3`, so it is not the `α=1` refinement".

**Claim:** The definition at `:2389`, `a_α(n)=a(n)−β·1_(p|n)a(n/p)`, makes the coefficient indexed by β subtract α. So `a_β(3)=a(3)−1·a(1)=−1`, and the value −3 is `a_α(3)`.

**Witness:** For `y²=x³−x`, `#E(𝔽₃)=4`, so `a(3)=0` and `a(1)=1`. Then `a_α(3)=0−3·1=−3≠α=1`, while `a_β(3)=0−1·1=−1`.

**Repair:** Write "…gives `a_α(3)=a(3)−β·a(1)=−3≠α`, so `f_α` is not a `U₃`-eigenform with eigenvalue 1".

## R06 (P3) — The pull-request description still contradicts the README (carried from the previous review, not repaired)

**Location:** the pull-request description. "Why Tau Ceti wants it" says the consumers "take rank-one Hecke continuation … from here". "Approach and generality" says: "Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral". The body says: "The common adelic Tate/Fourier prefix … consumed from ArithmeticGaloisRepresentations §2.7", and that the LFunctions and ZerosOfLFunctions pull requests "must merge first".

**Claim:** The description misdescribes ownership and dependencies.

**Witness:** `:15` says "their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a". The AnalyticNumberTheoryPartII row at `:72` assigns it the Fourier prefix (§§5.3g–5.3j). LFunctions and ZerosOfLFunctions are already on main.

**Repair:** Change the description only; nothing in the folder changes.

- Replace the first sentence with "…take the global standard L-function from here; their rank-one Hecke continuation is AnalyticNumberTheoryPartI §2.3a."
- Replace the second with "The global Godement–Jacquet continuation is proved for every n ≥ 1 and identified at n = 1 with AnalyticNumberTheoryPartI §2.3a's Hecke continuation."
- Replace the Fourier-prefix sentence with "The local and adelic Fourier analysis and local zeta integrals are AnalyticNumberTheoryPartII §§5.3g–5.3j; the rank-one scalar comparison uses ArithmeticGaloisRepresentations §2.7."
- Delete the sentence about the LFunctions and ZerosOfLFunctions pull requests.

## R07 (P3) — Suggested.lean: the module title, one forbidden scope word and two stale target labels

**Location:** `Suggested.lean:4` reads "headline target statements". `Suggested.lean:39` reads "These headline results are deferred as Lean statements until their objects exist." `Suggested.lean:114` carries "AL.1/local-uniqueness-theorem" and `Suggested.lean:153` carries "AL.1/rank-one-local-functional-equation".

**Claim:** The required form of the module title is "<title>: target signatures". The repository README forbids the word "deferred". The two labels name no target, because the README numbers these targets AL.1.2.5 and AL.1.3.2.

**Witness:** `:823` is "#### AL.1.2.5 Local uniqueness…" and `:905` is "#### AL.1.3.2 Rank-one local zeta integral and functional equation". The rule is in the repository README.md, "Be definite about scope".

**Repair:**

- Make line 4 "# Automorphic L-functions and local factors: target signatures".
- Make lines 39–40 "These headline results are not statable at the pins." and keep the sentence that follows.
- Begin the docstring at `:114` with "AL.1.2.5: every archimedean…" and the one at `:153` with "AL.1.3.2 at the real and complex places:…".

## R08 (P3) — Closing sections: eight cited works are missing from References, and there is no Downstream consumers section

**Location:** References at `:2464–2534`. The consumers are a bold paragraph inside Scope and ownership (`:15`).

**Claim:** The body cites eight works that References omits:

- Shatz (`:1941`, `:1951`, `:1961`)
- Deligne, *Les constantes des équations fonctionnelles des fonctions L* (`:1921`)
- Serre, *Local Fields* (`:1921`)
- Gelbart–Shahidi (`:1867`, `:1871`)
- Raghuram–Shahidi (`:2210`, `:2212`, `:2227`)
- Clozel, *Motifs et formes automorphes* (`:127`, `:288`)
- Bernstein–Krötz (`:248`)
- Gelbart–Jacquet (`:1893`)

The required README shape also has a `## Downstream consumers` section.

**Witness:** Searching the References block for each of the eight names returns no match.

**Repair:** Add the eight entries, with full bibliographic data and the locators used in the body. Move the paragraph at `:15` into a `## Downstream consumers` section placed before `## References`.

## R09 (P3) — Code spans that swallow prose, and missing spaces

**Location:** Prose words have ended up inside code spans at `:622` "`F = ℂ it`", `:897` "`ε=2,L=3,L_dual=5 it`", `:954` "`c = 1 it`", `:1308` "`c=0 it`", `:1917` "`S=∅ it`", `:2225` "`n=2 it`" and `:2310` "`are(1−n_i)/2`". At `:686` the span "`F^×, S′(ω) = {…}`" runs the end of a phrase into the definition.

**Claim:** These sentences cannot be read as written. About 45 further tokens run words and symbols together.

**Witness:** for example `:1027` "losesπ", `:1437` "exactlyρ(1)=1", `:1710` "and1+iσ", `:2448` "conductor2ν" and `:2496` "Annals184 (2016),949–990".

**Repair:** Move "it" and "are" out of the spans (for example `:622` becomes "for `F = ℂ` it is"). Split `:686` into "`F^×`, `S′(ω) = {…}`". Insert the missing spaces.

## Previous findings

- **R01 of the previous review — not repaired.** The description still reads "AutomorphicSpectralTheory, the GL₂ and endoscopic transfer roadmaps and DirichletPadicLFunctions take rank-one Hecke continuation and the global standard L-function from here". It is carried as R06, which adds two further stale claims in the same description.

## Verified sound

**Gate and dependency check.** The worker's gate at 330bb72 reports every count 0 and `build=0`, OK. The head is unchanged, so I did not re-run the whole gate. I ran the dependency check on this head; it prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2369 edges, 0 problem(s)
```

Nothing outside the folder changes. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. Every supplier the README names is on main (AlgebraicCurves, AlgebraicVectorBundles, ClassFieldTheory, ClassicalArithmeticCompletion, EtaleCohomologyFoundations, JacobianChallenge, LFunctions, ReductiveGroupsPartII, SchemeAndStackFoundations), completed (ArithmeticDirichletSeries, GlobalNumberFields, LocalFieldsRamification, RestrictedProducts), or earlier in the merge order (positions 25–70, against this roadmap's 92).

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 8.6 s. It gives exactly 12 `declaration uses sorry` warnings, at lines 66, 71, 82, 116, 129, 155, 213, 256, 313, 387, 403 and 449, and nothing else. The file has a single `import Mathlib`, no `set_option`, no `lemma` and no `#eval`, `#print` or `#synth`.

**`#check @` audit.** I appended all 27 declarations to a scratch copy and elaborated it. Every type matches its README statement:

- The two "dropped binder" leads are `hbesselK`, which appears as an anonymous hypothesis in both Bessel types.
- `AL2.gjZetaIntegral` carries `[Field F] [MeasurableSpace F]`, and `godementJacquetLocal` carries `IsNonarchimedeanLocalField` and `BorelSpace` itself.
- The `GL2Blueprint` section variables appear in every type that uses them.
- `Units.instMeasurableSpace` is `comap Units.val` (`Mathlib/MeasureTheory/Group/Arithmetic.lean:668`). So `ν` on `Fˣ` and on `GL` is a Haar measure for the subspace Borel structure, and the Tate and Godement–Jacquet integrals are the intended ones.
- `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean:29`), so `V ≠ 0` is built in.

**One-tactic probe.** On a scratch copy, every one of the 12 `sorry`s was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (norm_num; done) | (exact le_rfl) | (aesop; done)`. All 12 fail, so none is padding.

**Headline theorems.** Twelve are stated: the point-supported finite jet (AL.0.3.6), the two Bessel identities (AL.0.5.2–AL.0.5.3), archimedean and finite eigenline uniqueness (AL.1.2.5), the nonarchimedean and archimedean rank-one functional equations (AL.1.3.2), the generic newform line (AL.2.1.1), the local Godement–Jacquet theorem (AL.2.1.4–AL.2.1.5), Casselman's existence and dimension theorems (AL.2.2.2, AL.2.2.4), and Whittaker uniqueness (AL.3.1.1).

The docstring names the following as not statable, each with its missing carrier: the archimedean Godement–Jacquet theorem; the global Godement–Jacquet and Rankin–Selberg theorems; multiplicity one; the converse theorems; rational periods; the identification of ε with `tateLocalConstant` and of the root number; the Maass functional equation and norm; curve reciprocity, the pure realization and intersection-complex purity; shtukas; the Riemann hypothesis for cuspidal pairs; and the Satake, Weil–Deligne and AL.5 comparisons.

The finite-place local Rankin–Selberg theorem is statable and absent (R01).

**Seeded sample.** I fetched "Check for the theta-Mellin formula" (`:1700–1702`, AL.3.5.1; Cogdell, Columbia lectures, §1.1.3, pp.4–5) as `CogdellColumbia` from the author page (sha256 `af30e112…`).

- `CogdellColumbia` line 251 opens §1.1.3 on p.4 (page 4 starts at line 194, page 5 at line 271).
- Lines 264–267 give `E(g,s;Φ,η)=|det g|^s∫_{k^×\𝔸^×}Θ′_Φ(a,g)|a|^{ns}η(a)d^×a` for `Re s>1`, with η a unitary idele-class character and `Θ′` omitting `ξ=0`.
- Lines 273–277 on p.5 give meromorphy, possible simple poles at `s=iσ, 1+iσ` when `η=|·|^(−inσ)`, and `E(g,s;Φ,η)=E(ᵗg⁻¹,1−s;Φ̂,η⁻¹)`.
- Lines 279–289 give the section through `e_n` and the `(n−1,1)` parabolic.

The theorem number, page, hypotheses (η unitary, `Re s>1`) and the statement as the README writes it all agree. The Check is computed in the table. The README flags no locator as unverified.

**Library declarations opened at the pins.**

- Mathlib: I resolved all 52 names the README cites by grep. Ten I opened:
  - `Matrix.charpoly_fromBlocks_zero₁₂` (`LinearAlgebra/Matrix/Charpoly/Basic.lean:187`)
  - `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (`NumberTheory/LSeries/DirichletContinuation.lean:291`)
  - `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean:46`)
  - `QuotientGroup.measurableSpace` (`MeasureTheory/MeasurableSpace/Constructions.lean:138`)
  - `SMulInvariantMeasure` (`MeasureTheory/Group/Defs.lean:59`)
  - `Units.instMeasurableSpace` (`MeasureTheory/Group/Arithmetic.lean:668`)
  - `Representation.IsIrreducible` (`RepresentationTheory/Irreducible.lean:29`)
  - `TemperedDistribution`, `Distribution.dsupport`, `SchwartzMap.compCLMOfContinuousLinearEquiv`
- Tau Ceti:
  - `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` and `TauCeti.ne_zero_of_eqOn_dedekindZeta` (`NumberTheory/NumberField/DedekindZeta.lean:154`, `:196`), with the statements `:102–109` claims
  - `CuspForm.abscissaOfAbsConv_qExpansion_coeff_le`, `CuspForm.LSeries_qExpansion_coeff_eq`, `CuspForm.hasEntireExtension_qExpansion_coeff` (`NumberTheory/ModularForms/LFunction/Basic.lean:145`, `:177`, `:192`); see R04
  - `HeckeRing.GL2.Newform.LSeries_eulerProduct_hasProd` (`EulerProduct.lean:187`)
  - `TauCeti.fourierPontryaginDualEquiv` (`Analysis/Fourier/AddCircle.lean:364`)
  - `TauCeti.RestrictedProductGroup` and `TauCeti.rationalDiagonal` (`Topology/Algebra/RestrictedProduct/Basic.lean:59`, `Diagonal.lean:62`)

**Cross-roadmap citations, resolved at main or at the heads `roadmaps show` serves.**

- **AnalyticNumberTheoryPartI:**
  - §0.29 (line 740) defines `IsCenteredOrderOne`; §§0.29a–0.29b (lines 760, 768) state the paired Hadamard theorems.
  - §2.1a (line 1217) has the bullets `K_(−ν)=K_ν` and `K_(1/2)(x)=√(π/(2x))e^(−x)`.
  - Its `besselK` (its `Suggested.lean:626`) is literally the right side of `hbesselK`.
  - §2.3a (line 1357) and its `Suggested.lean:713–748` provide `heckeFiniteFactor`, `heckeArchFactor`, `heckeConductorScale` and `heckeContinuation`.
  - §2.22a (line 1750) exists.
- **AnalyticNumberTheoryPartII:** §5.3g (line 682) and §5.3h (line 699) are stated at number-field completions, with the same characters `exp(2πix)`, `exp(−2πi{x}_p)` and `exp(2πi(z+z̄))` as `:41–43`.
- **ArithmeticGaloisRepresentations:** "Local-constant Gauss sum" (line 2254, anchor `local-constant-gauss-sum`), "Standard-test-function evaluations" (2314) and "Root-number product formula" (2380) exist. `tateLocalConstant` is at line 2257–2265 and `Conductor.artinConductorNat` at 2732.
- **SmoothRepresentationsOfLocalGroups:** SR.1.1 (line 1045); SR.2.3 with *whittaker-functionals* (2187, 2251), which proves `GL₂` uniqueness at 2274; SR.5.1 (3698); *highest-derivative-adapter* (4910).
- **EtaleCohomologyFoundations** on main: §§0.9, 0.10, 0.11 and F.8 at lines 1120, 1145, 1157 and 1265.
- **InverseGaloisAndArithmeticFundamentalGroups:** §IG.0.T3 `VanishingCycles.etaleTraceFormula` (its lines 360, 568).
- The resolver reports no unresolved cross-roadmap citation. Its 28 Lean-name leads are the 24 names `Suggested.lean` declares plus the four supplier names above.

**Consumers.** 706 lines in other roadmaps cite this roadmap. All 42 distinct AL ids they cite resolve here, as a heading or through the map at `:19–31`. The only unresolved names are those in R03.

**Ownership.** I checked the following and found one owner for each object:

- GlobalShtukasAndFunctionFieldLanglands (its line 20) assigns Lafforgue's `GL_r` correspondence and the vector-bundle Harder–Narasimhan theory to AL.3 and restates none of it.
- EtaleDualityAndPerverseSheaves (its lines 90–91) consumes AL.3.10.10's intersection-complex purity, affine weight criterion and subquotient bounds.
- CountingBundlesAndHallAlgebrasOfCurves (its line 12) takes Harder–Narasimhan theory from GlobalShtukas, which takes it from AL.3.10.5.
- AutomorphicLFunctionsAndLocalFactorsPartII defers to Layers AL.0–AL.4 here.
- SmoothRepresentationsOfLocalGroups proves Whittaker uniqueness only for `GL₂`, which AL.3.1.1 consumes.

**Adversarial calculations.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| AL.3.5.1 theta–Mellin Check (sampled), `:1700` | point mass, `n=2`, `\|det g\|=3`, `θ₀=5`, `\|a\|=2`, `η=1`, `s=1` | `3·5·2^(2·1)=60`; without `n`: `3·5·2=30`; matches `CogdellColumbia` lines 264–267 | Pass |
| AL.3.5.1 central character `E(zg)=η(z)⁻¹E(g)`, `:1692` | substitute `a↦az⁻¹` | `\|z\|^(ns)·\|z\|^(−ns)·η(z)⁻¹E(g)`; the source's section lies in `Ind(δ^(s−1/2)η⁻¹)` | Pass |
| AL.3.5.2 zero modes, `:1714` | `n=2`, `g=1`, `η=1` | `κ∫_0^1 t^(2s)dt/t=κ/(2s)`: residues `−κΦ(0)/2` at 0 and `κΦ̂(0)/2` at 1 | Pass |
| `BesselHalfOrderDerivative` (`Suggested.lean:66`) | `c=1, 2, 0.3`; LHS by quadrature of `∫t·sinh(t/2)e^(−c cosh t)dt` | LHS `0.1665972450, 0.0247486375, 1.4034805167`; RHS `√(π/(2c))e^c E₁(2c)` gives the same 10 digits; Lean's `−√(π/2)e^c c^(−1/2)·negativeEi(2c)` is that RHS | Pass |
| `BesselLaplaceMellin` (`Suggested.lean:71`) | Gradshteyn 6.621.3 with `α=β=2πm`; `(m,t,s)=(1,½,2)`, `(2,¼,1.5)` | `₂F₁(…;0)=1` gives `√πΓ(s+t+1)Γ(s−t)/(Γ(s+1)(4πm)^(s+½))`; numeric LHS `4.66274e−3`, `3.07725e−3` against RHS `4.66274e−3`, `3.07725e−3` | Pass |
| `hbesselK` against §2.1a | `ν=½`, `c=1` | `K_(1/2)(1)=0.46106850=√(π/2)/e` | Pass |
| `pointSupported_finiteJet` (`:82`) | `δ₀`; `δ₀′`; empty support | `N=0`; `N=1` (`f=xe^(−x²)` has `f(0)=0`, `δ₀′f=1`); `T=0` | Pass |
| `archimedeanEigenSpace.finrank` (`:116`) | `ℝ`, `χ=1`, `χ=\|·\|` | `δ₀(f(a⁻¹·))=f(0)`; `∫f(a⁻¹x)dx=\|a\|∫f`; each eigenspace is one line | Pass |
| `localZetaIntegral_functionalEquation` (`:129`) | `ℚ_p` and `𝔽₃((t))`, `χ=1`, `f=1_O`, `ν(ψ)=0` | `Z=(1−q^(−s))⁻¹`, `f̂=1_O`, `Zhat(1−s)=(1−q^(s−1))⁻¹`, `γ=(1−q^(−s))/(1−q^(s−1))`; common strip `0<Re s+r<1` | Pass |
| `archimedeanLocalFunctionalEquation` (`:155`) | `ℝ`, `e^(−πx²)`; `ℂ`, `e^(−2π\|z\|²)` | `Z=Γ_ℝ(s)`, `γ=Γ_ℝ(1−s)/Γ_ℝ(s)`; `Z=(2π)^(1−s)Γ(s)=πΓ_ℂ(s)` | Pass |
| `finiteEigenSpace_finrank` (`:213`) and AL.1.2.2 | `χ=1` | `r′(ϖ)λ₀(f)=∫(f(y)−f(0)1_(P⁻¹)(y))d^×y=λ₀(f)−f(0)`, so only `ℂδ₀` is invariant | Pass |
| `genericNewform` (`:256`) | `n=0`, character of conductor `c` | `newformLocalK1 F 0 m=1+P^m` for `m≥1` and `O^×` for `m=0`; invariants are nonzero iff `m≥c` | Pass |
| `godementJacquetLocal` (`:313`) and AL.2.1.3 Check | trivial `GL₂`, `Φ=1_(M₂(O))` | `Z=(1−q^(−s−½))⁻¹(1−q^(½−s))⁻¹`, convergent exactly on `Re s>½`; `P(T)=(1−q^(−½)T)(1−q^(½)T)` | Pass |
| `casselmanNewvector` (`:403`) | unramified principal series (`c=0`); unramified Steinberg (`c=1`); `c=3`, `n=1` | dimensions `n+1` and `n`; ℕ-subtraction `1+1−3=0=max(0,n−c+1)` | Pass |
| AL.2.2.4 central character, `:1308` | `g=[[a,b],[g₂₁,d]]` | `g=h·diag(d,d)·diag(d⁻¹,1)` with `h=g·diag(1,d⁻¹)∈K₁` gives `ω_π(d)v` | Pass |
| `whittakerUniqueness` (`:449`) | `n=0`; trivial `GL₂` | rank 1; `ψ(x)≠1` forces rank 0 | Pass |
| R01 instance: local RS for `m=0` | unramified `π` with roots `α₁,α₂`; `χ(ϖ)=β` | `Σ_k h_k(βq^(−s))^k=((1−α₁βq^(−s))(1−α₂βq^(−s)))⁻¹` | Statable and true (R01) |
| AL.0.3.1 lattice duality, `:535` | `𝔽₃((t))`, `ψ(t·)` | `ν=1`, `O^⊥=P⁻¹`, `vol(O)=3^(−½)`, `vol(O)vol(P⁻¹)=1` | Pass |
| AL.1.3.1 ℚ₃ Check, `:895` | `ω` quadratic, `ψ=ψ₀(3·)`, `ν=c=1` | from AGR line 2262, `ε=ω(9)q^(1−2s)𝔤`, with `𝔤=3^(−½)(e^(−2πi/3)−e^(−4πi/3))=−i`; at `s=0` it is `−3i`; omitting `ν` gives `−i√3` | Pass |
| AL.1.3.4 (3.31), `:944` | `x=ϖ^(−ν−c)u` | `f̂^o(x)=ω(u)𝔤q^(−(ν+c)/2)=𝔤q^(−(ν+c)/2)·conj(f^o(u))`, and 0 off that shell | Pass |
| AL.1.3.5 (i), `:975` | unramified `ω`, conductor `ν` | `q^(−ν/2)⟨z₀(1−s,ω⁻¹),1_(P^(−ν))⟩=ω(ϖ^ν)q^(ν(½−s))`; Tate's `ρ(\|·\|^s)=N𝔡^(s−½)(1−q^(s−1))/(1−q^(−s))` | Pass |
| AL.1.6.1 `χ₄` Check, `:1094` | Gauss sum with `e^(−2πia/4)` | `−i−i=−2i`, normalized `−i`; times `ε_∞=i` gives 1 | Pass |
| AL.1.3.1 real Checks, `:891–892` | `ω=x⁻¹`; `ω=1` | `γ=iΓ_ℝ(3−s)/Γ_ℝ(s)`, since `x=x⁻¹ω₂`; `Γ_ℝ(s)/Γ_ℝ(1−s)=Γ_ℂ(s)cos(πs/2)` | Pass |
| AL.2.1.8 genericity, `:1248` | factorization; `q=2`, trivial representation | `(qα−β)(α−qβ)=q(α+β)²−(q+1)²αβ`; `(a,s)=(3,1)`: `9=1·9`, on the boundary | Pass |
| AL.2.6.3 completed adjoint, `:1427` | `r=0.7` | `Γ_ℝ(1)Γ_ℝ(1±2ir)=π⁻¹\|Γ(½+ir)\|²=1/cosh(πr)=0.219108` | Pass |
| AL.3.6.1 Check, `:1740` | `π₂=\|·\|^(2i)` | poles of `Γ_ℝ(s+2i)ζ(s+2i)` at `−2i`, `1−2i`; `σ=−2` | Pass |
| AL.3.9.4 `GL₂` dual polynomial, `:1869` | `h=½` | dual roots `q^h/α`, `q^h/β`: `1−a/(√q s)T+s⁻¹T²` | Pass |
| AL.3.12.2–AL.3.12.3, `:2140`, `:2150` | degree; `P=1−az+qz²` | `deg P−deg Q=(2g−2)n²` with `deg Q=2d`; `qz²P(1/(qz))=P(z)` | Pass |
| AL.3.14.1 conductor shift, `:2198` | `t_v u t_v⁻¹` | superdiagonal entries are scaled by `ϖ^(−n_v)`, giving `ψ(ϖ^(−n_v)·)` of conductor `O` | Pass |
| AL.5.2.2 Check (R05), `:2393` | `y²=x³−x`, `p=3`, `(α,β)=(1,3)` | `a_α(3)=−3`; `a_β(3)=−1` | Fail (R05) |
| AL.5.4.1 Check, `:2439` | `p=3,k=0,j=1` | `(1−3)(1−⅓)=−4/3` | Pass |
| `:73` CuspForm bound (R04) | `k=2` | pin `3/2`; README `2` | Fail (R04) |

The table covers the sampled target, all 12 headline theorems, the R01 instance and every statement a finding touches.

## Not verifiable

- **Godement–Jacquet, LNM 260, Theorems 3.3 and 8.7:** the text is paywalled, so I cited it by locator and did not read it. `godementJacquetLocal` was checked on the instances above instead.
- **Sources outside the seeded sample were not re-read this round.** These include Lafforgue, Yu, Humphries, Humphries–Nordentoft (the norm `2L_f(1,Ad φ)/cosh(πr)` of AL.2.6.4), Duke–Imamoğlu–Tóth, Zhang, Leslie, Raghuram and Rodrigues Jacinto–Williams. Their statements were computed where the table shows them.
- **Ownership against open pull requests** was checked only for the roadmaps named under Ownership and the suppliers above. It was not checked against the other open pull requests.

## Source issues

- none
