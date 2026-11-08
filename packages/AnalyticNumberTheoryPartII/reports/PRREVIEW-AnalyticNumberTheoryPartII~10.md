# Review of AnalyticNumberTheoryPartII (pull request #1167 at 26d0e1f)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 33 lines changed in `TauCetiRoadmap/AnalyticNumberTheoryPartII/` since 749c801.

- The gate, the dependency check and the elaboration pass.
- This head does its own part of r9's R01: the GeometryOfNumbersAndQuadraticArithmetic bullet is added, the ArithmeticGaloisRepresentations bullet is rewritten, the Fourier analysis is stated for every nontrivial character, and the Summary names the adelic harmonic analysis.
- The two consumer heads have not changed, so R01 is only partly repaired.
- The changed passages bring three new defects: R02, R03 and R04.

## R01 (P2) — §§5.3g, 5.3h and 5.3j still have two other owners, and the consumer bullets describe citations that do not exist

**Location.**
- `README.md:7`: "a later roadmap that uses any of these objects cites these sections rather than constructing them again".
- `README.md:3105–3106`: "GeometryOfNumbersAndQuadraticArithmetic §3.3 … takes from §§5.3g–5.3h …" and "ArithmeticGaloisRepresentations §2.7 (global inputs) takes from §§5.3g, 5.3h and 5.3j …".

**Claim.** This carries r9 R01, partly repaired.
- #856 is still at f901260 and #851 is still at 6143cad, the heads r9 read. Both still construct these objects themselves, and neither names this roadmap.
- The overlap has grown. This round's new §5.3h bullet (`:675`), restricted-product duality and the self-duality of `𝔸_F`, is also proved in ArithmeticGaloisRepresentations §2.7.
- The pull-request description is unchanged. Its "Dependencies" paragraph still lists 31 pull requests, and its merge-order paragraph names only #1126.

**Witness.**
- #856 at f901260, `ArithmeticGaloisRepresentations/README.md:2265–2273`: "Prove the restricted-product duality comparison …"; "Prove the diagonal self-annihilator formula". `:2285`: "Construct the Schwartz–Bruhat space on the adeles".
- #851 at 6143cad, `GeometryOfNumbersAndQuadraticArithmetic/README.md:1082`: "Construct `adelicSchwartzBruhat V`".
- `grep -c AnalyticNumberTheoryPartII` returns 0 on both.

**Repair.** This is r9's repair, which this head left undone on the other side.
1. In ArithmeticGaloisRepresentations §2.7, "Global inputs" (`README.md:2257–2285`), replace these constructions by citations of §§5.3g, 5.3h and 5.3j:
   - the trace character;
   - the local and restricted-product dualities;
   - `F⊥=F`;
   - the adelic Schwartz–Bruhat space, the self-dual transform and Poisson summation;
   - Tate's multiplicative measures.

   Keep its standard-test-function evaluations and root-number product formula.
2. In GeometryOfNumbersAndQuadraticArithmetic §3.3 (`README.md:1082`), cite §§5.3g–5.3h for `adelicSchwartzBruhat V`, the character, the self-dual measures and the transform, and keep the Weil operators.
3. In this pull request's description, reduce "Dependencies" to #1126, and name #851 and #856 in the merge-order paragraph as pull requests that merge after this one.

