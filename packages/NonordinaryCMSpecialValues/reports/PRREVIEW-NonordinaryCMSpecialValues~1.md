# Review of NonordinaryCMSpecialValues (pull request #2290 at ecbdd2f)

**Verdict:** needs changes

## R01 (P1) — The logarithmic formula is off by two

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:347`, Check at line 360 and example at line 487: “This is `log|N_{K(3)/K}(_az_f)|`”.
**Claim:** With ordinary complex absolute value, the left side is half the stated right side.
**Witness:** For `K=Q(i), f=(3), a=(5)`, Kato's product gives theta logarithms `0.661921072155` and `5.929752659854`. The inverse-unit norm logarithm is `−6 log 3`, whereas the asserted right side is `−12 log 3` (KATO04 lines 228–237).
**Repair:** Write `2 Σ_σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹)L′_{K,f}(χ,0)`. Change both ordinary norm-log examples to `−6 log 3`, and the theta norm-log to `+6 log 3`. The corrected example gives `2(−6 log 3)=−12 log 3`.

## R02 (P1) — The ray level does not ensure good reduction

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:408`: “`E` has good reduction at every place of `K′`, by Néron–Ogg–Shafarevich, since `g ⊂ f` makes `T_ℓE` unramified”.
**Claim:** Unit injectivity modulo the full level does not kill inertia at a prime dividing that level; the height-one reciprocity application therefore lacks good reduction.
**Witness:** Take `K=Q(i), p=2, f=(1+i)³, g=(4)`. The inertia idele `i` fixes `K(4)` but acts on the cohomological `3`-adic realization by `i⁻¹=−i≠1` (KATO04 lines 5414–5424).
**Repair:** Require good reduction above `p` in the local statement. For the all-prime theorem, first enlarge the prime-to-`p` modulus so global units inject there, prove good reduction above `p`, apply reciprocity, and descend with the auxiliary Euler factors. For the witness, replace `(4)` by `(20)`: `i≠1 mod 5`, so this inertia obstruction disappears. Delete the claim of good reduction everywhere.

## R03 (P1) — Class-character twists preserve the canonical sign

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:260`: “For `8 | D` the sign depends on the class-character twist”.
**Claim:** The cited proposition says that each sign family is a whole orbit under class-character twists.
**Witness:** ROHRLICH-NOTES lines 677–680, Proposition 1.6, p.15: each `X⁺(D)` and `X⁻(D)` is a class-character orbit. For `D=8`, `h=1`: the only class twist is trivial, yet two opposite-sign canonical characters exist.
**Repair:** Replace the sentence with: “For `8 | D` there are two canonical families with opposite root numbers; class-character twists preserve the root number within each family (Rohrlich, Proposition 1.6, p.15).”

## R04 (P2) — Restore the two declared supplier contracts

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:11–12,23,72,92`: the local Fröhlich–Queyrut theorem and the general finite-free character twist are claimed here, without either declared gap slug.
**Claim:** Ownership disagrees with the two declared contracts: these generic results belong to AutomorphicLFunctionsAndLocalFactors and SelmerIwasawaCohomology, respectively.
**Witness:** `packages/NonordinaryCMSpecialValues/design/plan.json:1893–1905` assigns `al-local-frohlich-queyrut` to AL.1 and `sic-character-twist` to SelmerIwasawaCohomology §3.7. Neither slug occurs in the README; §§1.3 and 2.9 instead plan the generic theorems locally.
**Repair:** Add both prescribed “What <Supplier> must provide (gap:<slug>):” contracts, with their hypotheses, under the respective supplier headings. Consume the local epsilon identity in §1.4 and the diagonal twist in §2.7; retain only the CM applications here. Update the ownership list, build paragraph and PR description consistently. This also removes §2.7's dependency on the later local target §2.9.

