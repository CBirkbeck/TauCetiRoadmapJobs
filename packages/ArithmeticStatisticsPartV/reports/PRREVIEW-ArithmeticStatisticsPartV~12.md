# Review of ArithmeticStatisticsPartV (pull request #1175 at 2a99ce1)

**Verdict:** accepted

This is an incremental re-review of the 18 README lines changed since 4608cd5, all in commit 2a99ce15. `Suggested.lean` is unchanged and nothing outside the folder changed. The one finding of the previous review (R01: number-field quadratic reciprocity credited to SieveMethodsAndPrimePatterns §5.6) is repaired, the repair introduces no new defect, the gate passes with the build, and the dependency check reports no problem. No finding remains.

## Previous findings

- R01 — repaired: README:62 now states the contract "From TauCetiRoadmap.ClassicalArithmeticCompletion §1.66 require quadratic reciprocity in a number field `K`: for nonzero, odd, coprime `α,β∈O_K`, `(α/β)=µ₂(α,β)µ_∞(α,β)(β/α)`", with §1.57 for the dyadic factor and §1.70 for periodicity; README:60 no longer mentions an "ideal-symbol reciprocity adapter"; README:2143 and README:2145 cite §§1.66 and 1.57 at the two steps that use them; README:2721 lists ClassicalArithmeticCompletion §§1.57, 1.66 and 1.70 under the layer's Dependencies.

## Verified sound

### Scope

- The diff (`scratch/changes.md`, read as data) changes README:22, 60, 62 (new paragraph), 97, 2127, 2129, 2143, 2145 and 2721. Also checked, because they cite or depend on the changed lines: the sixteen-rank spin criterion (README:2121–2131), the governing-field theorem and its Checks (README:2137–2157), and the §5.6 contract as a whole (README:60).
- `git diff --stat origin/main...HEAD` with the folder excluded prints nothing. `git diff --stat 4608cd5 HEAD -- Suggested.lean` is empty.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json`).

### Gate, dependency check and elaboration

- **The worker's gate** (`scratch/gate.md`) passes every check, `build=0` included.
- **My run of the full gate** on this head, against `scratch/merge-order-moved.txt` and with the targeted build, prints `set_option=0 … depcheck=0 … outside-folder=0 source-material=0 build=0 OK`, every count zero.
- **The brief's dependency check** (`gate --depcheck … --movable`) prints `depcheck: 239 roadmaps, 2370 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. ClassicalArithmeticCompletion is a roadmap on main (its folder is in the content checkout); its README:23 names ArithmeticStatistics only as a consumer and says none of its consumers supplies a prerequisite back, so the new citations create no cycle.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 41 `declaration uses sorry` warnings and no other output (the file is unchanged since 9198e54).
- **Binder check.** `scratch/signatures/SignatureCheck.lean` (`#check @…` for all 49 declarations) exits 0 with 49 printed types and no error; the file is unchanged, so the earlier binder comparison and one-tactic probe still hold.
- **Citation leads.** `scratch/citations.md` has one lead in the changed lines: `ShortCharacterConjecture` "occurs nowhere in the pinned Mathlib and Tau Ceti sources". That is expected: README:60 cites it as the Lean definition of the supplier roadmap, and it is `SieveSpin.ShortCharacterConjecture` at `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean:710` at that pull request's head (inside `namespace TauCetiRoadmap.SieveMethodsAndPrimePatterns`, line 44), not a library name.

### Supplier citations resolved (every one in the changed lines)

