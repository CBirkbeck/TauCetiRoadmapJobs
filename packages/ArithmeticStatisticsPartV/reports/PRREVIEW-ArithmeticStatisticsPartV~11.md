# Review of ArithmeticStatisticsPartV (pull request #1175 at 4608cd5)

**Verdict:** needs changes

This is an incremental re-review of the 10 README lines changed since 9198e54, all in commit 4608cd5. `Suggested.lean` is unchanged and nothing outside the folder changed. Previous R01 is repaired. The repair adds one new defect: number-field quadratic reciprocity is credited to the wrong supplier roadmap.

## R01 (P2) — Number-field quadratic reciprocity and its mod-8 dyadic factor are cited from SieveMethodsAndPrimePatterns §5.6, which does not state them

**Location**
- `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:60`: "require the quadratic ideal residue symbol with its ideal-symbol reciprocity adapter (for coprime odd `α,β`, `(α/(β))(β/(α))` is the product of the Hilbert symbols `(α,β)_v` over the dyadic and real places `v`)".
- README:2143: "*Needs:* [SieveMethodsAndPrimePatterns §5.6 conditional joint-spin prime bound and ideal-symbol reciprocity adapter](…)".
- README:2141 uses both facts: "The reciprocity adapter (`M` has no real places)", and "`µ₂` … depends only on `w mod 8` ([[103]], Lemma 2.1, p.4)". The second has a source locator but no owner in the *Needs:* line.

**Claim**
- §5.6 at the supplier's head (8111bc5) states the quadratic ideal residue symbol with exactly two comparisons of its own: invariance under unit squares, and agreement with `jacobiSym` over `ℚ`.
- Its only reciprocity statement is kernel reciprocity for `Φ(α,β)=∏_(σ∈S)(α/[σ(β)σ⁻¹(β)])`. That is an identity about the joint-spin kernel for the fixed `S` of the chain, not the general law for arbitrary coprime odd `α,β`.
- The supplier does not own the general law. It imports it from ClassicalArithmeticCompletion, whose §1.66 gives the law and §1.57 the mod-8 dependence of `µ₂`.
- So the Exact supplier contract and the *Needs:* line both credit §5.6 with a statement it does not make. Anyone following the citation does not find the statement there.

**Witness**
- SieveMethodsAndPrimePatterns README:99, at its head, under "From TauCetiRoadmap.ClassicalArithmeticCompletion": "§1.66 supplies quadratic reciprocity in a number field K … §1.57 supplies that μ₂(α,β) depends only on α and β modulo 8O_K". Its README:11 names ClassicalArithmeticCompletion as the owner.
- Both sections are on main: ClassicalArithmeticCompletion README:2195 (§1.66) and README:1977 (§1.57).

**Severity.** The citation points to a supplier section that does not contain the statement, which makes this supplier drift, so P2. It is not P1: the result has an owner on main, and the mathematics at README:60 is right. Over `ℚ`, `(3/7)(7/3)=−1=(3,7)₂(3,7)_∞=(−1)(1)`, and with `α=−1, β=−3` both sides are `−1=(1)(−1)`.

**Repair**
1. README:60: delete "with its ideal-symbol reciprocity adapter (for coprime odd `α,β`, `(α/(β))(β/(α))` is the product of the Hilbert symbols `(α,β)_v` over the dyadic and real places `v`)".
2. After the SieveMethodsAndPrimePatterns paragraph of Exact supplier contracts, add: "From [TauCetiRoadmap.ClassicalArithmeticCompletion §1.66](../ClassicalArithmeticCompletion/README.md#layer-1-topic-66) require quadratic reciprocity in a number field: for nonzero, odd, coprime `α,β∈O_K`, `(α/β)=µ₂(α,β)µ_∞(α,β)(β/α)`, where `µ₂` and `µ_∞` are the products of the quadratic Hilbert symbols over the dyadic and the infinite places. From its [§1.57](../ClassicalArithmeticCompletion/README.md#layer-1-topic-57) require that `µ₂(α,β)` depends only on `α` and `β` modulo `8O_K`. On odd ideals its residue symbol is that of SieveMethodsAndPrimePatterns §5.6."
3. README:2141: replace "The reciprocity adapter" with "Quadratic reciprocity (ClassicalArithmeticCompletion §1.66)". After "depends only on `w mod 8`", cite "ClassicalArithmeticCompletion §1.57" next to [[103]].
4. README:2143: shorten the first link text to "SieveMethodsAndPrimePatterns §5.6 conditional joint-spin prime bound", and add "ClassicalArithmeticCompletion §1.66 (quadratic reciprocity with dyadic and archimedean factors) and §1.57 (the dyadic factor depends only on residues modulo 8)".
5. Layer 3 `### Dependencies` (README:2719): add "ClassicalArithmeticCompletion §§1.57 and 1.66 for number-field quadratic reciprocity".

**Test of the repair**
- The anchors `layer-1-topic-66` and `layer-1-topic-57` exist on main, at ClassicalArithmeticCompletion README:2193 and README:1975.
- The roadmap is on main, so the dependency check admits it. Its README:23 names ArithmeticStatistics only as a consumer, so there is no cycle.
- In the application `M` is totally complex, so `µ_∞=1`. §1.66 then reads `(w/(r(π)))=µ₂(w,r(π))(r(π)/(w))`, exactly the step README:2141 takes.
- By §1.57, `µ₂(w,r(N_(M/E)w))` is a function of `w mod 8`, and `8∣8F∣D_M` divides the joint-spin modulus.

## Previous findings

- R01 — repaired: README:60 now says the chain "carries the standing hypothesis that every totally positive unit of `O_M` is a square when `M` is totally real", and "fixes there the ideal-class representatives and the modulus `F` …, a function `ψ` … and a decomposition `O_Mˣ=T_M×V_M`".

## Verified sound

### Scope

- The diff (`scratch/changes.md`, read as data) changes README:38, 60, 2141 and 2143, and adds the Check at README:2153.
- Also checked, because they cite or depend on the changed lines: README:22, 95, 2043–2061 (governing field interface), 2121–2129 (spin criterion), 2149–2155 (Checks), 2696 and 2719.
- `git diff --stat origin/main...HEAD` with the folder excluded prints nothing. `git diff 9198e54 HEAD -- Suggested.lean` is empty.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

### Gate, dependency check and elaboration

- **The worker's gate** (`scratch/gate.md`) passes every check, including `build=0`.
- **My run of the full gate** prints `depcheck=7` and 0 for every other check it lists. It lists no build count, so I elaborated the file myself (below). The seven lines are UPWARD edges to ArithmeticStatisticsPartI–IV, GeometryOfNumbersAndQuadraticArithmetic, InductionRestrictionPartII and SieveMethodsAndPrimePatterns. They are measured against the configured `merge-order/ORDER.txt`, which still lists this roadmap at #53.
- Against that same file with `--movable`, the check prints `moved: ArithmeticStatisticsPartV moved in the merge order from #53 to #148, right after its last supplier GeometryOfNumbersAndQuadraticArithmetic (…)` and `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`. By the review rules a `moved:` line is not a defect.
- **The brief's dependency check** against `scratch/merge-order-moved.txt` with `--movable` prints `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In that file SieveMethodsAndPrimePatterns is at line 54 and this roadmap at line 146.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 13 s with 41 `declaration uses sorry` warnings and no other output.
- **Binder check.** `scratch/signatures/SignatureCheck.lean` (`#check @…` for all 49 declarations) exits 0 with 49 types and no error. The file is unchanged, so the earlier rounds' binder comparison and one-tactic probe still hold.
- **Citation leads.** `scratch/citations.md` lists no missing cross-roadmap citation. Its Lean-name leads are this roadmap's own declarations (gate `readme-ids-missing=0`), and neither new Mathlib name is among them.

### Library declarations opened at the pin (Mathlib `1b1ccf4b`)