Tested: AdelicAlgebraicGroups (#792 at d2e6304) and AutomorphicLFunctionsAndLocalFactors (#924 at f4dd981, `README.md:11`, "AnalyticNumberTheoryPartII, §§5.3g and 5.3h, owns the standard trace …") made exactly this change.

## R02 (P2) — ClassicalArithmeticCompletion's open revision builds §5.3g again, including the character classification added in this round

**Location.**
- `README.md:658`: "every nontrivial character of `F_v` is `x↦ψ_v(ax)` for exactly one `a∈F_v^×`".
- `README.md:7`: the single-owner sentence.

**Claim.** #1409 revises ClassicalArithmeticCompletion, which is on main, and adds §7.12a. That section constructs the standard trace character and its conductor, the local self-dual measures, the local Schwartz–Bruhat spaces, Fourier inversion and the classification of the characters of a local field as `ψ(b·)`. That is §5.3g, including the sentence added at `:658`. It does not cite this roadmap, so the object has two owners and `:7` is false at that head.

Main's ClassicalArithmeticCompletion routes these objects through AutomorphicLFunctionsAndLocalFactors AL.0–AL.1, and that roadmap takes them from §§5.3g–5.3h. The revision drops this routing.

**Witness.**
- #1409 at d8a53de, `ClassicalArithmeticCompletion/README.md:14067`: "define the additive trace character on its adeles … Identify every continuous additive character of a local field as x↦ψ(bx), for a unique b".
- Main, `README.md:19`: "AutomorphicLFunctionsAndLocalFactors AL.0–AL.1 supplies the standard trace characters, self-dual measures".

**Repair.**
1. In #1409's §7.12a, replace the first paragraph's constructions by a citation. Cite either AnalyticNumberTheoryPartII §5.3g directly, or main's AL.0–AL.1 routing. Keep the ε-factors and the local functional equation.
2. If it cites §5.3g directly, add a ClassicalArithmeticCompletion §7.12a bullet under this README's Downstream consumers. That roadmap is on main, so reword "each later in the merge order" (`:3101`) as well.

Tested: no conversion is needed.
- §7.12a's `vol(O_v)=q_v^(−d_v/2)` is §5.3g's `N(𝔇_v)^(−1/2)`.
- Its Check (`:14079`), "ψ(2x) gives ℤ₂ the self-dual volume `2^(−1/2)`", is the `2^(−1/2)` of §5.3h's Check 3 (`:687`).

## R03 (P2) — The self-duality of the adeles is statable at the pins, but the changed docstring says it is not

**Location.** `Suggested.lean:31–34`: "Adelic Fourier analysis with its Pontryagin self-duality and Poisson summation (§5.3h) needs the standard complex character of the adeles and an adelic Schwartz–Bruhat carrier …".

**Claim.** The self-duality of `𝔸_K`, with `K^⊥=K`, needs neither carrier when it is stated for every nontrivial continuous character trivial on `K`. That is the generality `README.md:7` and `:676` now advertise. `NumberField.AdeleRing` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:56`, deriving `TopologicalSpace`) and `PontryaginDual` (`Mathlib/Topology/Algebra/PontryaginDual.lean:40`) suffice.

The roadmap owns this headline, which ArithmeticGaloisRepresentations and GeometryOfNumbersAndQuadraticArithmetic consume (R01). It is statable and absent.

**Witness.** The statement below, in a scratch file with `import Mathlib`, elaborates through `lake env lean` with only `declaration uses 'sorry'`. Two variants, uniqueness of `a∈Kˣ` and existence of `ψ`, also elaborate.

**Repair.**
1. Add this statement under Layer 5, after `exists_unique_restrictedAddHaar`:

   ```lean
   /-- Self-duality of the adeles (§5.3h, case `V = K`): for every nontrivial continuous character
   `ψ` of `𝔸_K` trivial on `K`, `y ↦ ψ(· y)` is a topological isomorphism onto the Pontryagin
   dual, and the annihilator of `K` is `K`. -/
   theorem adeleRing_selfDual (K : Type*) [Field K] [NumberField K]
       (ψ : PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K))) (hψ : ψ ≠ 1)
       (hK : ∀ x : K, ψ (Multiplicative.ofAdd (algebraMap K (AdeleRing (𝓞 K) K) x)) = 1) :
       ∃ e : AdeleRing (𝓞 K) K ≃ₜ PontryaginDual (Multiplicative (AdeleRing (𝓞 K) K)),
         (∀ x y, e y (Multiplicative.ofAdd x) = ψ (Multiplicative.ofAdd (x * y))) ∧
         ∀ y, (∀ ξ : K, ψ (Multiplicative.ofAdd (algebraMap K _ ξ * y)) = 1) ↔
           y ∈ Set.range (algebraMap K (AdeleRing (𝓞 K) K)) := by
     sorry
   ```

2. Name `adeleRing_selfDual` in §5.3h's first two bullets as the case `V=F`, which the proof at `:681` reduces to.
3. Change the docstring to say that the adelic Fourier transform and Poisson summation need an adelic Schwartz–Bruhat carrier, absent at the pins.

`hK` is needed. Over `ℚ`, `ψ(x)=exp(2πix_∞)` is nontrivial and sends `1/2` to `−1`, and `y↦ψ(·y)` kills every `(0,y_f)`, so the conclusion fails without `hK`. No `TauCetiRoadmap` file declares this name (`roadmaps grep` finds no match).

## R04 (P3) — The proof sketch derives the triviality of `ψ` on `F` from the product formula

**Location.** `README.md:681`: "it contains `F` by the product formula and is an `F`-subspace".

**Claim.** The annihilator contains `F` because `ψ` is trivial on `F`, a fact asserted in this round's text at `:656`. That fact comes from the trace and from `x−Σ_p{x}_p∈ℤ` for `x∈ℚ`. It does not come from `∏_v|a|_v=1`, which the same paragraph calls "the product formula" two sentences later. No other passage gives a route for the triviality at `:656`.

**Witness.**
- §5.3h's own Check 1 (`:685`) at `x=1/6`: `1/6−1/2−2/3=−1∈ℤ` gives `ψ(1/6)=1`, and no absolute value enters.
- ArithmeticGaloisRepresentations `README.md:2261–2262` at f901260 uses this route.

**Repair.** Replace "by the product formula" with: "because `ψ` is trivial on `F`: `ψ=ψ_ℚ∘Tr`, the trace maps `F` into `ℚ`, and for `x∈ℚ` the rational number `x−Σ_p{x}_p` lies in `ℤ_p` for every `p`, hence in `ℤ`". At `x=1/6` this gives `−1`, as in Check 1.

## Previous findings

- R01 — partly repaired: `README.md:3105–3106` now has a GeometryOfNumbersAndQuadraticArithmetic bullet and a rewritten ArithmeticGaloisRepresentations bullet, and `:7` covers every nontrivial character. But #856 (f901260) and #851 (6143cad) still construct the objects and cite nothing here, and the description is unchanged. This is now R01.

## Verified sound

**Gate, dependency check and build.**
- My gate rerun on 26d0e1f prints `gate AnalyticNumberTheoryPartII: … statement-hygiene=0 … depcheck=0 … stray-files=0 … outside-folder=0 … OK`. The worker's targeted build reports `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2426 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- This roadmap is at ORDER.txt line 50. Its consumers sit at lines 51 (AdelicAlgebraicGroups), 52 (GeometryOfNumbersAndQuadraticArithmetic), 57 (ArithmeticGaloisRepresentations), 93 and 95.
- `changes.md` lists no file changed outside the folder.