| Citation | Where it resolves | What it states | Matches the README |
| --- | --- | --- | --- |
| ClassicalArithmeticCompletion §1.66 | main, README:2195, anchor `166-quadratic-reciprocity-in-a-number-field-with-dyadic-and-archimedean-factors` (also `layer-1-topic-66`) | `K` a number field, `α,β∈O_K` nonzero, odd, coprime: `(α/β)=µ(α,β)(β/α)`, `µ=µ₂µ_∞`, symbols at the ideals `βO_K`, `αO_K` | README:62, 2127, 2143: yes, same three hypotheses |
| ClassicalArithmeticCompletion §1.57 | main, README:1977, anchor `157-the-dyadic-factor-μ₂α-β-depends-only-on-α-and-β-modulo-8` | odd `α≡α'`, `β≡β'` mod `8O_K` give `µ₂(α,β)=µ₂(α',β')` | README:62, 2143: yes |
| ClassicalArithmeticCompletion §1.70 | main, README:2298, anchor `170-periodicity-of-the-completed-quadratic-residue-symbol-modulo-8α` | `α≠0`, odd `β≡δ` mod `8αO_K`: `|α/β|=|α/δ|`; for totally positive `β,δ`, `(α/β)=(α/δ)` | README:62, 2127: yes; the totally complex form `(α/β)=(α/δ)` follows from §1.48 (README:1699), which defines `|α/β|=µ_∞(α,β)(α/β)` and says `|α/β|=(α/β)` when `K` is totally complex |
| SieveMethodsAndPrimePatterns §5.6 | head 66e58fcf, README:3944; `git diff 8111bc5 66e58fcf` touches no line of §5.6 | the chain at README:4014–4075: coefficient sequence, generator independence, kernel reciprocity, Type I, Type II, conditional prime bound | README:60: yes |
| "Short-character conjecture owned in Layer 5" | head 66e58fcf, README:145 | `C_d` | README:60 anchor: yes |
| `SieveSpin.ShortCharacterConjecture` | head 66e58fcf, Suggested.lean:710 | `∃δ>0, ∀ε>0, ∃C>0`, real nonprincipal `χ` mod `q`, `1<q≤Q`, `3≤Q`, `N≤Q^(1/m)`: `|Σ_(M<n≤M+N)χ(n)|≤C·Q^((1−δ)/m+ε)` | README:60 "uniform-modulus short real-character-sum conjecture … imprimitive characters included": yes |
| [[135]] Lemmas 3.1–3.2, p.8 | ref135 lines 334–353 (page marker `=== page 8 ===` at line 295, `=== page 9 ===` at line 367) | 3.1: `L` totally complex, `α,β` odd, `(α/β)=ε(β/α)` with `ε` depending only on `α,β` mod `8O_L`; 3.2: `L` totally complex, `α≠0`, `(α/β)` depends only on `β` mod `8αO_L` | README:2127 "the two reciprocity inputs of [[135]], Lemmas 3.1–3.2, p.8": yes; 3.1 is §1.66 with §1.57 at `µ_∞=1`, 3.2 is §1.70 at `µ_∞=1` |
| [[103]] Lemma 2.1, p.4 | ref103 lines 201–216 | odd `β`: `µ_∞(α,β)(α/β)` depends only on `β` mod `8α`; odd `α`: the law with `µ₂µ_∞`; `µ₂` depends only on `α,β` mod 8 | README:2143: yes |

The symbol on odd ideals is the same object on both sides of the contract: SieveMethodsAndPrimePatterns §5.6 (README:3946 at its head) names it as Tau Ceti `Ideal.powerResidueSymbolIdeal` with `n=2`, which exists at the pin (`TauCeti/NumberTheory/NumberField/PowerResidueSymbol/Ideal.lean:94`: the product over the normalized prime factors of the prime symbols, vanishing off the coprime classes), and ClassicalArithmeticCompletion §1.48 (README:1699) takes "the quadratic residue symbol at the ideal `βO_K` (the power residue symbol with `n=2`)". So "(on odd ideals, the symbol of SieveMethodsAndPrimePatterns §5.6)" at README:62 is right.

### Remarks on untouched text (no change requested)

- README:60 says the joint-spin chain has "no Lean declaration there". That is accurate for every item the contract consumes (`s_a`, generator independence, kernel reciprocity, Type I, Type II, the prime bound). The supplier's Lean file does declare, besides `ShortCharacterConjecture`, the spin of a generator (`SieveSpin.spin`, Suggested.lean:720) and the sign-equidistribution corollary of Theorem 2 of [[103]] (`joint_spin_sign_equidistribution`, line 733); neither is consumed here.
- The overlap lead "LocalFieldsRamification Layer 3" (README:283, 2310, 2610) is unchanged since the previous reviews, which resolved it through the Former-layer-numbers table at the open head of that revision.
- Ownership: every object in the changed lines is imported (Mathlib, SieveMethodsAndPrimePatterns, ClassicalArithmeticCompletion), so the change adds no ownership; no other open pull request changes this roadmap (`scratch/overlaps.md`).

### Computed adversarial pass