| Declaration | File:line | Matches README:38 / 2143 |
| --- | --- | --- |
| `NumberField.discr_dvd_discr` | `NumberTheory/NumberField/Discriminant/Different.lean:120` (`namespace NumberField`, line 30) | `[NumberField K] [NumberField L] [Algebra K L]`, conclusion `discr K ∣ discr L`; yes |
| `IsCyclotomicExtension.Rat.discr_prime_pow` | `NumberTheory/NumberField/Cyclotomic/Basic.lean:620` (namespace line 609) | `[Fact p.Prime] [IsCyclotomicExtension {p ^ k} ℚ K]`, every `k:ℕ`, value `(-1)^((p^k).totient/2) * p^(p^(k-1)*((p-1)*k-1))`. The docstring warns of `1/2=0` and `0−1=0` at `p^k=1,2`, which is what the new Check at README:2153 records; yes |

### Supplier and sources (seeded sample in the changed passages: §3.30)

- **SieveMethodsAndPrimePatterns §5.6 at its head (8111bc5).**
  - Joint-spin coefficient sequence (README:4007): the totally-real unit hypothesis, `F` as in KM-21 §2.2, `ψ` invariant under unit squares, `O_M^×=T_M×V_M`, and `s_a` as at README:60.
  - Type I (4042) assumes `C_(|S|n)`; Type II (4054) says "No short-character hypothesis is used" (4058); the prime bound is at 4066.
  - What README:60 now says on these points matches. The one exception is the reciprocity law (R01).
- **ref103** (Koymans–Milović, *Joint distribution of spins*):
  - Lemma 2.1 and the sentence after it (lines 201–216, p.4): reciprocity with `µ₂µ_∞`; `µ₂` depends only on residues modulo 8.
  - (2.2) at line 238, p.5: `F:=2^(2h+3)fD_K`, a multiple of `D_K` as README:60 says.
  - (2.3)–(2.4) at lines 260–274, pp.5–6: `T_K×V_K`, `ψ`, and `s_a` with `r(a)` and `r_+`.
  - Theorem 1 (lines 70–80, p.2) and Theorem 3 (lines 118–120, p.3).
  - (2.5) at line 370 uses `δ` "as in Conjecture C_n"; (2.6) at line 378 needs no conjecture.
  - §5 (lines 1373–1447, pp.22–23).
  - Every locator in the changed lines is correct.
- **ref135**: (6.6) at line 1269, p.21, defines `ψ₀` as a product of four quadratic symbols, so it is `±1`-valued as README:2141 says. The `F` of (3.1) is at lines 285–288, p.7.
- **The enlargement by `ℚ(ζ_(8F))` at README:2141 closes a gap in ref103 §5.** The source defines `ψ` through `ψ₀` modulo the `F` of `E` but never shows that this `F` divides the joint-spin modulus (2.2) of the larger field (see Source issues). With the enlargement, `8F∣D_M` (rows N3–N4).

### Remarks on untouched text (no change requested)

- The last sentence of README:60, "These are README targets of that roadmap, with no Lean declaration", is unchanged. It is accurate for the joint-spin chain. But `C_d` has a Lean carrier at the supplier's head, `SieveSpin.ShortCharacterConjecture` (its `Suggested.lean:721`).
- The overlap lead "LocalFieldsRamification Layer 3" (README:281, 2308, 2608) still resolves through the Former layer numbers table at the open head of that revision (`Completed/LocalFieldsRamification/README.md:274–284`).
- Ownership: every object in the changed lines is imported (Mathlib, SieveMethodsAndPrimePatterns, and ClassicalArithmeticCompletion after the repair), so the change adds no new ownership. No other open pull request changes this roadmap (`scratch/overlaps.md`).

### Computed adversarial pass

Rows N1–N13 are new and cover every statement the diff adds or changes. The rows after them are carried unchanged from the previous report, PRREVIEW-ArithmeticStatisticsPartV~10, and tagged "(r10)". That report carried most of them from earlier rounds, and their README line numbers are as in the round that computed them; at this head add 2 to every line after 2152.