**Elaboration.**
- A scratch copy of `Suggested.lean` with `#check @name` for all 30 declarations, run through `lake env lean`, exits 0. It prints 13 `declaration uses sorry` warnings and the 30 types, and nothing else.
- The only Lean change is the docstring, so every type is r9's. `exists_unique_restrictedAddHaar` still carries its `MeasurableSpace` and `BorelSpace` binders on the restricted product.
- The one-tactic probe was not rerun, because no declaration changed. R03's proposed theorem is Tate's self-duality and does not close by one tactic.

**Library at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).
- `NumberField.AdeleRing` (`AdeleRing.lean:56`) and `PontryaginDual` (`PontryaginDual.lean:40`) were opened.
- `Mathlib/NumberTheory/Padics/AddChar.lean` covers only characters of `ℤ_[p]` into ultrametric rings.
- A grep finds no complex adelic character, no adelic self-duality and no Schwartz–Bruhat space in Mathlib or Tau Ceti. The docstring's "absent at the pins" is correct for the Schwartz–Bruhat carrier and the standard character, and wrong only about what self-duality needs (R03).

**Changed passages checked.**
- The Summary (`:3`): §§5.3n and 5.21w are in the binary-cubic chain B2 (`:98`).
- The scope sentence (`:7`).
- §5.3g's character sentence (`:658`).
- §5.3h's two new bullets, its rewritten proof paragraph and its four new Checks (`:675–688`).
- The extended Needs line (`:690`): `RestrictedProduct` and `PontryaginDual` exist at the pin.
- The two consumer bullets and the docstring.
- The conventions in the ArithmeticGaloisRepresentations bullet match its head: `q_v^(−ν_v/2)=N(𝔇_v)^(−1/2)`, and `d^×x=(1−q_v⁻¹)⁻¹dx_ψ/|x|_v` matches §5.3j.