Rows M1–M10 are new and cover every statement the diff adds or changes. The rows after them are carried from the previous report, PRREVIEW-ArithmeticStatisticsPartV~11, and tagged "(r11)" (rows it carried from ~10 keep their "(r10)" tag); their README line numbers are as in the round that computed them (at this head add 2 to every line after 60). Rows N7 and N9 of ~11 (the reciprocity step and the §5.6 contract) are replaced by M5 and M8.

| Statement / target | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| M1. §1.66 contract as restated (README:62) | ℚ: `(3,7)`; ℚ: `(−1,−3)`; ℚ(i): `(3,7)`; wrong model: law without `µ₂` | ℚ: `(3/7)=−1` (squares mod 7 are 1,2,4), `(7/3)=(1/3)=1`, `(3,7)₂=(−1)^(1·3)=−1`, `(3,7)_∞=1`, so `−1=(−1)(1)(1)`. ℚ: `(−1/−3)=−1`, `(−3/−1)=1`, `(−1,−3)₂=1`, `(−1,−3)_∞=−1`: `−1=(1)(−1)(1)`. ℚ(i): 3 and 7 are inert; `𝔽₇ˣ` (order 6) lies in the squares of `𝔽₄₉ˣ` (the subgroup of order 24), so `(3/7)=(7/3)=1`, and `(3,7)_(ℚ₂(i))=(3,N(7))_(ℚ₂)=(3,49)₂=1`, `µ_∞=1` (no real place): `1=1·1·1`. Without `µ₂` the ℚ case reads `−1=1`, false | Pass |
| M2. Check at README:62 | `α=3,β=7`; `α=β=3` | `(3/7)(7/3)=(−1)(1)=−1`; dyadic symbol `−1`, real symbol `1` (both positive): as stated. `jacobiSym 3 3=0` since `gcd=1` fails, so the coprimality hypothesis excludes it | Pass |
| M3. §1.57 contract (README:62, 2143) | ℚ: `(3,7)₂` against `(11,15)₂`, `(3,15)₂`; the step `r(N_(M/E)w) mod 8` | `11≡3`, `15≡7` mod 8: `(−1)^(5·7)=−1=(3,7)₂`; `(3,15)₂=(−1)^(1·7)=−1`. `N_(M/E)(w)=∏_(τ∈Gal(M/E))τ(w)` and `τ(8O_M)=8O_M`, `σ₀(8O_M)=8O_M`, so `r(N(w)) mod 8O_M` is a function of `w mod 8O_M`, and `µ₂(w,r(N(w)))` depends only on `w mod 8` as README:2143 says | Pass |
| M4. §1.70 contract and its totally complex form (README:62, 2127) | ℚ, `α=−1`, `β=−3`, `δ=5` (`−3≡5` mod `8α=8`); ℚ, `α=3`, `β=7`, `δ=31` (mod 24) | `|−1/−3|=µ_∞(−1,−3)(−1/−3)=(−1)(−1)=1=|−1/5|=(1)(1)`, while the plain symbols are `−1≠1`: the completed symbol is needed when there is a real place. `(3/31)`: both `≡3` mod 4, so `(3/31)=−(31/3)=−(1/3)=−1=(3/7)`, and `β,δ>0` makes `|·|=(·)`. In a totally complex field `µ_∞` is an empty product, `|α/β|=(α/β)` (§1.48), so `(α/β)=(α/δ)` as README:62 says; `E` and `M` are totally complex (row N10 of ~11) | Pass |
| M5. Reciprocity step of the governing-field proof (README:2143) | `𝔓=(w)` degree-one over odd `p`, coprime to the modulus; `π=N_(M/E)w` | `w` is odd because the modulus is a multiple of `8F`; `r(π)` is odd (norm `p`) and coprime to `w` (row N7 of ~11); §1.66 applies with `µ_∞=1`: `(w/(r(π)))=µ₂(w,r(π))(r(π)/(w))`, and `O_M/𝔓=O_E/𝔭=𝔽_p` gives `(r(π)/(w))_M=(r(π)/π)_E`; with `ψ(w)=ψ₀(π)µ₂` and `µ₂²=1` the product is `ψ₀(π)(r(π)/π)_E` | Pass; owner now correct |
| M6. Spin-criterion attribution (README:2127, 2129) | ref135 Lemmas 3.1, 3.2 at `L=E` | 3.1 = §1.66+§1.57 with `µ_∞=1` (`E` totally complex, signature (0,4)); 3.2 = §1.70 with `µ_∞=1`. Both at p.8 (lines 334–353 between the page-8 and page-9 markers). The *Needs:* line lists exactly the three sections the proof uses | Pass |
| M7. Summary and table lines (README:22, 97) | the three section numbers against main | §1.66 "quadratic reciprocity in a number field with its dyadic and archimedean factors" (README:2195 of the supplier), §1.57 "dependence of the dyadic factor on residues modulo 8" (1977), §1.70 "periodicity of the quadratic symbol modulo `8α`" (2298): each heading says what README:22 attributes to it | Pass |
| M8. §5.6 contract after the deletion (README:60) | supplier README:4014–4075 at 66e58fcf; the deleted adapter clause | The remaining items (unit hypothesis, `F`, `ψ`, `T_M×V_M`, `s_a`, generator independence, kernel reciprocity, Type I under `C_(|S|n)`, Type II unconditional, prime bound with exponent `1−δ/(54|S|²n(12n+1))+ε`) are all at the supplier; `grep adapter` in the README finds no remaining mention in §3.30 or the contracts | Pass; R01 repaired |
| M9. `C_d` as `SieveSpin.ShortCharacterConjecture` (README:60) | `m=3`, `Q=27`, `q=3`, `χ=χ₃`, `M=0`, `N=3=Q^(1/3)`; `q=1` | `N≤Q^(1/m)` holds with `3≤3`; `Σ_(0<n≤3)χ₃(n)=1−1+0=0≤C·27^((1−δ)/3+ε)`; `q=1` is excluded by `1<q`, matching the README's "uniform-modulus … imprimitive characters included" (the Lean quantifies over every `χ` of modulus `q`, primitive or not) | Pass |
| M10. Anchors of the three new links (README:62, 2145) | GitHub slugs of the three headings | "1.66 Quadratic reciprocity in a number field with dyadic and archimedean factors" → `166-quadratic-reciprocity-in-a-number-field-with-dyadic-and-archimedean-factors`; "1.57 The dyadic factor μ₂(α, β) depends only on α and β modulo 8" → `157-the-dyadic-factor-μ₂α-β-depends-only-on-α-and-β-modulo-8`; "1.70 Periodicity of the completed quadratic residue symbol modulo 8α" → `170-periodicity-of-the-completed-quadratic-residue-symbol-modulo-8α`; all three equal the links | Pass |
| N1. `NumberField.discr_dvd_discr` contract (README:38, 2141, 2143) | ℚ(i)⊆ℚ(ζ₈); ℚ(√2)⊆ℚ(ζ₈); ℚ⊆K; reversed control | `−4∣256`, `8∣256`, `1∣d_K`; `256∣−4` false, so the direction is fixed | Pass (r11) |
| N2. `discr_prime_pow` contract (README:38) | ℓ^k = 2, 4, 8, 16, 3, 9, 27, 5, 7, 11 | 1, −4, 256, 2²⁴, −3, −3⁹, −3⁴⁵, 125, −7⁵, −11⁹ on both sides | Pass (r11) |
| N3. "Exponent ≥ k" step and the Check (README:2141, 2153) | (ℓ,k) = (2,1)…(11,1) | exponents 0, 2, 8, 24, 1, 9, 45, 3, 5, 9 against k; only (2,1) fails, hence the factor 8 | Pass (r11) |
| N4. `8F∣D_M∣` joint-spin modulus (README:2141, 60) | ref103 (2.2); `M=E` without enlargement | `8F∣D_M∣2^(2h+3)fD_M`; without the enlargement an odd `q∣F` need not divide `F_E` | Pass (r11) |
| N5. `S` and the product identity (README:2141) | `S=σ₀·Gal(M/E)` | `∏_τσ₀τ(w)=r(N_(M/E)w)`; `S∩S⁻¹=∅` since `r³≠r`; `|S|n=8m²` | Pass (r11) |
| N6. `ψ` well defined and unit-square invariant (README:2141) | `w↦wu²`; `w↦w+Fx` | `ψ₀(N(w)N(u)²)=ψ₀(N(w))` by (6.7); `µ₂` bimultiplicative; `FO_M∩O_E=FO_E` | Pass (r11) |
| N8. Normalisation of `s_((w))` (README:2141; ref103 (5.2)) | the `|T_M||V_M/V_M²|` generators | each term `±1`; sum `|T||V/V²|(2·1_{16∣h}−1)` | Pass (r11) |
| N10. Totally complex compositum (README:2141, 2151) | `M⊇E(ζ_(8F))` | `E` has signature (0,4); no real embedding of `M`; no unit hypothesis | Pass (r11) |
| N11. A finite normal extension of a governing field governs (README:2141) | `M′⊇M` | `φ∘res` is a class function; finitely many extra excluded primes | Pass (r11) |
| N12. Anchors of the §5.6 links (README:60, 2143) | supplier headings at 3944 and 145 | slugs equal the links | Pass (r11) |
| N13. `Suggested.lean` | unchanged since 9198e54 | exit 0, 41 sorry warnings, 0 errors; 49 `#check` types | Pass (r11, recomputed this round) |
| r10-1. Eisenstein input for `g` (README:2097, 2106) | `G=T⁸−4T⁷+…+2`; control `T²+4` | coefficients even, constant 2 not divisible by 4; `G(g)=0`; control not Eisenstein | Pass (r10) |
| r10-2. `2∤exponent g` (README:2097, 2117) | `E`; 1+i; √5 | index 25 odd; √5 needs the hypothesis | Pass (r10) |
| r10-3. Kummer–Dedekind for `g` at 2 (README:2097) | `G mod 2` | `G≡T⁸`, e=8, f=1 | Pass (r10) |
| r10-4. `(g)` is the prime above two (README:2097) | `E`; (2)⊂ℤ[i]; (1+√−5) | norm 2 prime; controls norms 4 and 6 | Pass (r10) |
| r10-5. Tower ramification (README:2119) | L=ℚ, ℚ(i), ℚ(√2), ℚ(√−2), ℚ(ζ₈) | e-products 1·8, 2·4, 4·2 | Pass (r10) |
| r10-6. Check at p=2 (README:2117) | t and g | 2∣128, 5∣25 | Pass (r10) |
| r10-8. Import of `C_d` (README:60, 2139, 2694) | χ₃, χ₀ mod 3; q=1; N=0 | ranges agree; q=1 carries no nonprincipal character | Pass (r10) |
| r10-9. δ normalisation (README:2694) | ref103 lines 73, 386; supplier README:147 | witness δ implies witness δ/2 | Pass (remark) (r10) |
| r10-11. Spin-criterion import (README:2121–2129) | π over odd split p | N(π)=p odd; equivariance; ℚ: (2/(5))=−1, (4/(5))=1, (15/(5))=0 | Pass (r10) |
| r10-14. `Suggested.lean` docstring (lines 30–31) | `#check` on all 49 | 49 types, 41 sorry | Pass (r10) |
| Mathlib Kummer–Dedekind contract (README:38) | ℚ(i) at p=2,3,5; ℚ(√5) at 2 | exponent 1; `X²+1≡(X+1)²`; ℚ(√5): 2 inert, hypothesis needed | Pass (r10) |
| `Ideal.pow_inertiaDeg` contract (README:38, 2104) | (1+i), (3) in ℤ[i] | 2¹=2, 3²=9 | Pass (r10) |
| NumberFieldArithmetic §3.4 / `exponent_dvd_index` (README:46, 2104) | θ=2α (disc −23); √5; t | index 8, exponent 4; "divides" not "equals" | Pass (r10) |
| Eight-rank: Minkowski input (README:2095) | E | disc f = 2³⁶; index 128; bound 12.935 < 13 | Pass (r10) |
| Eight-rank: Kummer–Dedekind at 3, 5, 7, 11 (README:2095–2102) | f mod p | norms 81, 81 / 25×4 / 49×4 / 14641, 14641 | Pass (r10) |
| EffectiveBounds contract: discriminant from an integral basis (README:42) | ℚ(√−5) bases | 20≤20, 20≤80; non-integral basis fails | Pass (r10) |
| EffectiveBounds contract: explicit ideal count (README:42) | ℚ(√−5), X=3; ℚ, X=1 | 4≤36; 1≤2 | Pass (r10) |
| EffectiveBounds contract: class-number bound (README:42, 1411, 1413) | ℚ(√−5); ℚ; ℚ(√−23) | 2≤320; 1≤4; 3≤368 | Pass (r10) |
| EffectiveBounds contract: unit-square index (README:42) | ℚ; ℚ(√5); ℚ(√−5) | 2≤2; 4≤4; 2≤4 | Pass (r10) |
| Absorption bound (README:1411) | ℚ(√−5); ℚ | 2≤2≤320; 1≤1≤4 | Pass (r10) |
| Absorption Check (README:1425) | ℚ(√−5), ε=0, 0.1, 0.25 | 634.96, 3187.4, 403174.7 ≤ 403174.7 | Pass (r10) |
| Propagation *Needs:* owner (README:1413) | `classNumber_le_bound` | `ClassNumber/Basic.lean:81` | Pass (r10) |
| Residue lower-bound contract (README:56) | ℚ(√−3), ℚ(√5), cubic −23, ℚ | κ·log D = 0.6642, 0.6927, 1.1551; ℚ excluded | Pass (r10) |
| Subpower consequence | a=1, D=3; a=1/2, D=e² | 1.0986≤1.1036; 2=2 | Pass (r10) |
| Class-number–regulator consequence | ℚ(√−3); ℚ(√5) | 0.05271≤1; 0.04675≤0.4812 | Pass (r10) |
| Regulator-ratio contract and Check (README:56, 1242, 1255) | ℚ(√5)/ℚ; ℚ(√−3)/ℚ; CM | 0.48121<1; 1/1; 2/Q | Pass (r10) |
| Small-split-prime comparison: [95] locators | ref95 lines 366–465 | Lemma 2.4, [FS99] p.8; `+1` p.9 | Pass (r10) |
| Small-split-prime comparison: residue inputs | L=ℚ(√5), K=ℚ | 2.1875≥0.4304; κ_ℚ=1; √5 | Pass (r10) |
| Residue upper-bound contract and §2.32 exclusion (README:54) | ℚ(√5), ℚ(√−3), cubic −23 | 2.1875, 1.493, 4.540 against 0.4304, 0.6046, 0.3684 | Pass (r10) |
| Uniform quadratic, Shintani and propagation *Needs:* (README:1355, 1369, 1411) | F=ℚ(√5) | 0.4304X ≤ 2.1875X | Pass (r10) |
| Four targets without §2.32 (README:1693, 1754, 1893, 2697) | Q₈ at p=3; C₃; S₃ mass; T at k=1 | 20/27; 1/2; 2; 2 | Pass (r10) |
| Piecewise bound: `κ_F^(−2)` via §5.7a (README:1428) | ℚ; ℚ(√−3); ε=0.1 | 1; 2.7358; 54.1 | Pass (r10) |
| Tower tail: base hR via §5.7a (README:1444) | K=ℚ(√5) | 0.04675≤0.4812 | Pass (r10) |
| Supplier anchors (§5.7, §5.7a) | headings | slugs equal the links | Pass (r10) |
| Instance `numberField_of_mem` | ℚ, ⊥; ℚ(i); algebraic closure | ⊥≅ℚ; finite; closure excluded | Pass (r10) |
| The 48 earlier declarations after deleting every `letI` | `#check` at 2a319ea and e95c80e | identical types | Pass (r10) |