Rows 7, 10, 12 and 13 of ~10 (the §5.6 contract, the totally complex compositum, the governing-field theorem and the anchors) are replaced by N9, N10, N5–N8 and N12.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| N1. `NumberField.discr_dvd_discr` contract (README:38, 2141, 2143) | ℚ(i)⊆ℚ(ζ₈); ℚ(√2)⊆ℚ(ζ₈); ℚ⊆K; reversed control | `−4∣256`, `8∣256`, `1∣d_K`. The reversed claim `256∣−4` is false, so the direction is fixed. The pinned statement has no hypothesis beyond the three instances | Pass |
| N2. `discr_prime_pow` contract (README:38) | ℓ^k = 2, 4, 8, 16, 3, 9, 27, 5, 7, 11 | Pinned formula against the general formula `(−1)^(φ/2)n^φ/∏p^(φ/(p−1))`: 1, −4, 256, 2²⁴, −3, −3⁹, −3⁴⁵, 125, −7⁵, −11⁹ on both sides | Pass |
| N3. "Exponent ≥ k" step and the new Check (README:2141, 2153) | (ℓ,k) = (2,1), (2,2), (2,3), (2,4), (3,1), (3,2), (3,3), (5,1), (7,1), (11,1) | Exponents 0, 2, 8, 24, 1, 9, 45, 3, 5, 9 against k = 1, 2, 3, 4, 1, 2, 3, 1, 1, 1. Only (2,1) fails (0<1), which is why the factor 8 is there. The Check's values `ℚ(ζ₈)`: 2⁸, `ℚ(ζ₃)`: −3, `ℚ(ζ₂)`: 1 agree | Pass |
| N4. `8F∣D_M∣` joint-spin modulus (README:2141, 60) | ref103 (2.2); wrong model `M=E` without enlargement | Each `ℓ^k∥8F` divides `disc ℚ(ζ_(ℓ^k))∣D_M` (N1, N3); coprime parts multiply, so `8F∣D_M∣2^(2h+3)fD_M`. Without the enlargement: `h_E=1` and `F_E=2⁵·f·2²²` with `f` squarefree, while ref135's `F=Δ_E·∏N(ρ′)` runs over 2¹⁷⁵ classes of degree-one primes. An odd `q∣F` need not divide `F_E`, and then `ψ₀(N(w) mod F)` is not a function modulo `F_E` | Pass; the enlargement is necessary |
| N5. `S` and the product identity (README:2141) | `S=σ₀·Gal(M/E)`, `m=[M:E]` | `∏_τ σ₀τ(w)=σ₀(N_(M/E)w)=r(N_(M/E)w)`, since `σ₀` restricts to `r` on `E`. `|S|=m`; `S⁻¹` is the preimage of `r³≠r`, so `S∩S⁻¹=∅`; `|S|n=8m²` | Pass |
| N6. `ψ` well defined and invariant under unit squares (README:2141) | `w↦wu²` with `u∈O_M^×`; `w↦w+Fx` | `ψ₀(N(w)N(u)²)=ψ₀(N(w))` by the invariance (6.7) (ref135 line 1270). `µ₂(wu², r(Nw)·r(Nu)²)=µ₂(w,r(Nw))` by bimultiplicativity. `FO_M∩O_E=FO_E`, so `N(w) mod F` depends only on `w mod FO_M`. `µ₂` depends only on `w mod 8` (ref103 line 216) | Pass |
| N7. Spin identity at a degree-one principal prime (README:2141) | `𝔓=(w)` over `p` with `f(𝔓∣p)=1`, `π=N_(M/E)w` | `(π)=N_(M/E)𝔓=𝔭`. `r(𝔭)≠𝔭`, because `Gal(E/ℚ)` acts simply transitively on the 8 primes over `p`. `∏_σ(w/σ(w))=(w/(r(π)))=µ₂(w,r(π))(r(π)/(w))`, with `µ_∞=1`. `O_M/𝔓=O_E/𝔭=𝔽_p` gives `(r(π)/(w))_M=(r(π)/π)_E`. Multiplying by `ψ(w)=ψ₀(π)µ₂` gives `ψ₀(π)(r(π)/π)_E`, since `µ₂²=1`. Reciprocity over ℚ: `(3/7)(7/3)=−1=(−1)(1)`; for `(−1,−3)`: `−1=(1)(−1)` | Pass; owner mis-cited (**R01**) |
| N8. Normalisation of `s_((w))` (README:2141; ref103 (5.2), line 1437) | The `|T_M||V_M/V_M²|` generators `tvw` | Each term is `+1` if `16∣h(−4p)` and `−1` otherwise, since `ψ₀` is `±1`-valued (ref135 (6.6)) and the criterion holds for every generator. Sum `=|T||V/V²|(2·1_{16∣h}−1)`, matching the README; the source prints `h(−p)` | Pass |
| N9. §5.6 contract (README:60) | supplier 4007–4070; ref103 lines 70–80, 238, 260–274, 370–378 | Unit hypothesis (4007; ref103 line 71); `F=2^(2h+3)fD` (line 238); `ψ` invariant under unit squares (line 264); `T×V` (line 260); `s_a` with `r_+` ((2.4)); Type I under `C` ((2.5), 4042); Type II without it ((2.6), 4058). At n=3, \|S\|=1, δ=1 the saving is 1/5994 | Pass; previous R01 repaired |
| N10. Totally complex compositum (README:2141, 2151) | `M⊇E(ζ_(8F))` | `E` has signature (0,4), since `f≥1` on ℝ, and `ℚ(ζ_(8F))` is totally complex. A real embedding of `M` would restrict to one of `E`, so there is none, and supplier 4007 imposes no unit hypothesis | Pass |
| N11. "A finite normal extension of a governing field governs" (README:2141; interface README:2057) | `M′⊇M`; `Frob_p(M′)↦Frob_p(M)` | `φ∘res` is a class function. The extra excluded primes are those ramified in `M′`, finitely many | Pass |
| N12. Anchors of the changed links (README:60, 2143) | supplier headings at 3937 and 145 | The slugs `56-ideal-residue-symbols-joint-spins-and-their-oscillation` and `short-character-conjecture-owned-in-layer-5` equal the links | Pass |
| N13. `Suggested.lean` | unchanged since 9198e54 | exit 0, 41 sorry warnings, 0 errors; 49 `#check` types | Pass |
| r10-1. Eisenstein input for `g` (README:2097, 2106; contract README:38) | `G=T⁸−4T⁷+4T⁶+2T⁴−8T³+12T²−8T+2`; control `T²+4` (θ=2i) | Non-leading coefficients −4,4,0,2,−8,12,−8,2 are all even; the constant 2 is not divisible by 4; `G` is monic, hence primitive, of degree 8>0. In exact arithmetic in `ℚ[T]/(f)`: `g=(1+t)/β=(−1−5t−5t²+5t³−t⁴−t⁵−t⁶+t⁷)/4`, `G(g)=0`, and the b-coordinates (−1,−2,−2,2,0,−1,−1,1) give the same eight coefficients. Control: `T²+4` has constant 4, so it is not Eisenstein, and `[ℤ[i]:ℤ[2i]]=2` | Pass (r10) |
| r10-2. `2∤exponent g` via `mem_adjoin_…` (README:2097, 2117) | `E`; θ=1+i in ℚ(i); θ=√5 in ℚ(√5) | `disc G=2621440000=2²²·5⁴` (Sylvester resultant), `d_E=2²²`, index 25, which is odd, so the exponent divides 25. 1+i: `X²−2X+2` is Eisenstein at 2 and `ℤ[1+i]=ℤ[i]`, index 1. √5: `X²−5` is not Eisenstein at 2, the index is 2, and 2 divides the exponent, so the Eisenstein hypothesis is needed | Pass (r10) |
| r10-3. Kummer–Dedekind for `g` at 2 (README:2097) | `G mod 2` | `G≡T⁸`, so `monicFactorsMod={T}`: one prime, f=1, e=8. Σef=8=[E:ℚ], as `sum_ramification_inertia_eq_finrank` over ℤ requires; norm 2¹=2 | Pass (r10) |
| r10-4. `(g)` is the prime above two (README:2097) | `E`; controls (2)⊂ℤ[i], (1+√−5)⊂ℤ[√−5] | The determinant of multiplication by `g` is 2 (exact), which equals the constant term since deg 8 is even. `absNorm=2` is irreducible in ℕ, so `(g)` is prime; `O_E/(g)` has 2 elements, so 2∈(g). Controls: (2)=(1+i)² has norm 4 and is not prime; (1+√−5) has norm 6 and is not prime. The norm must be prime | Pass (r10) |
| r10-5. Tower ramification (README:2119) | L=ℚ, ℚ(i), ℚ(√2), ℚ(√−2), ℚ(ζ₈) | e(P\|2)=8. For ℚ(i), the bounds e(P_L\|2)≤2 and e(P\|P_L)≤4 with product 8 force 2 and 4; for ℚ(ζ₈) they force 4 and 2; for ℚ, 1 and 8. The quadratic subfields have discriminants −4, 8, −8, all even, consistent with the claim. Wrong model: a subfield unramified at 2 (e.g. discriminant −7) would cap e at 4, contradicting e=8 | Pass (r10) |
| r10-6. Check at p=2 (README:2117) | t and g | `f≡(T+1)⁸ mod 2` and 2 divides 128 (unchanged); `[O_E:ℤ[g]]=25`. So 5 divides the index for `g` and 2 divides the index for `t`: neither generator serves at every prime, as stated | Pass (r10) |
| r10-8. Import of `C_d` (README:60, 2139, 2694) | χ₃ and χ₀ mod 3; q=1; N=0 | The supplier has 1<q≤Q and 0≤N≤Q^(1/m); the deleted local text had 1≤q and 1≤N; ref103 lines 340–345 have q≤Q and N≤Q^(1/n). They agree: q=1 carries no nonprincipal character, and N=0 gives the empty sum 0. χ₃, M=0, Q=27, d=3: N=1 gives sum 1, N=3 gives 0. χ₀ on N=3k gives 2k, excluded by nonprincipality | Pass (r10) |
| r10-9. δ normalisation (README:2694) | ref103 lines 73, 386; supplier README:147 | Source: δ=δ(\|S\|n). Supplier: δ(m)/2, to get an ε-free progression form (ref103 Corollary 2.2, line 361, has no ε). `C_m` with witness δ implies `C_m` with witness δ/2, so the README's fixed witness may be taken to be the supplier's | Pass (remark) (r10) |
| r10-11. Spin-criterion import (README:2121–2129) | π over odd split p; supplier symbol Checks | N(π)=p is odd, so (π) lies in the symbol's domain. Equivariance gives (r(π)/π)=(π/r⁻¹(π)), the supplier's (α/σ(α)) with σ=r⁻¹≠r. Over ℚ: (2/(5))=−1, (4/(5))=1, (15/(5))=0 | Pass (r10) |
| r10-14. `Suggested.lean` docstring (lines 30–31) | `#check` on all 49 declarations | Only the docstring changed; 49 types, 41 sorry warnings, 0 errors | Pass (r10) |
| Mathlib Kummer–Dedekind contract (README:38) | ℚ(i), θ=i, p=2,3,5; negative control ℚ(√5), θ=√5, p=2 | ℚ(i): exponent 1. At p=2, `X²+1≡(X+1)²` gives one prime, f=1, e=2, norm 2. At p=3 the polynomial is irreducible: f=2, norm 9. At p=5, `(X+2)(X+3)`: two primes of norm 5. ℚ(√5): index = exponent = 2, and `X²−5≡(X+1)²` would predict f=1, e=2, but `O/2O=𝔽₂[X]/(X²+X+1)=𝔽₄` (2 is inert, f=2, norm 4). So the hypothesis `¬p∣exponent θ` is necessary | Pass (r10) |
| `Ideal.pow_inertiaDeg` contract (README:38, 2104) | (1+i) and (3) in ℤ[i] | f=1: 2¹=2=N(1+i); f=2: 3²=9=N(3) | Pass (r10) |
| NumberFieldArithmetic §3.4 / `exponent_dvd_index` (README:46, 2104) | θ=2α with α³=α+1 (disc −23, O=ℤ[α]); θ=√5; t in E | minpoly of 2α is `x³−4x−8` with disc −1472 = −23·8², and `O/ℤ[2α]≅ℤ/2×ℤ/4`: index 8, exponent 4, 4∣8, same primes {2}. √5: index = exponent = 2. E: exponent ∣ 128. Exponent and index differ in general, so README:46 is right to say "divides", not "equals" | Pass (r10) |
| Eight-rank: Minkowski input (README:2095) | E, signature (0,4) | disc f = 68719476736 = 2³⁶ (resultant); index √(2³⁶/2²²)=128; Minkowski bound (4/π)⁴·8!/8⁸·2¹¹ = 12.935137640902266 < 13 | Pass (r10) |
| Eight-rank: Kummer–Dedekind at 3, 5, 7, 11 (README:2095–2102) | f mod p, with the four displayed factorizations | Each product equals f mod p. All 12 factors are irreducible (exhaustive search for factors). Norms: 81, 81 / 25×4 / 49×4 / 14641, 14641, all >12. 128 has no odd prime factor, so `p∤exponent t` | Pass; previous R01 repaired (r10) |
| EffectiveBounds contract: discriminant from an integral basis (README:42) | ℚ(√−5), bases (1,√−5), (1,2√−5); non-integral (1,√−5/2) | disc b=−20, −80 against `|d_F|=20`: 20≤20 (sharp, ℤ[√−5] maximal), 20≤80; non-integral basis gives disc −5, so `20≤5` fails and the integrality hypothesis is necessary | Pass (r10) |
| EffectiveBounds contract: explicit ideal count (README:42) | ℚ(√−5), X=3; ℚ, X=1 | ideals (1), 𝔭₂, 𝔭₃, 𝔭₃′ (2 ramified, −5≡1 mod 3 so 3 splits): 4≤3²·2²=36; ℚ: 1≤1·2=2 | Pass (r10) |
| EffectiveBounds contract: class-number bound (README:42, 1411, 1413) | ℚ(√−5); ℚ; ℚ(√−23) | 2≤20·4²=320; 1≤1·4=4; 3≤23·16=368 | Pass; previous R01 repaired (r10) |
| EffectiveBounds contract: unit-square index (README:42) | ℚ; ℚ(√5); ℚ(√−5) | {±1}: 2≤2 (sharp); {±1}×ε^ℤ: 4≤4 (sharp); {±1}: 2≤4 | Pass (r10) |
| Absorption bound `h₂(F)≤h_F≤4^[F:ℚ]D_F` (README:1411) | ℚ(√−5); ℚ | h₂=2≤h=2≤320; 1≤1≤4; Lean h₂ is the 2-torsion subgroup's cardinality | Pass (r10) |
| New absorption Check (README:1425) | ℚ(√−5), n=2, D=20, h₂=2; ε=0, 0.1, 0.25 | A=D·h₂^(1/3)=25.198; A^(1/(1/2−ε))=634.96, 3187.4, 403174.7, all ≤A⁴=403174.7; 4^(8/3)·20^(16/3)=3.5020·10⁸ equals 20⁴·320^(4/3); source bound D⁸=2.56·10¹⁰ is larger; Minkowski (4/π)(2/4)√20=2.8471 | Pass (r10) |
| Propagation *Needs:* owner (README:1413) | the cited declaration | `classNumber_le_bound` at `ClassNumber/Basic.lean:81` combines Minkowski (line 84) and the ideal count (lines 97, 103); Layer 1 on main lists it | Pass (r10) |
| Residue lower-bound contract in §5.7a's form (README:56) | ℚ(√−3), ℚ(√5), cubic Δ=−23, K=ℚ | κ=0.6046, 0.4304, 0.3684; κ·log D=0.6642, 0.6927, 1.1551; the range `2≤[K:ℚ]≤n` is the supplier's; ℚ excluded with κ_ℚ=1 | Pass; R02 repaired (r10) |
| Subpower consequence `κ_K≥e·a·c_n D_K^(−a)` | a=1, D=3; a=1/2, D=e² | log 3=1.0986≤3/e=1.1036; at D=e^(1/a), 2=2 (sharp) | Pass (r10) |
| Class-number–regulator consequence | ℚ(√−3), c₂=0.66; ℚ(√5), c₂=0.6642 | 0.05271≤hR=1; 0.04675≤hR=0.4812 | Pass (r10) |
| Regulator-ratio contract and new Check (README:56, 1242, 1255) | ℚ(√5)/ℚ; ℚ(√−3)/ℚ; CM ℚ(i,√5)/ℚ(√5) | log((1+√5)/2)=0.48121<1, so the constant must be below 1; ranks 0 and 0 give 1/1 (empty determinant); CM case 2^(rank K)/Q=2/Q∈{1,2} | Pass; R03 repaired (r10) |
| Small-split-prime comparison: [95] locators | ref95 lines 366, 375, 383–385, 411, 457–459, 465 | Lemma 2.4 and [FS99] on p.8; `+1` absorbed on p.9; no Lemma 2.5 or Remark 2.7 cited | Pass; R01 repaired (r10) |
| Small-split-prime comparison: residue inputs | L=ℚ(√5), K=ℚ; d=[L:K]=2 | §2.15 at N=2, D=5: 2.1875≥κ_L=0.4304; κ_ℚ=1 since §5.7a excludes ℚ; √(D_L/D_K)=D^(1/2)D_K^((d−1)/2)=√5 | Pass (r10) |
| Residue upper-bound contract and §2.32 exclusion (README:54) | ℚ(√5), ℚ(√−3), cubic −23 | §2.15 bound 2.1875, 1.493, 4.540 against κ=0.4304, 0.6046, 0.3684; §2.32 cited only at README:54 | Pass; R04 repaired (r10) |
| Uniform quadratic, Shintani and propagation *Needs:* (README:1355, 1369, 1411) | F=ℚ(√5) | ideal-count main term κ_F X=0.4304X ≤ 2.1875X from §2.15 | Pass; R04 repaired (r10) |
| Four targets without §2.32 (README:1693, 1754, 1893, 2697) | Q₈ factor at p=3; C₃ over ℚ; S₃ tame mass at s=0; elementary-two T at k=1 | A₃=(5/3)(4/9)=20/27 (an `L(1,χ)` route); exponent 1/(p−1)=1/2; 1+N_F=2; dyadic factor of T is 2; no κ, h or R anywhere | Pass; removal correct (r10) |
| Piecewise bound: `κ_F^(−2)` via §5.7a (README:1428) | F=ℚ; F=ℚ(√−3); ε=0.1 | 1; κ^(−2)=2.7358=(log 3/0.6642)²; max of (log D)²/D^ε is (2/(eε))²=54.1 | Pass; R02 repaired (r10) |
| Tower tail: base hR via §5.7a (README:1444) | K=ℚ(√5), c₂=0.6642 | right side 0.04675≤h_K R_K=0.4812 | Pass (r10) |
| Supplier anchors in the changed links | headings "5.7 Uniform small-degree field-discriminant count" and "5.7a Effective fixed-degree residue lower bound" | slugs `57-uniform-small-degree-field-discriminant-count`, `57a-effective-fixed-degree-residue-lower-bound`, both equal to the README's links | Pass (r10) |
| Instance `numberField_of_mem` | F=ℚ, K=⊥; F=ℚ(i), [K:F]=2; K=AlgebraicClosure F | ⊥≅ℚ is a number field; a finite K is one by `of_module_finite`; the closure is infinite-dimensional and excluded by the subtype's property | Pass; Prop-valued, no diamond with `of_intermediateField` (r10) |
| The 48 earlier declarations after deleting every `letI` | `#check` at 2a319ea and at e95c80e | printed types identical (empty diff); 41 sorry warnings at both heads | Pass (r10) |
| Fouvry–Klüners moments, effectivity | FK Lemma 13 versus §0.32 | √q x(log x)^(−A)≥x once q>(log x)^(2A); x=e^100, A=1 gives q>10⁴ trivial; below it §0.32 with B=2A | Pass; effective (r10) |
| Fk maximal unlinked support, effectivity | k=1 | error exponent −1/2+ε; mesh 1+(log X)^(−2); inputs §0.32, ANT-II §5.29, §3.26 all effective | Pass (r10) |
| Fk narrow wide moment comparison | D=12, D=5 (as r3) | both four-rank pairs (0,0); constant inherited from the moment bounds | Pass; §3.3 locator repaired (r10) |
| Quartic invariant convention | x⁴−y⁴ | I=−12, J=0, Δ=−256; 4I³−J²=−6912=27Δ | Pass; none (r10) |
| Elliptic/invariant height conversion | A=−1,B=0; invariant scaling | H_E=4,H_IJ=27; 27·4=4·27=108; scaling multiplier 4096 | Pass; none (r10) |
| Cutoffs, empty sums, automorphism weights | X<1; degree 3 S₃ and C₃ | Empty numerator=denominator=0, Lean ratio=0; S₃ has 3·(1/3)=1; C₃ has 1·(3/3)=1 | Pass; limiting positive denominators retained (r10) |
| Cubic splitting-symbol partition | p=2,3 | Five nonzero counts (1,3,2,6,3), sum 15; (8,24,16,24,8), sum 80 | Pass; zero form excluded (r10) |
| Cubic reduction versus maximality | maximal Δ=−83 and index-two order Δ=−332 | Δ_order=4Δ_field; mod 2 algebras F₂×F₄ versus F₂×F₂[ε]/ε² | Pass; maximality is necessary (r10) |
| Splitting densities | p=2 | (1,3,2,6,3)/16; total 15/16, zero mass 1/16 | Pass; none (r10) |
| Maximal splitting densities | p=2 | Total maximal density 21/32; no-total-ramification density 9/16; difference 3/32 | Pass; no omitted dyadic factor (r10) |
| Maximal/nonmaximal cubic local test | y³+2x³; y³+4x³ | First Eisenstein cubic is maximal at 2; second has index divisible by 2; discriminant valuations 2 versus 4 | Pass; none (r10) |
| Irreducible cubic ring to field | x³−x−1; split cubic algebra | Field discriminant −23, domain; split algebra has nonzero zero divisors | Pass; irreducibility retained (r10) |
| Davenport–Heilbronn cubic count | both signs | Positive constant 1/(12ζ(3)), negative 1/(4ζ(3)); ratio 3, sum 1/(3ζ(3)) | Pass; none (r10) |
| Resolvent correspondence | Δ=−23; Δ=−3,−4 | h₃=3 gives (3−1)/2=1; h₃=1 gives 0 | Pass; trivial character removed (r10) |
| Three-torsion fibre formula | same fields, positive Δ=229 | x³−x−1 has −23; x³−4x+1 has 229; signs are distinct, no absolute-value collapse | Pass; none (r10) |
| Large-prime total-ramification tail | cutoff Y, smallest q=2 | Σ_{m>Y}m⁻²≤1/(Y−1) for Y>1; q=2 has finite nonzero contribution | Pass; tail is summed, not primewise discarded (r10) |
| Quadratic discriminant count | squarefree n<1000 by n mod 4 | Counts (0,200,204,204), versus densities (0,2/π²,2/π²,2/π²); total 608 | Pass; Part I specialization (r10) |
| DH three-torsion means | negative −25<D<0 | 10 fields, torsion sum 12, finite ratio 6/5; limiting target 2, not a finite-X equality | Pass; real target 4/3 distinct (r10) |
| Acceptable versus strongly acceptable specifications | unrestricted, maximal, empty at one place | Local density 1, 21/32 at p=2, 0 respectively; empty local set forces global count 0 | Pass; positivity needed for ratios (r10) |
| Local cubic mass normalization | p=2, split algebra | #GL₂(F₂)/2⁴=3/8; split mass 1/6 gives 1/16 | Pass; stabilizer factor retained (r10) |
| All-order and maximal local masses | p=2 | All-order mass 8/3 gives 1; maximal mass 7/4 gives 21/32 | Pass; none (r10) |
| Local specification global formula | unrestricted archimedean signs | Real factors 1/6 and 1/2 have ratio 3; empty selector multiplies either by 0 | Pass; none (r10) |
| Roberts secondary term | ± signs | Leading ratio 3; secondary ratio √3; exponents 1,5/6,13/16 are distinct | Pass; none (r10) |
| Secondary three-torsion mean | quadratic sign coefficients | Leading 4/3 and 2; secondary scale X^(5/6)/X=X^(−1/6) in the average | Pass; no constant-term substitution (r10) |
| Secondary local-specification refinement | change one local selector to empty | Both leading and secondary local factors vanish; resulting main terms 0 | Pass; strong acceptability kept (r10) |
| Mertens positive definite count | X=10⁴,10⁵,4·10⁵ | Reduced counts 172131,5494441,44054144; normalized 0.172131,0.173750,0.174139 versus π/18=0.174533 | Pass; all three README counts reproduced (r10) |
| Positive definite boundary and content | D=−3,−4,−12,−16 | Class counts 1,1,2,2; including negative definite forms doubles them | Pass; native orbit convention (r10) |
| Quadratic-character interval estimate | χ₃, interval and progression | Sum on {1,2,3}=0; {1}=1; progression 1 mod 3 of length H sums H | Pass; coprime step essential (r10) |
| Siegel primitive regulator mean | D=5,20; q and 2q | ε₅=(3+√5)/2; ε₂₀=ε₅³; stabilizer of 2q still has period log ε₅ | Pass; primitive-part regulator retained (r10) |
| All-order L-value coefficient | square indices m=1,2 | ρ(1)=1/2,ρ(4)=1/4; sum ρ(m²)/m²=ζ(2)/(2ζ(3)); Abel factor 2/3 gives π²/(18ζ(3)) | Pass; none (r10) |
| Quoted quadratic/cubic classical constants | primitive/all forms; maximal/all cubic orders | ζ(3)·π²/(18ζ(3))=π²/18; (π²/72)/(1/(12ζ(3)))=ζ(2)ζ(3) | Pass; conventions not mixed (r10) |
| Rigid field definition and forgetful maps | degree 1, quadratic, S₃ cubic | Rigid counts per class 1,2,18; S₃ embedded count 3 and each embedded labelling count 6 | Pass; three different carriers distinguished (r10) |
| Relative torsion splitting | degree 2, ℓ=3 and ℓ=2; identity | 2·2=1 mod 3 gives section; 2=0 mod 2 has no inverse; identity norm kernel has size 1 | Pass; coprimality retained (r10) |
| S-integral étale dictionary | degree 2, v=4,8 | ℚ×ℚ versus ℚ(√2); both étale, only second a field | Pass; previous R05 repaired (r10) |
| L_β membership | β=1, S={∞} and {∞,2} | Zero belongs to both; coefficient 1/2 fails first and belongs to second | Pass; not all V(ℚ) (r10) |
| Γ_β membership | identity, diag(2,1), S as above | Identity in both; determinant 2 not a ℤ-unit but is a ℤ[1/2]-unit | Pass; not all G(ℚ) (r10) |
| β-twisted lattice/action | β=diag(2,1) on cubics | β·y³=y³/2; β·4x³=16x³; β⁻¹·x³=x³/4 | Pass; determinant twist direction fixed (r10) |
| Global field versus local algebra selector | split completion of a quadratic field | Global field degree 2; local algebra can be F_v×F_v with two idempotents | Pass; no all-local-fields restriction (r10) |
| S-integral maximal sieve | empty selector; one nonmaximal prime | Empty family count 0; index-p order has Δ multiplied by p² and leaves maximal locus | Pass; all β-components retained (r10) |
| Jacobian and archimedean mass | degrees 4 and 5 | Quartic factors 1/48,1/8,1/16 sum 5/24; quintic 1/240,1/24,1/16 sum 13/120 | Pass; no factor-two loss (r10) |
| Quartic/quintic Euler constants | p=2 | Quartic 1+1/4−1/8−1/16=17/16; quintic 1+1/4−1/16−1/32=37/32 | Pass; none (r10) |
| Quartic class-group fibre | trivial versus nontrivial quadratic characters | Trivial character gives split quadratic algebra; nonzero C₂ character determines a quadratic field; resolvent multiplicities 1 for S₄ and 3 for A₄ | Pass; full algebra fibre precedes field restriction (r10) |
| Relative class-group mass ratios | F=ℚ, real cubic types | Ordinary means 1+1/4=5/4 and 1+1/2=3/2; totally real narrow mean 2 | Pass; ordinary/narrow not conflated (r10) |
| S₄ field theorem | all signatures | Weighted archimedean sum 5/24; S₄ field has 4 embedded representatives, each weight 1/4 | Pass; unweighted class contribution 1 (r10) |
| S₅ field theorem | all signatures | Weighted archimedean sum 13/120; 5 representatives each weight 1/5 | Pass; contribution 1 (r10) |
| BSW number-field theorem | n=2,F=ℚ; F=ℚ(i) residue | Weighted quadratic constant 3/π² versus unweighted 6/π²; κ_ℚ(i)=π/4 | Pass; reciprocal automorphism convention (r10) |
| Cubic two-torsion mean | F=ℚ, a=0,1; complex base | Formula gives 3/2,5/4; r₁=0,r₂=1 gives 5/4 | Pass; all base signatures retained (r10) |
| Four-rank definition | C₂,C₄,C₈, trivial group | Two-torsion in squares has cardinal 1,2,2,1; ranks 0,1,1,0 | Pass; not full two-torsion (r10) |
| Conic four-rank formula | D=5 | b=1,5 give two soluble conics; half-count 1=2⁰; adding negative b would give 2 | Pass; divisor sign fixed (r10) |
| Negative odd Jacobi expansion | D=−3,−39; k=1,2 | Exact factor-assignment sums (1,1) and (2,4), respectively; equal 2^(k·rank) for ranks 0,1 | Pass; none (r10) |
| Positive odd Jacobi expansion | D=5; k=1,2 | Exact sums 1,1, including the −1 character; equal 2⁰,2⁰ | Pass; none (r10) |
| Negative 8-family expansion | D=−8; k=1,2 | Exact sums 1,1; inserting the absent 2^(−k) would give 1/2,1/4 | Pass; none (r10) |
| Positive 8-family expansion | D=8; k=1,2 | Γ-sum gives 1,1; its 2^k empty-prime terms cancel the prefactor | Pass; none (r10) |
| Negative 4-family expansion | D=−4; k=1,2 | Γ-sum gives 1,1, with empty odd-prime product 1 | Pass; none (r10) |
| Positive 4-family expansion | D=12; k=1,2 | Exact sums 1,1 with odd product 3 mod 4 | Pass; none (r10) |
| Maximal unlinked support | k=1, points 00,01 | Their linkage is 0; cardinal 2=2¹; all four points contain linked pairs | Pass; no full-space support (r10) |
| FK main coefficients | k=0,1,2 | N(k,2)=1,2,5 and N(3,2)=16; imaginary 1,2,5; real 1,3/2,11/4 | Pass; none (r10) |
| Narrow/ordinary comparison | D=12 and D=5 | Both pairs of four-ranks (0,0); D=12 has a 3 mod 4 divisor, D=5 merely lies in candidate family | Pass; R02 locator only (r10) |
| Rank-grid zero lemma | zero function; constant; Euler product | Zero satisfies bounds; nonzero constant has g(1)≠0; product has ω=0,α=1/2 and 0>0 is false | Pass; strict threshold necessary (r10) |
| Rank moment determinacy | p=2,u=0,1; rank-zero point mass | Prescribed moments at k=0,1 are (1,2),(1,3/2); point mass gives (1,1) | Pass; nonvacuous moment hypothesis (r10) |
| FK moment/law headlines | p=2,r=0,u=0,1 | η∞≈0.288788095; rank-zero probabilities ≈0.288788095,0.577576190; not equal | Pass; sign parameter matters (r10) |
| Malle index and cyclotomic orbit definitions | S₃ natural/regular; C₃; identity | Transposition indices 1/3; C₃ index 2; identity index 0 excluded from minimum | Pass; action recorded (r10) |
| Malle a,b and conjectural status | C₃ over ℚ and ℚ(ζ₃); V₄ regular | (a,b)=(1/2,1),(1/2,2); V₄=(1/2,3), predicting log² | Pass; no unconditional conjecture (r10) |
| Abelian conductor series | simple/double pole at a | Residue c gives coefficient c/a; double pole adds log X; trivial group has singleton count 1 | Pass; trivial group excluded from pole assertion (r10) |
| Klüners obstruction | C₃≀C₂ in degree 6 | Group order 18, minimum index 2; X^(1/2)log X divided by X^(1/2) tends to ∞ | Pass; original prediction really fails (r10) |
| Cubic conductor–discriminant | x³−3 and x³−2 | −243=(−3)·9²; −108=(−3)·6² | Pass; wild and nonsquarefree conductors retained (r10) |
| Quadratic order three-torsion bound | conductor 9 over ℚ(√−39) | Local 3-primary kernel can have order 9; replacing wild factor by 3 is too small | Pass; corrected wild bound (r10) |
| Relative small-split-prime torsion estimate | d=2,ℓ=3 | θ range 0<θ<1/(12(N−1)); zero split-prime count cannot enter a denominator | Pass; positivity conditions retained (r10) |
| Integer-lattice largest minimum | ℚ(i); arbitrary diag(1,T²) | Arithmetic minima (1,1); generic last minimum T and covolume T do not imply T≤C√T | Pass; ring multiplication essential; R01 locator (r10) |
| Small square-ideal generators | principal unit ideal and square ideal | Unit ideal gives norm 1=1²; squaring ideal norm 2 gives norm 4, not 2 | Pass; square condition distinguished (r10) |
| Square-norm curve estimate | degrees 3,4, P₁=P₂=B | Imported curve exponent B^(1/3),B^(1/4); resulting torsion exponents 1/3,3/8 | Pass; coefficient-independent supplier (r10) |
| General two-torsion saving | n=3,4 | 1/2−1/(2n)=1/3,3/8; degree 1 is outside stated n≥3 signature | Pass; none (r10) |
| Elliptic integral-point bound | nonsingular cubic; singular discriminant 0 | β=0.2782386677; Δ=0 would kill a positive-power discriminant bound and is excluded | Pass; native nonsingularity retained (r10) |
| Cubic torsion feedback | β above | a=1/[6(1−β/log 2)]=0.2784337427<1/3; replacing log 2 by 1 changes a | Pass; all cubic fields included (r10) |
| Uniform quadratic field count | F=ℚ,X≥1; X<1 | D_F=h₂(F)=1 gives O(X); relative discriminant norms below 1 count 0 | Pass; constant chosen before F (r10) |
| Shintani cubic order estimate | D=h=1; X=D³h^(2/3) | First becomes O(X+X^(−1/2−ε)); at threshold error has X-scale up to D^ε | Pass; degree-one contour handled separately (r10) |
| Relative torsion propagation | F=ℚ | Bound becomes O(√X+X); unit ideal contributes 1, not 0 | Pass; no all-conductor equality assumed (r10) |
| Local cubic order factors | q=3,s=1 | Totally ramified 2187/1936; split 675/484; denominator retains 1−3/9³ | Pass; page-image formula agrees (r10) |
| Order mass versus generic stabilizer | ℚ×ℚ(√5), index 11 | Embedded orders 3; orbits of sizes 2,1; masses 1+1/2=3/2 versus erroneous generic-class mass 1 | Pass; source error repaired (r10) |
| Cubic character Euler cancellation | χ³=1, formal u | (1−χ²u²)/(1−χu)=1+χu; constant coefficient 1 | Pass; no tame restriction needed (r10) |
| Five-range torsion bound | four transition cutoffs | Adjacent values D²; D^(5/2)h^(2/3); D³h^(2/3); D³h^(2/3) | Pass; ranges join (r10) |
| Quadratic tower tail | tower top bound X, base D>√X | D_top≥D²>X gives empty tail; at D=h=1 the large-range estimate is X | Pass; order of cutoffs retained (r10) |
| Wreath transposition fibre | d=1,2 | C₂≀1=C₂; C₂≀C₂=D₄ of order 8; block labellings 2^d=2,4 | Pass; quadratic blocks distinguished (r10) |
| Thin two-group torsion | zero tower length; positive length | Degree-one family is singleton with three-torsion 1; positive-length estimates are asymptotic families | Pass; no m=0 extrapolation (r10) |
| Two-extension field count | k=ℚ,m=1 | Coefficient specializes to 6/π², the quadratic count; quadratic automorphism count 2 cancels degree 2 | Pass; none (r10) |
| Two-extension three-torsion mean | k=ℚ,m=1, real/imaginary mix | Equal leading family sizes give (4/3+2)/2=5/3 | Pass; not 2 or 4/3 universally (r10) |
| Relative wreath mean | signature parameter u=0,1 | 1+3^(−u)=2,4/3; identity relative norm kernel has size 1 | Pass; relative numerator retained (r10) |
| Embedded quadratic-wreath type | G=C₃,C₂,1 | Inverse graph gives S₃, V₄, C₂ respectively; outside-involution classes 1,2,1 | Pass; good/bad types distinguished (r10) |
| Moment normalization | (A₃,S₃), real/imaginary | Unrigid means 1/6,1/2; rigid factors 6,2 give 1,1 | Pass; maps are not unmarked counts (r10) |
| Admissibility and abelianization | C₃ inversion; C₂ trivial inversion | S₃ abelianization C₂; V₄ has two-dimensional elementary quotient | Pass; good-type condition restrictive (r10) |
| Embedded-type/Goursat classification | #G=12,#N=4 | Ambient type size 2·12·4=96; changing N to 1 gives 24 | Pass; quotient data retained (r10) |
| Elementary-two T definition | k=1,s=1,2 | Dyadic factors 2,19/16; naive odd-prime rule at s=2 gives 3/2 | Pass; three discriminating local tests (r10) |
| Elementary-two U definition | k=1,s=1; p=3,5 | Dyadic 1/2; odd factors 1/3,7/5; opposite dyadic sign gives 3/2 | Pass; mod-four selector retained (r10) |
| Elementary-two V definition | k=1,s=1; p=3,5 | Dyadic 5/4; odd factors 1,7/5; adding absent dyadic term gives 7/4 | Pass; none (r10) |
| T,U,V continuation and selectors | k=1 | Zeta pole orders 2,0,1; normalized dyadic factors 1/2,1/2,5/8; real/imaginary constant coefficients 1,0 | Pass; not evaluation of divergent series (r10) |
| Elementary-two divergence | k=1 versus k=0 | Leading scale X log X versus X; divided by quadratic X gives log X versus constant | Pass; k≥1 essential (r10) |
| Low-degree alternating moments | n=3,4,5 over ℚ | Imaginary 1/2,1/4,1/12; real 1/6,1/24,1/120 | Pass; native headline matches (r10) |
| Q₈ residue factors | p=3; χ(2)=±1 | A₃=20/27, lower B₃=16/27; dyadic 1/4,3/4; extending lower product to p=2 gives 0 | Pass; separate dyadic factor essential (r10) |
| Restricted L-value mean/divergence | fixed R=5·13·17 | R=1105 forces at least 3 primes; 2√(3/5)>1; harmonic lower sum grows C_R log T | Pass; restricted mean supplied separately (r10) |
| A₄ kernel/field correspondence | two eligible kernels; sample size m=2 | Labels 2·24=48; bootstrap values 0,48,48,96 have mean 48 | Pass; kernel count not labelled-surjection count (r10) |
| Small trace-zero element | ℚ(√d); biquadratic field | Tr(√d)=0; in degree 4 a quadratic-subfield element still has degree 2 | Pass; generator exclusion needed (r10) |
| Schmidt uniform field bound | n=2,4 | Exponents (n+2)/4=1,3/2; uniform constant precedes the varying base | Pass; no fixed-base constant summed (r10) |
| Mixed-trace finite fibres | r=3,n=6,d=4,5 | Monomial counts 15≤18,21>18; map (x,y)↦(x,xy) has infinite fibre at (0,0) but singleton at x≠0 | Pass; excluded determinant locus retained (r10) |
| Mixed-trace interpolation exception | r=4,n=9,d=4 | 35<36, so this exceptional double-point configuration cannot satisfy the selected dimension inequality | Pass; no generic-rank overclaim (r10) |
| Lemke Oliver–Thorne headline | n=2,3,4,5 | Least d=2,3,3,4; stated flexible exponents 3,11/3,17/4,24/5 | Pass; small degrees not dropped (r10) |
| Cyclic-prime counts | p=2,3; V₄ | Exponents 1,1/2; p−1 character labels 1,2; V₄ has log² and is not cyclic prime | Pass; no pure-power overclaim (r10) |
| Finite-simple large subgroup | A₅,A₄; C₂; r=0,2 | 144>60; 1<2; r=0 yields 1=1, r=2 gives 20736>3600 | Pass; nonabelian and r≥1 retained (r10) |
| Conditional/unconditional Galois bounds | h=60; small abelian branch | 1/4+1/(2√60)+1/60≈0.331216<3/8; 17/48<18/48 | Pass; owned group input closes implication (r10) |
| Fixed quadratic resolvent | F=ℚ(√−3) | log √X=(1/2)log X; conversion gives 7/(60√3), not 7/(30√3) | Pass; exceptional logarithm retained (r10) |
| Baily quartic bound | empty and singleton family | Empty sum=count=0; singleton retains h₂(K)log²(2D_K)/√D_K | Pass; arbitrary subfamilies permitted (r10) |
| Square-norm ideal subsets | local types 111,12,3,1²1,1³ | Subset/degree-one counts (3,3),(1,1),(0,0),(1,2),(0,1) | Pass; ramified cases included (r10) |
| Dyadic discriminant comparison | c divides 2O_K | v(d)=2v(2)+v(a)−2v(c)≥v(a); equality when v(c)=v(2) | Pass; no odd-only conductor (r10) |
| Uniform cubic ideal count | T=D² | Error D^(1/2)T^(1/4)=D≤D²=T; below threshold log(2T)≤2log(2D) | Pass; uniformity proved in route (r10) |
| Weighted partial summation | b=0,1; a=0 negative control | Both positive-a cases give exponent 1/2+a+ε; at a=0 dyadic shells add a logarithm | Pass; a>0 retained (r10) |
| Quartic torsion applications | computed cubic exponent a | 1/2+a=0.7784337427; exceptional resolvent adds log before ε-absorption | Pass; cyclic cubics included (r10) |
| Governing-field definition | same Frobenius class, excluded ramified prime | Class function must give equal ranks on that class; ramified Frobenius is undefined, hence finite exceptional set necessary | Pass; domain specified (r10) |
| Eight-rank governing example | p=5,17 | h(−20)=2,h(−68)=4, so eight-rank 0 in both; four-ranks differ 0,1 | Pass; rank level not confused (r10) |
| Sixteen-rank spin criterion | split vs nonsplit prime | Split primes enter the residue-symbol criterion; nonsplit primes fail the splitting hypothesis, not a forced zero spin | Pass; condition retained (r10) |
| Restricted Pell radicands | d=1,2,3,5 | 1 has (0,1), gives ℚ; 2 has (1,1), field Δ=8; 3 forbidden; 5 has (2,1), field Δ=5 | Pass; radicand not discriminant (r10) |
| Historical Pell bounds | α and upper bound | α≈0.419422442<2/3≈0.666666667; 1−α≈0.580577558 lies between | Pass; no density conclusion (r10) |
| Fixed-prime-factor Pell law | t=1,2,3,4 | q_t=1,1/2,1/2,7/16; 2×2 symmetric matrices: 4/8 invertible, general matrices: 6/16 | Pass; symmetric law required (r10) |
| Pell graph criterion | primes 5,13 and 5,41 | Symbols −1,+1; first Laplacian rank 1 and 8²−65=−1; second rank 0 gives no conclusion | Pass; graph criterion one-way (r10) |
| Pell pattern equidistribution route | t=2, off-diagonal pair | Diagonal character sum O(PQ); off-diagonal conductor q₁q₂ gives O(Q log(2Q)); Cauchy yields P√Q+√P Q^(3/2)√log(2Q) | Pass; hyperbolic cutoff handled (r10) |
| Polynomial embedding metric | X²+1; X²−2 | Gram diag(1,1) and diag(2,4); counting both complex embeddings would double first | Pass; unweighted complex-pair convention (r10) |
| General reduced Gram basis | diag(1,2),diag(2,1),diag(1,1) | First reduced and strong; second fails first minimum; third reduced but swap gives a second basis | Pass; signs and ties retained (r10) |
| Monic quasi-reduction | X²+1/4; dilation ρ=2,3 | Gram diag(1,1/4) fails fixed-first minimum; at ρ=2 tie diag(1,1), at ρ=3 strong diag(1,9/4) | Pass; not universal quasi-reduction (r10) |
| Binary quasi-reduction | x²+2xy+3y²; x²+y²/4 | Substitution x↦x−y gives x²+2y²; second has discriminant −1 and a primitive vector of norm²≤1/2<1 | Pass; restricted change group (r10) |
| Polynomial/binary dilation laws | ρ=2 | Monic basis scales (1,2,4,…); binary order basis scales (1,2,2,…), not overall homothety | Pass; none (r10) |
| Squarefree field discriminant implies S_n | quadratic Δ=5; cubic Δ=−23 | Normal-closure degrees 2!=2,3!=6; ramified inertia is transposition | Pass; degree≥2 and squarefree required (r10) |
| Monic finite-modulus sieve | H=10,q=4,residue 0 in second coefficient | Count 49 versus length/q main term 50; q=1 gives 199 versus 200 | Pass; fixed-modulus boundary O(1) (r10) |
| Weak quasi-reduction | root expansion on compact separated set | Gram–Schmidt degree-j lengths scale ρ^j; X²+1/4 crosses first-minimum obstruction only after ρ≥2 | Pass; threshold depends on region (r10) |
| Strong reduction ring fibres | independent signs; tied X²+1 | At least 2^n sign variants; tied quadratic also admits swap, so literal basis uniqueness fails | Pass; quotient by signs stated (r10) |
| Trace-slice translation | X²−9 translated by 1 | X²+2X−8 has Δ=36; modulo 4 and 9 both sides 0; repeated roots give 0=0 | Pass; owned identity uses real pinned inputs (r10) |
| Trace-slice local squarefree density | n=2,a=0 and a=1 | Δ=−4b gives κ₂=0; Δ=1−4b gives κ₂=1 and odd factors 1−p⁻²; product 8/π² | Pass; positive density not assumed on trace zero (r10) |
| Trace-slice tail | fixed polynomial with Δ=36 | No p>6 has p² dividing Δ; translation preserves Δ, averaging loses exactly one height power | Pass; no arbitrary-lattice tail assumed (r10) |
| Short-generator upper bound | n=2,3 | Trace normalization leaves growth exponents 2,5 rather than full polynomial-box exponents 3,6 | Pass; translations accounted for (r10) |
| Regular monic region and dilation | roots ±1,±i; repeated roots; D₂D₃ | C=1,c=2 for both simple examples; c=0 for repeated roots; coefficient pair (1,2) maps to (6,72) | Pass; signature/open-region controls (r10) |
| Root-separation junk cases | n=0,1 | Empty tuple makes separation vacuous; lone zero root satisfies upper bound 0 but not −1 | Pass; n≥2 in field theorem (r10) |
| Regular monic sieve | degree 2,3; forced p² divisibility | Dilation volumes Y³,Y⁶; forced bad residue gives local density 0 | Pass; positivity hypothesis discriminates (r10) |
| Separated-generator multiplicity | n=3,Y>K | abs(m₂)≤K/Y<1 gives integer m₂=0; m₀ has O(Y) choices, not O(1) | Pass; integrality and separation essential (r10) |
| Monogenic field lower bounds | n=2,3 | Discriminant exponents 1,5/6; generator exponents 2,5; Y⁶/O(Y)=Y⁵ | Pass; signatures and full region retained (r10) |
| Monogenic prediction | n=2 negative control | C₂=1/2 would give 1/(2ζ(2)), true quadratic coefficient 1/ζ(2) | Pass; conjecture restricted to n≥3 (r10) |
| Binary local factors and sieve | discriminant scale t, n=3,4 | Δ scales t⁴,t⁶; polynomial counts scale t⁴,t⁵; local forced p² factor gives 0 | Pass; all-prime sieve contract (r10) |
| Binary arithmetic Bertini | nonsquarefree local residue | Density 0 when one p² is forced; nonzero local densities are required before field conclusions | Pass; no arbitrary local prescription (r10) |
| Regular binary region | nonzero discriminant compact set | Root collisions force Δ=0 and leave compact region; bounded positive minimum of abs(Δ) excludes them | Pass; none (r10) |
| Binary invariant-order fibres | fixed n, ±equivalent models | Integral order is unchanged under permitted action; number of distinct generator orbits bounded by C_n, not one | Pass; finite-rank unit-equation input (r10) |
| Compact binary transporters | n=2,xy; n≥3 | diag(u,u⁻¹) fixes xy for arbitrarily large u; for n=3,4 vanishing high weights would force repeated roots | Pass; n≥3 essential (r10) |
| Binary field lower bound | n=3,4,5 | Exponents (n+1)/(2n−2)=1,5/6,3/4; even n=4 remains conditional | Pass; no unsupported even theorem (r10) |
| Alternating-extension transfer | n=3; complex conjugation | A₃=C₃; sign kernel has index 2; two disjoint transpositions are even but nontrivial at infinity | Pass; totally real condition in real route (r10) |
| Unramified alternating lower bound | n=3,5; finite multiplicity | Exponents 1,3/4; at n=3 coarse field-label multiplicity bound 2^(3!)=64 is finite | Pass; no infinite fibre division (r10) |
| All fields degree≤5 | n=2,3,4,5 | n=2 quadratic coefficient 6/π²; cubic 1/(3ζ(3)); quartic D₄ adds a linear term; quintic bad local mass decays (11/12)^k→0 | Pass; S_n not substituted for all quartics (r10) |
| Tame nonabelian local mass | G=S₃,V₄,1 at s=0 | Pair counts/automorphisms 12/6=2,12/4=3,1; N+1=2,3,1 | Pass; nonabelian/trivial controls (r10) |

## Not verifiable

These are carried from ~10. The diff touches none of the passages that use them.
- **[134] Bruin–Hemenway** (Acta Arithmetica 159, 2013), cited at README:2108 and README:2129. Earlier rounds found no legal copy (arXiv returned HTTP 429; the publisher host has no licence class). The criterion is restated in ref103 (line 1375) and ref135 (line 268).
- **Friedman–Skoruppa [FS99]**, the source of the relative regulator-ratio bound, has not been read.
- **The integral-basis data of `E`** (trace-pairing determinant `2²²` and the 255 half-coset tests) are hypotheses of the application (README:2083). They were not recomputed.

## Source issues

- **Gap** in ref103 at §5, proof of Theorem 3, p.22: the source defines `ψ` on the enlarged governing field through `ψ₀` modulo the modulus `F` of `E`, without showing that `F` divides that field's joint-spin modulus (2.2); it should enlarge the field (e.g. by `ℚ(ζ_(8F))`) so that `8F` divides its discriminant and hence the modulus; affects the proof.
- **Misprint** in ref103 at (5.2), p.23: the indicator in the normalised spin reads sixteen dividing `h(−p)`; it should read `h(−4p)`, the class number of `ℚ(√−4p)` named in the first line of §5; affects nothing.