**Consumers resolved.**
- #792 (d2e6304), #924 (f4dd981) and #925 (e73fe1f) have the heads r9 read, and their citations stand. #924's `README.md:11` cites §§5.3g–5.3h.
- GeometryOfNumbersAndQuadraticArithmetic's Weil-operator paragraph (`:1082`) lies in its §3.3 (`:1020–1212`), as the new bullet says.
- `overlaps.md` reports no open pull request that changes this folder or drops an id it cites, and this diff drops no id.

**Sample.** 15 targets, all outside the changed passages.
- §5.21 matches LOWW Proposition 3.7(2), p.12 (LOWW line 606–613), and (5), p.13 (line 636). The definitions of `A_k` and `B_k` are at line 597, and `r(α)` at line 613.
- §5.19 matches LOWW (3.1), p.12 (line 598–602).
- §5.7a's locators match Stark74:
  - Lemma 3 at printed p.139 (line 182, 203–211);
  - Lemma 4 at p.140 (line 224, 251–255);
  - Lemma 8 with `c(n)=4n!` at p.145 (line 427, 454–458).
- No README locator is flagged as unverified.

**Remark on untouched text (no change requested).** §5.7a's effective constant comes from AnalyticNumberTheoryPartI §0.34, Part I's `landau_siegel_exclusion` at #1126. Part I sources it to an October 2026 preprint ([109] there). §5.7a uses it exactly as Part I states it. Its effectivity stands or falls with that supplier, whose own review covers the source.