## Not verifiable

Carried from the previous reports; the diff touches none of the passages that need them.
- **[134] Bruin–Hemenway** (Acta Arithmetica 159, 2013), cited at README:2110 and README:2127: no legal copy was found in earlier rounds (arXiv returned HTTP 429; the publisher host has no licence class). The criterion is restated in ref103 (line 1375) and ref135 (line 268).
- **Friedman–Skoruppa [FS99]**, the source of the relative regulator-ratio bound, has not been read.
- **The integral-basis data of `E`** (trace-pairing determinant `2²²` and the 255 half-coset tests) are hypotheses of the application (README:2085) and were not recomputed.

## Source issues

- **Gap** in ref103 at §5, proof of Theorem 3, p.22: the source defines `ψ` on the enlarged governing field through `ψ₀` modulo the modulus `F` of `E`, without showing that `F` divides that field's joint-spin modulus (2.2); it should enlarge the field (for example by `ℚ(ζ_(8F))`) so that `8F` divides its discriminant and hence the modulus; affects the proof. (Carried from the previous report; the README's enlargement closes it.)
- **Misprint** in ref103 at (5.2), p.23: the indicator in the normalised spin reads sixteen dividing `h(−p)`; it should read `h(−4p)`, the class number of `ℚ(√−4p)` named in the first line of §5; affects nothing. (Carried from the previous report.)