## R05 (P2) — The Kato objects have two owners

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:12,347,365,382,408,421`: standard inverse theta units, elliptic zeta elements, cohomological realizations and all-prime reciprocity are owned here.
**Claim:** PR #2281 also constructs these same objects and the same general reciprocity law; its asserted distinction from this roadmap is contradicted by this head.
**Witness:** PR #2281, `TauCetiRoadmap/ModularIwasawaMainConjecturesPartII/README.md:327,363,401,444–446`, repeats the constructions. Line 401 calls this roadmap homological; line 444 calls its reciprocity inert-only. Here §2.4 uses `H¹` and §§2.5–2.6 cover every prime.
**Repair:** Keep the common constructions with the earlier owner, NonordinaryCMSpecialValues. Record that boundary in its scope and reconcile #2281 so it imports §§2.2–2.6, deleting its duplicate constructions and stale homological/inert-only distinction; keep #2281's genuinely additional norm relations and main-conjecture results there. Do not add an upward dependency on #2281.

## R06 (P2) — The split-prime Finis theorem is narrowed to the application

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:562,660`: “Only scalar theta functions (Finis's `ν = 0`) occur, which is the weight-one case.”
**Claim:** The general-library requirement excludes restricting the split valuation-prime theorem to the weight needed by Layer 5.
**Witness:** FINIS06 lines 101–113, Theorem 1.1(1), p.769, covers every `k≥1`, type `(-k,k−1)`. At `k=2` its normalizing multiplier is `Ω⁻³(2π/√D)`, while this roadmap supplies only `Ω⁻¹` at `k=1`.
**Repair:** Retain all `k≥1` in the split case, with multiplier `Ω^(1−2k)(k−1)!(2π/√D)^(k−1)W_ℓ(λ)`. Add the higher-weight theta/evaluation comparison used in Finis's proof, pp.794–795. Keep `k=1` for nonsplit valuation primes and for Layer 5's specialization.

## R07 (P2) — The Galois Check needs its base character fixed

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:815`: an order-`25` character is sent to another one “and both central values are `0` (§1.5)”.
**Claim:** Section 6.3 imposes neither the unramified base-character condition nor a positive base root number; order `25` alone does not force either zero.
**Witness:** `K=Q(√−43), p=5`, canonical `φ`, `ω=(1+√−43)/2`, `ρ((1+ω))=ζ₂₅`: the order-25 twists by `ρ,ρ²` give `L≈2.28407815,0.54074421`, each with error below `0.029`, not zero.
**Repair:** Start this Check with “Take `K=Q(√−7)`, `p=5`, canonical `φ`, and `ρ` of order `25` in the `5`-anticyclotomic family.” Its conductor exponent is then `3`, both twisted root numbers are `−1`, and the two asserted zeros follow.

## R08 (P2) — The CM supplier contract overstates its base fields

**Location:** `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md:63–64`: “all-prime factorisation `L(E/H, s)` through `ψ` and `ψ̄`”.
**Claim:** The cited supplier states its all-prime elliptic factorization over the imaginary quadratic field itself and its induction comparison for rational CM elliptic curves, not these general Hilbert-class-field and Hecke-character forms.
**Witness:** PR #1254, `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:670,674`, assumes `A/K` and `A/ℚ`, respectively. For `K=Q(√−23)`, `[H:K]=3`; an attached `E/H` is outside the first stated domain.
**Repair:** State the supplier's actual domains in the contract. Restrict its scalar inert-Frobenius citation to rational CM curves; §3.4 derives the `E/H` case from the general good-prime Tate comparison. Remove the unused general `L(E/H,s)` promise, and cite GL2AutomorphicRepresentationsAndTransfer R17.4.16 for the general character induction in §6.3.

## R09 (P3) — Say explicitly that this adds a new roadmap

**Location:** Pull-request description, opening “This roadmap builds the complex and `p`-adic special-value theory”.
**Claim:** The prose does not identify the change as a new folder rather than a revision of an existing roadmap.
**Witness:** The base contains no `TauCetiRoadmap/NonordinaryCMSpecialValues/`; this head adds three files and 1,062 lines, with no removed headings or declarations.
**Repair:** Begin: “This pull request adds the new NonordinaryCMSpecialValues roadmap: README.md, Suggested.lean and metadata.toml.” Retain the mathematical scope and validation after it.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| §0.1 principal law | Gaussian CM; inert 7 | `φ((7))=−7` | `κ(7)·7=−7` | Matches; inverse gives `−1/7` |
| §0.1 norm relation | Prime value `−1+2i` | `(−1+2i)(−1−2i)=5` | Ideal norm `5` | Matches |
| §0.1 type predicate | Principal `x=5≡1 mod (1+i)³` | `φ((5))=5`; inverse `1/5` | Required `ι(5)=5` | Inverse excluded |
| §0.1 density convention | Cosets `(1+i)^n U`, `n=0,1` | Valuations `0,1` | Different cosets | Infinite index does not imply nondensity |
| §0.2 anticyclotomic predicate | Conjugate values `ζ₅,ζ₅⁻¹` | Product `1` | Required product `1` | Both values `ζ₅` give `ζ₅²≠1` |
| §0.2 conductor/order | `K=Q(√−7)`, orders `1,5,25` | Exponents `0,2,3` | `0,n+1,n+1` | Matches |
| §0.2 class-number boundary | `K=Q(√−31)`, unramified order 3 | Conductor exponent `0` | Unrestricted `n+1` would give `2` | Class-number hypothesis necessary |
| §0.3 conductorModulus | Trivial character; conductor `v²` | Finite parts `1,v²`; infinite parts empty | Prime-to sets: all ideals; exclude `(p)` | Matches |
| §0.3 inversion of modulus | Conductor `f·23²O_K` | Inverse conductor `f·23²O_K` | Same exponents at both split primes | Matches |
| §0.3 eulerFactor | Gaussian curve, inert 7, `s=1` | `(1+7/49)⁻¹=7/8` | Primitive factor `7/8` | Wrong Frobenius sign gives `7/6` |
| §0.3 ramified factor | Character ramified at both primes over 23 | Factors `1,1` | Product `1` | Matches |
| §0.3 HasCentralValue | Two entire continuations of one product | Difference on open half-plane `0` | Difference at `1` also `0` | Arbitrary assignments `0,1` excluded |
| §0.3 Euler deletion | Inert 7 | Deleted polynomial `8/7` | Inverse of factor `7/8` | Nonzero; `v₇=−1` |
| §0.4 integral period | Scale differential by `2`, then `p` | Scalar multipliers `1/2,1/p` | Valuation changes `0,−1` | Only first preserves Néron normalization |
| §0.4 lattice choice | `Q(√−5)`, ideal `(2,1+√−5)` | Norm `2`; no solution `a²+5b²=2` | Principal lattice would require such an element | Conjugate-curve step necessary |
| §0.5 auxiliary prime | `K=Q(√−7), p=5, l=23` | `−7≡4² mod 23`; `23≡3 mod 5` | Split and not `1 mod 5` | Meets the displayed local conditions |
| §0.6 auxiliary family | Exact order 23 | Layer degree `23`; conductor `23²=529` | `r=1`, `m=r+1=2` | Distinct indices retained |
| §0.6 evaluation | Generator of `C₂₃` | `[g]↦ζ₂₃` | Direct value `ζ₂₃` | Inverse `ζ₂₃⁻¹` differs |
| §1.1 odd discriminant | `D=7,11` | Kronecker symbols `+1,−1` | Canonical signs `+1,−1` | Matches |
| §1.1 additive convention | `D=7` | `(−i)i=1` | `i(−i)=1` | Changing only infinity gives `−1` |
| §1.1 even discriminant | `D=8`, trivial class group | Twist ratio `1` in both families | Text says sign depends on class twist | R03 |
| §1.2 auxiliary root number | Odd-order conjugate local characters | Paired factor `ν(−1)=1` | Root-number ratio `1` | Matches |
| §1.3 local Fröhlich–Queyrut | Unramified quadratic, trivial character | Epsilon `1` | `χ(Δ)=1` | Matches; ownership R04 |
| §1.3 ramified quadratic | `χ(√ϖ)=−1`, different exponent 1 | Epsilon `−1` | `χ(Δ)=−1` | Matches |
| §1.3 archimedean | `C/R`, `χ(z)=z/z̄` | `i²=−1` | `χ(i)=−1` | Matches |
| §1.3 negative control | `χ(√ϖ)=i`; scale additive character by `ϖ` | Epsilon multiplied by `−1` | Fixed `χ(Δ)=i` | Triviality on base field necessary |
| §1.4 conductor parity | `c=0,2,3` | Root-number ratios `1,1,−1` | `(-1)^c=1,1,−1` | Includes unramified class characters |
| §1.5 forced zero | Sign `−1` | `Λ(1)=−Λ(1)` | `2Λ(1)=0`, hence `L(1)=0` | No converse for sign `+1` |
| §2.1 theta divisor | `a=(5)` on `C/Z[i]` | Orders `24` at zero, `−1` at 24 other points | Degree `24−24=0` | Constant function excluded |
| §2.1 isogeny norm | Norm along `[5]` | Pushed divisor `25[0]−25[0]=0` | Target divisor nonzero | Kernel condition necessary |
| §2.1 scalar uniqueness | Scalar `ζ`; norms `[2]`, `[3]` | Conditions `ζ³=ζ⁸=1` | `gcd(3,8)=1`, hence `ζ=1` | Rescaled wrong model excluded |
| §2.2 canonical pair | `Q(i)`, moduli `(3),(2)` | Unit images have orders `4,2` | Injectivity requires order `4` | First admissible; second excluded |
| §2.2 Artin direction | `f=(3)`, principal `λ=4` | `4·(3/4)=3`, `4≡1 mod 3` | Original lattice and marked point | Division by 4 fails |
| §2.2 logarithmic formula | `f=(3), a=(5), χ=1` | `−6.591673732009=−6 log 3` | `24·(−log 3/2)=−12 log 3` | R01: multiply left side by 2 |
| §2.3 cofinal tail | `Q(i), p=2, f=1` | Unit images modulo 2,4: orders `2,4` | First admissible level `n₀=2` | Avoids undefined small-level evaluation |
| §2.3 smoothing | `a=(5)`, trivial group specialization | `N(a)−1=24` | Localized relation `24z=u_a` | Does not assert division is integral at 3 |
| §2.4 realization | `L=K`, `r=1` | Rank over `K`: `1`; over `Q`: `2` | Cohomological CM component | Same object as #2281; R05 |
| §2.4 dual and twist | Inert 7 | Dual `−1/7`; twist `49(−1/7)=−7` | `N(a)/φ(a)=49/(−7)=−7` | Matches |
| §2.4 descent action | `r=2`, principal 9, modulus 8 | Pullback `81`, character inverse `1/81` | Identity action `1` | Missing inverse gives `81` |
| §2.4 filtration | `r=1`, underlying CM H¹ | `dim Fil⁰=2`, `dim Fil¹=1` | Differential line dimension `1` | Fil⁰ is not the stated line |
| §2.5 translation | `ξ₁=8`, `ν₁=7` | Minus translation `8−7=1` | Marked point `α₁=1` | Plus translation gives `15` |
| §2.5 basis normalization | `p=2,m=2,r=1` | `(p^mβ)⁻¹=(1/4)β⁻¹` | Coefficient `p^(−mr)=1/4` | Matches |
| §2.5 good reduction | `Q(i),p=2,g=(4)`, inertia idele `i` | Ray action `1`; H¹ action `−i` | Good reduction would require H¹ action `1` | R02 |
| §2.5 repaired level | Same field, `g=(20)` | Global unit `i` is not `1 mod 5` | Prime-to-2 unit kernel `{1}` | Removes this inertia obstruction |
| §2.6 reciprocity normalization | `r=1,a=(5),χ=1` | Smoothing `25−5=20` | `N(a)−ψ(a)χ(a)⁻¹=20` | Common all-prime target; R02, R05 |
| §2.7 integral component | `α≡2 mod 5` | `α(ᾱ−1)≡2` | Unit in residue field | `α≡1` gives `0`, not a unit |
| §2.7 period normalization | Replace `Ω` by `−Ω` | `γ↦−γ`, `z↦−z` | Rationalized class also negated | Matches |
| §2.8 direct reciprocity | Trivial character, inert 5 | Deleted value `(6/5)A_f` | Reciprocal primitive factor `6/5` | Factor at p retained |
| §2.8 character weight | `χ(σ)=ζ₂₅` | Weight `ζ₂₅` | Direct coefficient `ζ₂₅` | Inverse coefficient differs |
| §2.9 twist | Rank zero; trivial rank one | `0→0`; identity on norm limit | `0`; same norm limit | Matches; supplier ownership R04 |
| §2.9 diagonal action | `φ(g)=−1` | `g(x⊗t)=−g(x)⊗t` | Coefficient action contributes `−1` | Omitting coefficient action fails |
| §2.10 simultaneous scaling | `(ω,Ω)↦(2ω,2Ω)` | Scalar `A/2`; differential `2ω` | Product `Aω`; class unchanged | Matches |
| §3.1 torsion/ring-class levels | `p=5,n=0,l=23,r=1` | Torsion degree `24`; ring-class conductor `529` | `(p²−1)p⁰=24`; `l^(r+1)=529` | Neither initial index is collapsed |
| §3.2 disjointness | `p=47,l=23` | `p²−1=2208=96·23` | Intersection still `H` by ramification | Coprime-degree shortcut unavailable |
| §3.3 semilocal splitting | `K=Q(√−23),p=5,h=3` | Class of `(5)` is `1`; three local factors | `H⊗K_p≅Φ³` | One-factor replacement loses two factors |
| §3.4 inert Frobenius | `p=5` | Trace `−10`; determinant `25` | `(X+5)²`; point count `36` over F₂₅ | Matches |
| §3.5 Honda/torsion comparison | `p=5,n=0,1` | Parameter `−5`; degrees `24,600` | `(25−1)25^n` | Matches supplier sign |
| §3.5 Tate generators | `w_n=(-1)^n v_n`, `n=0,1` | `p w₁=−p v₁=v₀=w₀` | Required p-transition | Unchanged π-generator gives `−w₀` |
| §4.1 local invariants | Unramified inert character | `μ_ℓ=0`; local sign `1` | Definition; `(-1)^0=1` | Matches |
| §4.1 nonunit correction | Unit-character image `μ₅`, valuation at 5 | Minimum `v₅(ζ₅−1)=1/4` | Ramified local `μ₅=1/4` | Detects nontrivial correction |
| §4.2 theta spaces | `K=Q(√−7),r=25,a=O_K,b=(1/5)O_K` | Dimensions `175,7`; primitive `168` | `25·7`, `25·7/25`, difference `168` | Matches |
| §4.2 translation operator | `r=1,l=1∈O_K`, `D=7` | `A₁ϑ=−ϑ` | `ψ(1)=(-1)^7=−1` | Constant function fails theta law |
| §4.2 Heisenberg phase | `l₁=1/7,l₂=√−7/7,r=1` | Trace in exponent `2/7` | Phase `exp(2πi/7)` | Nontrivial multiplier retained |
| §4.2 trace/adjoint | Index 25, unit-norm `h` | `⟨ih,ih⟩=1`; `⟨h,t_b ih⟩=25` | Adjoint `t_b/25` | Corrects printed Finis normalization |
| §4.2 eigencharacters | Sign `−1`; admissible sign `+1` | Multiplicities `0,1` | Forbidden sign; multiplicity-one condition | Matches |
| §4.2 Yang normalization | `K=Q(√−7)`; scale functional by 5 | Constant `√7/π`; ratio multiplied by `25` | `4√7/(4π)`; square scaling | Detects arbitrary functional rescaling |
| §4.3 integral normalization | Replace normalized `ϑ` by `ℓϑ` | Functional valuation rises `1`; pairing rises `2` | Integral but no longer normalized | Matches |
| §4.3 dagger | Apply twice | `conj(conj(ϑ(w)))=ϑ(w)` | Identity | Involution direction matches |
| §4.3 discriminant factors | `v_ℓ(D)=1` | `−1/2+1/4+1/4=0` | No remaining discriminant valuation | Numerator √D would leave `1` |
| §4.3 pairing denominator | Pairing valuation `3/4`, product valuation `1` | `−3/4+1=1/4` | Formula (15): `1/4` | Wrong numerator gives `7/4` |
| §4.3 valuation identity | `μ=b=0`, functional valuation `0,1` | Normalized-value valuations `0,2` | `0+0+2v=0,2` | Normalization and square both matter |
| §4.4 torsion stabilizer | Point; diagonal elliptic curve in `E²` | Stabilizer dimensions `0,1` | Translate of point; relation `x₁−x₂=0` | Boundary cases match |
| §4.5 theta nonvanishing | Unit representative, then multiply by ℓ | Functional valuations `0,1` | Existence of representative with valuation `0` | Does not quantify over every representative |
| §4.6 Finis headline | Split ℓ, weights `k=1,2` | Normalizers `Ω⁻¹`, `Ω⁻³(2π/√D)` | README supplies first only | R06 |
| §5.1 Finis character | Inert 5, `ν` unramified there | `λ((5))=−5/25=−1/5` | Norm twist shifts `L(0,λ)` to `L(1,φ̄ν)` | Matches |
| §5.2 canonical corrections | Canonical conductor supported at ramified primes | Every inert local `μ=0`; unramified `b_p=0` | Correction sum `0` | Matches |
| §5.3 omitted factors | Nontrivial order-23 twist; inert 5 | Two 23-factors `1`; 5-deletion `6/5` | No l-correction; p-valuation `−1` | Matches |
| §5.4 BKO unit headline | Canonical family, outside Finis exceptions | `v₅(D^(1/4))=0`; correction sum `0` | `v₅(A_ν)=0` | Correct specialization of valuation identity |
| §5.5 nontrivial unit witness | Orders `23,23²` | Primitive-character counts `22,506` | `22·23^(r−1)` | Unbounded counts escape any finite exception set |
| §5.6 unramified coefficients | `X²−2` over Q₅ | No root mod 5; derivative nonzero | Unramified degree `2` | Prime-to-p root argument matches |
| §5.6 class-number boundary | Fifth root of 6 | Shifted polynomial constant `−5`, other coefficients divisible by 5 | Eisenstein; ramification degree `5` | Prime-to-p exponent necessary |
| §5.7 scalar/tensor kernel | `p=5,n=0,U=Φ(ζ₂₃)` | Degrees `24,11`; tensor degree `264` | `24·11=264`, injective multiplication | Matches |
| §5.7 ramified negative control | `U=F≠Φ`, `a∉Φ` | Nonzero `a⊗1−1⊗a` maps to `0` | Claimed injection would fail | Ramified coefficient extension excluded |
| §6.1 count definition | `P={5},α=5,β=0,t=1`, `q=5,25` | Counts `6,0` | Six `(u,±1)`; then no allowed v | Matches |
| §6.1 empty set | `P=∅,q=1,t=1` | Count `9` | Nine lattice points | Eventual theorem vacuous for `Q=2` |
| §6.1 zero modulus | Nonempty P, `q=0` | Membership in zero ideal plus nonzero: count `0` | No admissible pair | Total-function boundary harmless |
| §6.1 vanishing headline | `α=1,β=0`, p-power q, `c<1/2` | Nonzero multiple of q has magnitude at least q | Box bound `q^c<q` | Count `0` eventually |
| §6.1 power-saving headline | `d=11/20,s=7/16`, same rational direction | `5d/2−1=3/8`; eventual count `0` | `3/8<7/16<1/2`; `q^s>0` | Matches, not a proof of algebraic-direction case |
| §6.2 average headline | `K=Q(√−7),R={5,7}` | `2L(1,κ)(1+1/5)=12L(1,κ)/5` | Fixed-support limit | Conductor Euler deletion retained |
| §6.2 error exponents | `r=7/16,a=15/16` | `r−a/2=−1/32` | Negative exponent | Middle term decays |
| §6.3 Galois stability | Zero algebraic normalized coordinate | `σ(0)=0` | Conjugate coordinate `0` | Matches theorem |
| §6.3 displayed Check | Canonical `φ` over Q(√−43), `p=5`, `ρ((1+ω))=ζ₂₅` | Central values `2.28407815,0.54074421`, error `<0.029` each | Check asserts `0,0` | R07 |
| §6.3 character witness | `ω²−ω+11=0` modulo 125 | `(1+ω)/(1+ω̄)=105+106ω`, order `150` | Sending it to ζ₂₅ gives conductor `125`, order `25` | Confirms the finite character used above |
| §6.3 numerical tail | Exponential sum through norm 10000; analytic conductor square root 5375 | `4 exp(−2π·10001/5375)/(1−exp(−2π/5375))=0.028659` | Bound from `#ideals(n)≤d(n)≤2√n` | Both values remain positive |
| §6.4 nonvanishing headline | Hypothetical unbounded orbit of zero values | Every Galois average `0` | Limit `12L(1,κ)/5>0` | Contradiction gives finite exceptions |
| §6.5 parity headline | Canonical K=Q(√−7), orders `1,5,25,125` | Conductors `0,2,3,4`; signs `+,+,−,+` | Forced value `0` at conductor 3 | Matches; sign-positive claim is eventual |
| §6.5 small prime | `K=Q(√−7),p=3` | `−7≡2 mod 3`, nonsquare | Inert odd prime | No p≥5 hypothesis in Lean |
| §6.5 uniqueness of sign | Replace ε by −ε | Infinitely many forced zeros enter finite exceptional set | Required finite cardinality | Wrong sign excluded |
| CM supplier contract | `K=Q(√−23)` | Hilbert-class-field degree `3` | Cited factorization uses base K | R08 |
| Ownership of two gaps | Plan versus README | Two supplier allocations; zero gap slugs in README | One owner per generic result | R04 |
| Kato ownership | This PR and #2281 | Two constructions of the same H¹ realization | One earlier owner | R05 |
| PR change description | Base versus head | `0→3` folder files; `+1062` lines | Prose omits explicit addition status | R09 |

- Sources: all 15 seeded targets inspected at their locators; 0 README locators marked unverified; 11 source texts read, with primary-text limits below.
- Pins: 15 declarations opened: `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80`, `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85,181,254`, `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:155,200`, `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111`, `Mathlib/NumberTheory/NumberField/CMField.lean:70,142,154`, `Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250`, `Mathlib/RingTheory/LinearDisjoint.lean:233`, `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412`.
- Near-matches: 10 declaration searches reviewed; `Mathlib/NumberTheory/MulChar/Lemmas.lean:73` needs finite unit group and does not prove the Hecke anticyclotomic predicate; no pinned headline duplicate found.
- Suppliers: 20 named supplier roadmaps resolved against main/open heads; scope discrepancies and ownership conflicts are R04, R05 and R08; no dropped-id or second-copy overlap found.
- Gate: all worker checks pass, including the targeted module build; independent dependency output: `depcheck: 239 roadmaps, 2172 edges, 0 problem(s)`.
- Lean: direct elaboration succeeds with exactly 3 `sorry` warnings; 11 actual declaration signatures checked, 0 lost binders; all 3 theorem probes fail `simp`, `rfl` and `infer_instance`, and no single matching library theorem was found.
- Headlines: 3 statable theorem signatures present; the module docstring names the remaining root-number, reciprocity, tower, Finis, BKO-unit and Galois-average headlines and their missing carriers.
- Scope/form: 44 numbered target sections and 7 layer endings inspected; 0 outside-folder changes, sorry-data declarations, forbidden imports or `set_option` overrides.

Overlap check: read ModularIwasawaMainConjecturesPartII, KatoEulerSystems, AnticyclotomicLocalUnits, ComplexMultiplicationAndExplicitReciprocity, HeegnerPointEulerSystems, LFunctions and GlobalNumberFields; Kato CM units/realizations/reciprocity belong to NonordinaryCMSpecialValues (R05), modular Siegel classes to KatoEulerSystems/PadicFamilies, signed local units to AnticyclotomicLocalUnits, generic CM characters/periods to ComplexMultiplicationAndExplicitReciprocity, Heegner classes to HeegnerPointEulerSystems, continued algebraic Hecke L-functions to LFunctions, and native Hecke carriers to GlobalNumberFields/Tau Ceti.

Source independence: 24 passages compared with 11 sources; no borrowed prose or reused tables found. Largest share FINIS06, 32 of 103 named source-citation groups before References. Its contents were compared: the roadmap's seven layers do not reproduce its section sequence; the internal theta → integral pairing → nonvanishing → divisibility order is forced by §§4.3, 4.5 and 4.6's Needs lines.

## Not verifiable

- KATO99, Theorem 4.3.1: the sources service's author/title lookup returned no legal full text; KATO04's applied proof, lines 5478–5518, was read instead.
- BOXALL92, Théorème 1: primary text remains waived; the stated application was inspected in FINIS06 lines 1571–1602, not independently certified from Boxall.
- QUEYRUT74 lines 86–97 record the local formula in the finite-order global setting; the full general local proof was not available there. The three local normalization examples were checked against AL.1.

## Source issues

- **Error** in KATO04 at (15.4.2), p.252: the source states isogeny norm compatibility without restricting the kernel; it should require the isogeny kernel to meet the smoothing torsion trivially; affects a stated result.
- **Error** in KATO04 at (15.5.1), p.253: the displayed logarithmic formula uses the coefficient appropriate to squared complex absolute value without specifying that convention; it should use squared absolute values or multiply ordinary logarithms by two; affects a stated result.
- **Error** in KATO04 at proof of Proposition 15.9, p.258: the source infers everywhere good reduction from containment of the character conductor in the ray level; it should arrange sufficient prime-to-place level before invoking Néron–Ogg–Shafarevich and descend afterward; affects the proof.
- **Misprint** in KATO04 at proof of Proposition 15.9, p.258: the translated theta function uses plus its displacement while the next evaluation requires subtraction; it should use the negative displacement; affects the proof.
- **Misprint** in BKO21 at §3.0.2, p.952: the same exponent labels character order, field layer and conductor; it should distinguish order l^r and layer r from conductor l^(r+1) for nontrivial characters; affects a stated result.
- **Error** in BKO21 at Lemma 5.1(ii), p.956: trace 2sp is paired with Lubin–Tate parameter −sp; it should pair trace 2sp with parameter sp and Honda type p−sT²; affects a stated result.
- **Error** in FINIS06 at the trace operator after (5), p.772: the unnormalized trace is called the adjoint of inclusion for normalized scalar products; it should be divided by the lattice index; affects a stated result.
- **Misprint** in JIA24 at the rational-principal law before (2.1), p.4: the source uses κ(n)n⁻¹; it should use κ(n)n; affects a stated result.
- **Misprint** in JIA24 at (2.43), p.10: the upper bound has a growing exponential; it should have exp(−N(a)/(Af)); affects the proof.
- **Misprint** in JIA24 at §4, definition of M(q,t), p.18: the congruence is modulo Z_p; it should be modulo qZ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), p.20: the box is bounded by q⁻¹; it should be bounded by q^c; affects the proof.

## For the human reviewers

- The primary BOXALL92 text is waived, and KATO99 was unavailable through the sources service; their original proofs were not independently read. The cited applications were checked in FINIS06 and KATO04, respectively.