**Adversarial table.** It has 77 rows: 32 computed this round and 45 carried from r9 for untouched statements.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.3g: every nontrivial character of `F_v` is `ψ_v(a·)` | `ℝ`; `ℂ`; `ℚ_p` | `ℂ`: `exp(2πi(αRe z+βIm z))=ψ_v(az)` with `α=2Re a`, `β=−2Im a`, a bijection in `a`; `a=0` gives the trivial character | Holds | None |
| §5.3g: `aB` has the same `τ` | definition | `(aB)(τx,y)=aB(y,x)=(aB)(y,x)` | Holds | None |
| §5.3g: `ψ_v(a·)` reduces to the pairing `aB` | `F_v^n`, `A=aI` | `|det A|^(1/2)=|a|^(n/2)`, as §5.3h quotes | Holds | None |
| §5.3h restricted-product duality | `𝔸_(ℚ,f)`, `H_p=ℤ_p` | `H_p^⊥=ℤ_p` under `ψ_p(xy)`; dual `Πʳ[ℚ_p,ℤ_p]`; `H_p` compact open gives `H_p^⊥` compact open | Holds | None |
| §5.3h: a character is trivial on almost all `H_i` | an open neighbourhood with no nontrivial subgroup | the preimage contains `∏_(i∉S)H_i`, whose image is a subgroup, hence 1 | Holds | None |
| §5.3h Check 4 (non-adele `a_p=1/p`) | `x=(1,1,…)∈Ẑ` | `Σ_(p≤N)1/p` mod 1 is `0.0333`, `0.8028`, `0.1981`, `0.4831` for `N=5, 97, 997, 9973` | Holds; discriminates | None |
| §5.3h: characters of `V_𝔸/V` are `ψ(B(·,y))` with `y∈V` | `V=F`, `B=xy` | annihilator `K`; `y≠0` exactly for nontrivial characters | Holds | None |
| §5.3h: `ψ(a·)` leaves the self-dual measure unchanged | `a=2` over `ℚ` | `√2·2^(−1/2)=1.0000`; `[0,1)×Ẑ` has volume 1 | Holds | None |
| §5.3h Check 3 | `ψ(2·)`; idele `(2,1,1,…)` | real factor `c²/2=1` gives `c=√2`; `ℤ_2` mass `2^(−1/2)`; `ψ(2·½)=e^(2πi)·ψ_2(½)=−1` | Holds | None |
| §5.3h Check 1 | `x=1/6` | `{1/6}_2=1/2`, `{1/6}_3=2/3`; `exp(2πi·(−1))=1`; reversed sign: `exp(2πi·4/3)=−0.5+0.866i` | Holds | None |
| §5.3h Check 2 | `t=2` | Jacobi `1.0000069747` on both sides; `g^†` for `g^*` gives `0.5000035`; without `|det g|^(−1)`, `2.0000139` | Holds | None |
| §5.3h proof: `F^⊥=F` | `A=F^⊥` discrete with `F⊆A` | `(U+F)∩A=F` makes `A/F` discrete; `A` closed and `F`-saturated makes `A/F` closed; compact and discrete gives finite; a finite `F`-space is 0 | Holds | None |
| §5.3h proof: "contains `F` by the product formula" | `x=1/6` | `x−Σ{x}_p=−1∈ℤ`; `∏|x|_v` is not used | **Wrong input** | R04 |
| §5.3h: general `B` reduces to `F` | `B=xᵀMy`, `M∈GL_n(F)` | annihilator `M⁻¹F^n=F^n` | Holds | None |
| Docstring `:31–34` | probe file with `adeleRing_selfDual` and two variants | exit 0, 3 `sorry` warnings | **Statable** | R03 |
| `hK` in R03's statement | `ψ(x)=exp(2πix_∞)` over `ℚ` | `ψ(1/2)=−1`; `e(0,y_f)=1` for `y_f≠0`, so `e` is not injective | Hypothesis needed | R03 |
| Scope `:7` and consumers | heads of #856, #851, #1409; #792, #924, #925 | citations of this roadmap 0, 0, 0; 54, 33, 9 | **Fails** for three | R01, R02 |
| ArithmeticGaloisRepresentations bullet: conventions | #856 `:2259–2283` | `ψ_∞=e(x)`, `ψ_p=e(−{x}_p)`; `vol(O_v)=q_v^(−ν_v/2)=N(𝔇_v)^(−1/2)`; `d^×x` equal | Holds | None |
| GeometryOfNumbersAndQuadraticArithmetic bullet: polar pairing | `B_Q(x,y)=Q(x+y)−Q(x)−Q(y)` | symmetric, `τ=1`, `f̂̂(x)=f(−x)` | Holds | None |
| Summary | B2 chain `:98` | lists §5.3n and §5.21w | Holds | None |
| §4.12 (sample) | `c=1`, `c=1/2` | residue 1 for both (`(2−1)ζ`); `H(0,1)=−1/2=ζ(0)`; `H(0,1/2)=0=1/2−1/2`; `ζ_H(2,1/2)=4.934802=3ζ(2)` | Holds | None |
| §4.15 (sample) | `χ₄`, `s=2`; `q=1`; `q=2` | `4⁻²(ζ_H(2,¼)−ζ_H(2,¾))=0.9159656=` Catalan; `ζ`; `(1−2^(−s))ζ(s)` | Holds | None |
| §5.7a (sample) | `ℚ(√−3)`; the `n=2` constant | `κ=π/(3√3)=0.60460`, `κ log3=0.66422`; Stark Lemma 8 threshold `4n!` (line 455) | Holds | None |
| §5.10 (sample) | `q=2`; stabilizers | `(1−q⁻¹)(1−q⁻²)=0.375=|GL₂(𝔽₂)|/2⁴=6/16`; `|S₃|=6`, 2, 3, 1 | Holds | None |
| §5.19 (sample) | `s=1/4`, `1/2`, `1`; one real and one complex place | `det=−0.125` and complex entry `+0.125`, so complex `=−det`; `3/2`, `1/2`, `3/4`; real entries 0; `(3/2)(3/4)=9/8` | Holds | None |
| §5.21 (sample) | `k=ℚ` | `A=π²/24=0.41123`; residues at 1: `0.54831` (`ℝ³`), `0.82247` (`ℝ×ℂ`); `B=−0.74460` from `ζ(1/3)=−0.97336`; residue at 5/6 for `ℝ³`: `−0.42989` | Matches LOWW | None |
| §6.4 (sample) | `{λ}`; genus 2 | `λ^(−s)`; zero mode adds 1 to `H(t)`; Weyl `N(λ)∼λ`, so convergence for `Re s>1` | Holds | None |
| §6.11 (sample) | one class of length `ℓ` | `Σ_kℓe^(−(s+k)ℓ)/(1−e^(−(s+k)ℓ))=Σ_mℓe^(−msℓ)/(1−e^(−mℓ))` | Holds | None |
| §6.20 (sample) | `λ=1/4`, `0.2`, `1` | `1/2` (double); `0.7236`, `0.2764`; `½±0.8660i` | Holds | None |
| §6.32 (sample) | `β=1`; norm | `ε₂↦ε₂/2`; `sup k^(−β)=1` at `k=1` | Holds | None |
| §6.41 (sample) | `β=1`, `μ₁(nẐ)=1/n` | `ψ(S_n(pχ_γ)S_n*)=δ_(γ,0)/n` | Holds | None |
| §6.49 (sample) | Gibbs bound at `β=2`, `4` | `|φ_β(a)−a₁₁|≤‖a‖(ζ−1)/ζ+‖a‖(1−1/ζ)`; `2(ζ−1)/ζ=0.7841`, `0.1521` | Holds | None |
| §5.3f Fubini clause with `S⊇S₀` | `μ_2=2·Haar`; `S=∅`, `{2}` | `μ_2(ℤ_2)=2` is not a probability measure; `2·1=2` | Holds | Carried (r9) |
| §5.3f Check 1 | `Ẑ`; `3^(−1)ℤ_3` | 1; 3 | Holds | Carried (r9) |
| §5.3f Check 3 and the cofinite hypothesis | `C_p=p^(−1)ℤ_p` for all `p` | 210 for `T={2,3,5,7}`, so `ν=∞`; `∏ᶠ` gives 1 | Needed | Carried (r9) |
| §5.3g `f̂̂=f∘(−τ)` | `(ℤ/5)²`, three pairings | error `7·10⁻¹⁶`; wrong law `0.84`, `1.22` | Holds | Carried (r9) |
| §5.3g `B(x,y)+B(y,z)=B(x+τz,y)` | definition | additivity in the first slot | Holds | Carried (r9) |
| §5.3g partial transforms | binary-cubic pairing, `V₁=⟨e₁,e₄⟩` | `B|V₂` alternating; `τV₁=V₁` | Holds | Carried (r9) |
| §5.3g first-variable annihilator | `ℚ₃`, `ℤ₃⁴` | `L^⊥=ℤ₃×3ℤ₃×3ℤ₃×ℤ₃`; double annihilator `ℤ₃⁴` | Holds | Carried (r9) |
| §5.3g Checks 1–3 | `ℝ²`; `p=3`; binary-cubic over `ℚ₃` | `1` against `3.487·10⁻⁶`; `f̂̂(a)=1`, `f(−a)=0`; `c=3` | Holds | Carried (r9) |
| §5.3h `g^*=(g^†)^(−1)` | `(ℤ/5)²`, `g=[[2,1],[1,1]]` | `g^*=[[2,4],[4,1]]`; error 0; `(gᵀ)^(−1)` gives `1.02` | Holds | Carried (r9) |
| §5.3h restriction along `W` | `W=⟨e₄⟩` | `∫_(W^⊥)f̂(y+z)dz=(f|_W)^(y)` | Holds | Carried (r9) |
| §5.3h Poisson for scalar ideles | `g=a` | `|a|^(−dim V)` | Holds | Carried (r9) |
| §5.3j measures | finite `v` | `d^×x(O_v^×)=N(𝔇_v)^(−1/2)` | Holds | Carried (r9) |
| §5.3m with `gl2Integral` and `gl2Rational` | `ℚ`; `ℚ(√−5)` | `h=1`; `h=2` | Holds | Carried (r9) |
| §5.21q involution | `FFΦ=Φ` | residues `[FΦ(0)/ρ0+Σ2]/2`; `Σ1/6` | Holds | Carried (r9) |
| `exists_unique_restrictedAddHaar` binders | elaborated type | `MeasurableSpace` and `BorelSpace` binders present | Holds | Carried (r9) |
| `exists_unique_quotientMeasure` binders | `H=G`; `ℤ≤ℝ` | `c·δ`; Lebesgue measure of mass 1 | Holds | Carried (r9) |
| `quadratic_large_sieve` | `M=N=1` | `C≥1/2` | Consistent | Carried (r9) |
| `quadratic_fourth_moment` | `σ=1`, `1/2` | `(Q(1+|t|))^(1+ε)` | Consistent | Carried (r9) |
| `firstEisenstein_generate` | `a=1/2`, `1/4` | 0; `e(1/2)=1+8u²` | Holds | Carried (r9) |
| `critical_scaling_measure_unique` | Haar, `β=1`; `δ₀` | `qμ(E)`; `δ₀≠√2δ₀` | Holds | Carried (r9) |
| `supercritical_scaling_measures` | `ν=δ₁`, `β=2` | mass `6/π²=0.6079` | Holds | Carried (r9) |
| §4.8 | `a=1/2`, `s=2` | `−0.8225` on both sides | Holds | Carried (r9) |
| §5.24 | LOWW 3.7(3) | `2√3=3.4641` | Holds | Carried (r9) |
| §6.6 / §6.12 | `{1/4}`; `g=2` | `(s−1/2)²`; `ζ(0)=−4/3` | Holds | Carried (r9) |
| §6.23 (sample) | `μ₂` | `μ₂*μ₂=1`; `φ(μ_nμ_n*)=n^(−β)` | Holds | Carried (r9) |
| §6.27 / §6.30 | `σ_(−i/2)`; `r=2` | `1/m`; `1/2` | Holds | Carried (r9) |
| §6.33 (sample) | `μ₂μ₂*` | `φ_base=1/2`; `2^(−β)=1/2` iff `β=1` | Holds | Carried (r9) |
| §6.35 | doubling | `1+e(1)=2≠1+e(1/2)` | Holds | Carried (r9) |
| §6.42b (sample §6.42) | swap | `(q/p)^β`; `(p/q)^β` | Holds | Carried (r9) |
| §6.29/§6.45, §6.43, §6.50, §6.31 | `x′₂`, `x₂`; Gibbs; `b=2`; `e_(2,1/3)` | `2^(1−β)=1` iff `β=1`; `→−1`; equal; `(e(1/3)+e(2/3)−11)/36` | Holds | Carried (r9) |
| §6.10 | `δ₀`; Haar | `2_*δ₀≠2^(0.5)δ₀`; `1/2` | Holds | Carried (r9) |
| §6.17g constant | `u→∞` | `C(4ζ′(−1)−log2π−1/2)` | Holds | Carried (r9) |
| §4.13 / §4.14 | `k=1,2,3` | `a(2)=6/π²`; `g(3)=1/8640`; `1/(2π²)` | Holds | Carried (r9) |
| §4.2 / §4.3 | Hurwitz difference; `G(5)` | `−i/2`; `12`, `−1/16` | Holds | Carried (r9) |
| `barnesG_asymptotic` | `z log Γ(z+1)` | `B₂/2−1/12=0` | Holds | Carried (r9) |
| `complexHurwitzContinuation_exists` | `m=0,1` | `−1/2`, `−1/12`, `1/2−c` | Holds | Carried (r9) |
| `lerch_completed_functional_equations` / `lerchContinuation_solvable` | applied twice; basepoint | reproduces `Λ_k`; well defined | Consistent | Carried (r9) |
| §5.1/§5.17, §5.15, §5.26, §5.23 | `ψ1`, `ψ2`; `A`; `B(0)`; `ψ−2` | `0`, `−1`; `A²=I`; `4/(3π)`; `√8/π` | Holds | Carried (r9) |
| `quadraticReflectionFactors`, §5.18 | `ψ−1`, `s=0`; `(10,10)` | `4/(3π)`; `Q=1083/4` | Holds | Carried (r9) |
| `quadraticDoubleSeries_continuation` | `P∘α` | `P(w,s)=P(s,w)` | Consistent | Carried (r9) |
| §5.3d / §5.3e | `u=0.7`; `u=0.7, 1.3` | `C_R(u)C_R(2−u)=I`; `7.6029247` | Holds | Carried (r9) |
| §5.10a `det A` | binary-cubic pairing | `1/9`; `|3|^(−1)` | Holds | Carried (r9) |
| §5.3l / §5.3m / §5.3n | `n(x)t`; `diag(t)`; intertwiner | `|s₁/s₂|^(−1)`; `|t₁/t₂|`; `ζ_v(z−1)/ζ_v(z)` | Holds | Carried (r9) |
| §5.21j / §5.21w | principal `χ`; constant term | `κf̂(0)`, `−κf(0)`; `ρ`, `−ρ`; `K_ℝ(2,1)=πe^(−2π)` | Holds | Carried (r9) |
| `gl2_classNumber` statement | `ℚ`, `ℚ(√−5)` | 1; 2 | Holds | Carried (r9) |

## Not verifiable

- **Tate [129], §§4.1–4.2**, the locator for §5.3h's new restricted-product duality and self-duality bullets. It is not in the manifest, and no legal open copy was consulted. Whether the general character theorem for restricted products is in §§4.1–4.2 or in Tate's chapter on abstract restricted products was not checked.
- **Wright [103], §1, pp.509–511**: the GDZ copy is not in the manifest.
- **Datskovsky–Wright [105]** (sample §§5.10 and 5.21): the scan is image-only and this worker has no OCR. §5.21 was checked against LOWW instead, and §5.10 by computation.
- **Sampled locators outside the changed passages, not rechecked this round**: [95] (§4.12), [99] (§4.15), [118] (§§6.11, 6.20), [113] (§6.32), [112] (§6.49), and §§6.23, 6.33, 6.41, 6.42. r8 checked ConnesMarcolli08 and Neshveyev02/09 at their locators.
- **Ownership against open pull requests** was searched with `roadmaps grep` over the 470 open heads. Read in context: #856, #851, #1409 (with main's ClassicalArithmeticCompletion), #924 and #1126. The other hits (#858, #1037, #1063, #1272, #1474, #1490, #1737) were read only as grep lines: they concern function fields or cite AutomorphicLFunctionsAndLocalFactors AL.0 or ArithmeticGaloisRepresentations §2.7.

## Source issues

- none
