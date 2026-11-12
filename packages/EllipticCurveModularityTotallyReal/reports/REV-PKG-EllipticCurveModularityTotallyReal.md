<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6789774704 -->
Review (claude) of 00dea6a

Verdict: needs_changes

1. **F01** (P3) §1.4 defines the descended system without an API block

   - **Location:** `packages/EllipticCurveModularityTotallyReal/README.md` lines 655–661: "Then
     assemble the **descended system** `W_θ`: the shared raw carrier of
     SmallRamificationAndAbelianVarietyBaseCases §5.0d over L in rank two …".
   - **Claim:** §1.4 introduces a definition (the packaged compatible system) and gives it Checks.
   - **Witness:** §§1.1, 1.2, 1.3 and 1.5 each carry `**API.**` and `**Checks.**`; §1.4 goes from
     the locator and `*Needs:*` (lines 673–680) straight to `**Checks.**` (line 682). The API facts
     exist only scattered in §§1.3 and 1.5.
   - **Repair:** insert before `**Checks.**` of §1.4:

     > **API.**
     >
     > - The member of `W_θ` at the place λ of `M₀` induced by `j_ℓ` is `W_{θ,ℓ}`; two embeddings
     >   inducing the same λ give members that differ by the corresponding automorphism of `ℚ̄_ℓ` over
     >   `M_{0,λ}`.
     > - Restricted to `G_M`, the system is `characterSystem θ` of
     >   EllipticCurveModularityImaginaryQuadratic §4.1 at t over `F = M`, through `φ^*`, with the same
     >   bad set above S, the same polynomials at places of M and the same Hodge multisets.
     > - `w′^*` is an isomorphism of systems `W_θ ≅ W_{θ⁻¹}`; in particular `P_{θ,v} = P_{θ⁻¹,v}`.
     > - For a finite extension `L′/L` the restriction of `W_θ` to `G_{L′}` is the system built from
     >   `C^δ_n ⊗_L L′`, with polynomial at `v′|v` the one whose roots are the `f(v′|v)`-th powers of
     >   the roots of `P_{θ,v}`.
     > - The pairing `[,]_θ` identifies `W_θ^∨` with `W_θ ⊗ ε_ℓ`, member by member.

     Tested on the instance: with this block every bold definition of Layer 1 (§§1.1–1.5) has API
     and at least three Checks; each bullet is a consequence of §1.2(2), §1.2(5), §1.3 API or the
     pairing paragraph of §1.4 (third bullet: `w′` is L-rational, so `w′^*` commutes with `G_L` and
     carries the θ- to the θ⁻¹-eigenspace).

2. **F02** (P3) §3.1, first Check: the `(p,3)` clause states the wrong failure condition

   - **Location:** README lines 1080–1082: "for `(p,3)` a failure would put λ of order p > 100 in
     `𝔽_{3^a}` with `a ≤ 4`, whose unit groups have order at most 80."
   - **Claim:** the sentence continues "the coefficient `c(λ) = 2 − λ − λ⁻¹` … nonzero modulo 5", so
     "failure" reads as `c(λ) ≡ 0` modulo 3.
   - **Witness:** `c(λ) = −(λ−1)²/λ` vanishes in characteristic 3 exactly when `λ̄ = 1`, which no
     degree bound enters (λ̄ has order p ≠ 3). The `𝔽_{3^a}`, `a ≤ 4` argument is the regular-word
     condition `c² ≠ ±4` of EllipticCurveModularityImaginaryQuadratic §7.1 (its lines on
     `character_regular_word`; OpenAI26 line 911), used there for decomposed genericity, which this
     roadmap does not use.
   - **Repair:** replace the clause by: "for `(p,3)`, `c(λ) = −(λ−1)²/λ` vanishes modulo 3 only if
     the reduction of λ is 1, impossible for λ of order p ≠ 3. The bound `p > 100` is a hypothesis of
     §7.4 there, where it serves the regular word (`c² ≠ ±4` in `𝔽_{3^a}`, `a ≤ 4`, unit groups of
     order at most 80); irreducibility alone needs only `p ≠ 3`." Tested: p = 101, λ̄ of order 101
     in `𝔽̄₃`, `λ̄ ≠ 1`, so `c ≠ 0`; p = 7 (below the bound): `λ̄ ≠ 1` and `c ≠ 0` still, confirming that
     the bound is not what makes `c` nonzero.

3. **F03** (P3) LeHung26 §3.3 is on p.6, not pp.6–7

   - **Location:** README line 1071: "([LeHung26](#references), §3.3, pp.6–7, LeHung26 lines
     250–260"; and References, lines 1369–1370: "§3.1 Proposition 3.1, §3.2 Lemma 3.2 with (9)–(11),
     §3.3, pp.6–7".
   - **Witness:** LeHung26 lines 226 and 262 are the markers of pages 6 and 7; lines 229–260 (§§3.1,
     3.2, 3.3) lie between them. The manifest already says "Proposition 3.1, Lemma 3.2 with (9)-(11)
     and Section 3.3 p.6".
   - **Repair:** line 1071: "§3.3, p.6, LeHung26 lines 250–260"; References: "§3.1 Proposition 3.1,
     §3.2 Lemma 3.2 with (9)–(11) and §3.3, p.6; §3.4, p.7".

4. **F04** (P3) §4.3 reuses θ and ψ for different objects

   - **Location:** README lines 1236–1238: "`H¹(E)|G_{KT} = ψ_ι ⊕ ψ^c_ι` for an algebraic Hecke
     character θ of KT with `ψ_ι = r_{ℓ,ι}(θ)` and `ψ ≠ ψ^c`", and the uses of θ, ψ through line 1257
     (`AI_{KT/K}(θ)`, `θ(v) ∈ T`, `Ind ψ`).
   - **Witness:** Conventions, lines 151–153, fix θ as a character `μ_n → M₀^×`; §1.5 line 703 fixes
     ψ as the character of order p, and `W_θ`, `W_ψ` are used through Layer 3. In §4.3 "`θ(v)`" and
     "`W_θ`" mean unrelated things two pages apart; the §4.3 Check line 1275 uses ψ a third way, for
     the number `−1 ± 2i`.
   - **Repair:** in §4.3 (and nowhere else) rename the Hecke character to `ϕ` and the two Galois
     characters to `ϕ_ι` and `ϕ^c_ι`: "`H¹(E)|G_{KT} = ϕ_ι ⊕ ϕ^c_ι` for an algebraic Hecke character
     ϕ of KT with `ϕ_ι = r_{ℓ,ι}(ϕ)` and `ϕ_ι ≠ ϕ^c_ι`. Then `H¹(E) ≅ Ind_{G_{KT}}^{G_K} ϕ_ι`, and
     `π_E = AI_{KT/K}(ϕ)` …"; likewise "`ϕ(v) ∈ T`", "`AI(ϕ)`", "`Ind ϕ_ι`", and in the Check
     "`a₅ = −2 = ϕ(𝔭) + ϕ(𝔭̄)` with `ϕ(𝔭) = −1 ± 2i` of norm 5". Tested: after the change θ and ψ
     occur in the README only as characters of `μ_n`.

Four findings, all P3 (none blocking): one missing API block, one muddled Check, one page locator,
one notation collision. No principle is violated, the mathematics survived the adversarial pass,
`Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check is clean.
There is no previous review of this package.

## Verified sound

**Principles.** No route-specific shortcut (Layer 1 is over an arbitrary number field and odd n;
§2.2 for any abelian variety and idempotent; §2.3 for any number field; §4.3 for every CM curve).
Nothing re-planned: the covers, lattices, congruences, specialization and fixed-pairing twists are
imported from EllipticCurveModularityImaginaryQuadratic by section and name; §§2.1, 4.2, 4.3 are
kept variants with the difference stated. No copied passage, no algorithm, no sorry'd data, no
`set_option`. The layer order (descent, lifting tools, lifts, endpoint) is forced by the
`*Needs:*` lines; no layer is named after a source chapter.

**Elaboration.** `lake env lean` on `packages/EllipticCurveModularityTotallyReal/Suggested.lean`
from the content checkout: two warnings, both "declaration uses `sorry`" (lines 58 and 80), no
error. Imports: `import Mathlib` and three `TauCeti.*` modules, each declaring a carrier used. The
two elaborated types (`#check @…`) keep every binder (`IsTotallyReal k`, `IsCyclotomicExtension
{n} k M`, `2 < n`, `IsPrimitiveRoot ζ n`; `NumberField K`, `W.IsElliptic`, `DecidableEq`) and agree
with README §1.1 item 4 and §2.3. Nothing changed.

**Padding probe.** Both theorems tried on a scratch copy with `simp`, `rfl`, `infer_instance`,
`exact?`, `aesop`, `constructor <;> simp`, `decide`: none closes either (14 failures). Neither
restates a definition or mirrors a Check.

**Headline theorems.** From the Summary and Scope: (1) totally real modularity theorem §4.4;
(2) all-place comparison §4.2; (3) non-CM descent §4.1; (4) CM induction §4.3; (5) change of prime
§2.1; (6) summand lifting §2.2; (7) seeds §§2.4–2.5; (8) reflection descent §§1.2–1.6; (9) the
lifts §§3.1–3.3; (10) real cyclotomic field statement §1.1; (11) the 3–5 switch §2.3. (10) and
(11) are stated. (1)–(9) are named in the module docstring with the missing carrier; confirmed at
the pins: no automorphic representation of `GL₂` over a number field, no Weil–Deligne
representation and no étale cohomology of curves in the pinned Mathlib or Tau Ceti (only
`CuspForm` for classical forms, `Mathlib/NumberTheory/ModularForms/Basic.lean:86`).

**Library declarations opened at the pins** (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, as in the
manifest of the content checkout): `NumberField.IsCMField` (`CMField.lean:70`),
`CMExtension.eq_maximalRealSubfield` (`:456`), `IsCMField.ofCMExtension` (`:510`),
`IsCyclotomicExtension.Rat.isCMField` (`:564`, base ℚ only, so the relative statement is new);
`IsTotallyReal` (`TotallyRealComplex.lean:48`), `IsTotallyComplex` (`:210`), `maximalRealSubfield` (`:126`),
`IsTotallyReal.le_maximalRealSubfield` (`:140`), `isTotallyReal_maximalRealSubfield` (`:157`);
`WeierstrassCurve.j` = `Δ'⁻¹ * c₄ ^ 3` (`Weierstrass.lean:388`); `Module.Basis.equivFun`
(`Basis/Defs.lean:222`). Tau Ceti: `torsionGaloisAction` (`Affine/Point/Galois.lean:77`),
`weilPairing` (`WeilPairing/Basic.lean:225`, valued in `Additive (rootsOfUnity N F)`, the same
type for W and W′), `weilPairing_torsionGaloisAction` (`WeilPairing/Galois.lean:104`),
`pointTorsionModule` (`Torsion/Structure.lean:51`), `nonempty_basis_torsionBy` (`:149`),
`det_tateModuleGaloisRepresentation` (`TateModule/Determinant.lean:52`), `quadraticTwistOf`
(`QuadraticTwist/Basic.lean:164`), `quadraticTwist` (`:469`), `quadraticTwistPointEquiv` (`:824`),
`quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` (`:945`),
`Hom.pullbackDifferential` (`Hom/Differential.lean:79`) with `_comp` and
`_add_invariantDifferential`. All 33 cited names exist (19 Mathlib, 14 Tau Ceti). The three "Lean names found nowhere" leads
(`GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep`) are
README names of ArithmeticGaloisRepresentations §§4.1, 5.3, 6.1 and are cited as such: no finding.

**Cross-roadmap citations resolved** (at main or the open head): 
EllipticCurveModularityImaginaryQuadratic §§0.2, 0.3, 1.1, 1.3, 3.1, 4.1–4.4, 5.1, 7.1, 7.4, 8.1,
8.5, 8.6 with all 20 named targets, each stated there for an arbitrary number field as the README
says (§4.1 "No CM hypothesis on k or E is used"; §7.4 "an arbitrary number field k", prime as in
§7.2: `p > max{100, 2d+1}` outside the exceptional set over the normal closure);
AutomorphicGaloisRepresentations §§3.10, 3.13, 3.14, 4.4, 4.7;
AutomorphicGaloisRepresentationsPartII AG2.0 `IsAttached`, AG2.P "Independent classical and
Hilbert members"; PotentialAutomorphyInfrastructure §2.3 `soluble_base_change_and_descent` (2)
(hypotheses as quoted); GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.3.2, R16.3.5,
R16.3.6, R16.4.4, R16.6.3–4, R17.4.16, R17.5.14 (parallel weight one; weight-two lifts "separate
inputs"); ArithmeticGaloisRepresentations Layers 1–3, §§4.1, 5.3, 6.1, 6.2;
InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.7; ModularCurvesPartII §4.10
`fixedPairingGeometricConnectedness`; SmallRamificationAndAbelianVarietyBaseCases §5.0d (raw
carrier, arbitrary F and rank); PotentialModularityAndCompatibleSystems §§1.1, 1.6;
AbelianSchemesAndArithmeticModuli A4.1, A6, A6.11; NeronModelsAndSemistableAbelianVarieties
§§3.10, 5.1, 5.3, 5.6, 6.10; FaltingsFinitenessAndIsogenyTheorems R28.4; ShimuraVarieties §5.3;
EtaleCohomologyFoundations §0.11; GL2ModularityLifting §§5.7, 5.10; 
ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1 (both named paragraphs), 4.2; ModularCurves
§0E, Layers 3, 5B; EllipticCurves Layers 0.5, 1, 4, 4.5a, 5; JacobianChallenge Layers D–F;
HilbertModularForms §11.3. No drift.

**Supplier order.** Output of the dependency check:

    depcheck: 236 roadmaps, 2152 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. No roadmap of the never-cite list is cited. Downstream roadmaps
(HilbertModularForms, ModularityAndLanglandsExtensions and Part II,
EllipticCurveModularityImaginaryQuadraticPartII) appear only under Downstream consumers; the last
two Part II roadmaps are board packages.

**Declared gaps** (three; same slugs in `design/plan.json` and under Exact supplier contracts, each
in the supplier's subsection in the prescribed form, each with a named supplier):
`totally-real-weight-two-lifting` — not provided: GL2ModularityLifting Layer 5 (§§5.1–5.18) has
only potentially Barsotti–Tate or rational-field statements and its Layer 8 needs p completely
split; `totally-real-solvable-residual-cohomological-weight` — R17.5.14 gives weight one only;
`cm-elliptic-endomorphism-field` — AbelianSchemesAndArithmeticModuli A6.20 (definition over the
n-torsion field) is a different statement, and CMRankZeroConverse's `gap:cube-sum-full-cm` on the
same supplier is the case j = 0. Each is precise and minimal. The acceptance of a later round
would be conditional on these three.

**Duplication and ownership.** Searched by object in main and the open heads: the FLHS switch and
seeds (only bibliography uses in EllipticCurveModularityPartIIGL2TypeAbelianVarieties and
HilbertModularForms), the reflection twist, the real cyclotomic subfield of a relative cyclotomic
extension, modularity over totally real fields: no other owner. `scratch/overlaps.md`: no pull
request changes this roadmap, no cited id is dropped, none defined only by a revision. The name
`TauCetiRoadmap.EllipticCurveModularityTotallyReal.*` is declared nowhere else.
`SymplecticTorsionEquiv` is owned by EllipticCurveModularityImaginaryQuadratic and is written out,
not redeclared.

**Source sample.** Every locator of the fifteen sampled sections was opened, line by line:
LeHung26 lines 86, 136–138, 221–224, 231, 234, 237–249, 250–260, 264–271, 357–366; OpenAI26 lines
480, 521, 547, 571, 990, 1200–1215 (pages 12, 13, 13, 14, 23, 27–28); FLHS15 lines 66–77, 87, 116,
127, 221–265, 343, 355, 404, 411, 421, 426–452; BD14 lines 2144–2146, 2171 (pp.36–37); BLGG12 lines
2024, 2198 (pp.41, 45); BLGG13II lines 82, 129–145, 149; Kisin09 line 3976 (printed p.1170); SW99
Theorems A and B (printed pp.74–75); BCDT01 line 15. All support the statements as written, with
R03 the one slip. All nine cited works are in the manifest; no locator is flagged unverified.

**Adversarial table** (values computed here).

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.1 / `realCyclotomic_isCMField` | k=ℚ: n=3, 4, 6, 9, 15; k=ℚ(√2), n=8; k=ℚ(√5), n=5; non-real k=ℚ(i), ℚ(√−3) | L=ℚ, ℚ, ℚ, cubic (`x³−3x+1`: `2cos3θ=−1`), degree 4 ∋ √5; `ζ₈+ζ₈⁻¹=√2`, L=k; `(−1+√5)/2`, L=k; ℚ(i): max real of ℚ(ζ₁₂) is ℚ(√3) ≠ L; ℚ(√−3): M=L | true for k totally real, n>2; hypotheses needed, both in the signature |
| §1.1 `L(μ_ℓ)=M` | ℓ odd, k totally real | `ζ_ℓ` nonreal, L real, `[M:L]=2` | true |
| §1.2(2) descent identity | `R=[[0,−1],[1,−1]]`, `W=[[0,1],[1,0]]` | `R²=[[−1,1],[−1,0]]`, `R³=I`, `WRW=R²=R⁻¹` | `ᵍu′=u′` |
| Twist rule on `H¹` | `y²=x³+1`, `y²=2x³+1`, `φ=(bx,y)` | `a_g=(ζ₃⁻¹x,y)`; `φ^*ω=bω′`; action `ζ₃ω`; `(a_g⁻¹)^*ω=ζ₃ω`, `a_g^*ω=ζ₃⁻¹ω` | inverse cocycle confirmed |
| §1.2 genus | n=5 forced cubic; n=15, m=3 | valuations `±1, ∓5`: 4 branch points, `2g−2=8`, g=5; `∓15`: 2 branch points, g=3 | Check correct; genus m in general (`2g−2=2(m−1)`) |
| §1.3 ranks | n=3; induction | `6=2+2+2`; `Ind=W_θ⊗(1⊕δ)`, rank 4 | true |
| §1.4 pairing, determinant | `[y,x]=⟨y,w^*x⟩=⟨w^*y,x⟩=−[x,y]` | alternating, values in `ℚ̄_ℓ(−1)`; `det=ε⁻¹`; `ε⁻¹(c)=−1`; geometric Frobenius constant term `q_v` | true |
| §1.5 chain | n=3p: mod p `ψ̄=1`; mod 3 `η̄=1` | `χ̄=η̄` (p), `χ̄=ψ̄` (3), `ψ̄=1` (p), `η̄=1` (3) | four congruences as stated |
| §1.5 accidental congruence | `k′=k(μ₁₅,J[3])` | `H¹(𝔽₃)=J[3]⊗μ₃⁻¹` trivial | Check correct |
| §1.6 | `H¹(C^δ_3)^{w′}` | `0+2`; degrees 15, p, 3 | true |
| Quadratic twist sign | `y²=x³−x+1` over 𝔽₅ and twist `y²=3(…)` | 8 points, `a=−2`; 4 points, `a=2`; `(2/5)=−1` | correct |
| Normalisation | 11a1 at 3 | `X²+X+3`; `L(s−1/2)`: `1+3^{−s}+3^{1−2s}`; `L(s+1/2)`: `1+3^{−s−1}+3^{−2s−1}`; `π⊗|det|` type `(2,−2)` (supplier §3.10: `|det|⁻¹` gives `(k,w+2)`) | correct |
| §2.2 five-adic control | `a²=3` in 𝔽₂₅, `B=[[0,2],[1,0]]`, `C=aB` | `B²=2I`, `C²=6I=I`, `det C=3·(−2)=4`, `det B=3` nonsquare | (b) needs the 𝔽₅-model |
| §2.2 (b) vs FLHS15 §2 | `Gal(K₀/F)≅A₅`, `ζ₅∈K₀` | `√5∈F`, `[F(ζ₅):F]=2`, A₅ has no index-2 subgroup | contradiction as claimed |
| §2.3 / `three_five_switch` | orders in `GL₂(𝔽₃)`; `ζ₃∈K`; ×2 on `E[5]` | Borel 12, normalizers 8, 16, `24∤`; image = `SL₂` exactly; `e₅(2P,2Q)=e₅^4` | true; basis-independent since all g ∈ `SL₂` quantified |
| §2.4 | `GL₂(𝔽₃)` series | 48, 24, 8, 2, 1; `ε̄₃⁻¹(c)=−1≠1` | solvable, totally odd |
| §2.5 | line stabilizers in `SL₂(𝔽₃)`; image `GL₂(𝔽₅)` | 6 (rational), ≤4 (over 𝔽₉), both <24; `SL₂(𝔽₅)→PSL₂(𝔽₅)` | absolutely irreducible; (a) fails generically |
| §3.1 | `c(λ)` at order 3; subgroup inclusions | `2−(−1)=3≢0 mod 5`; `G_{M(ζ₅)}⊆G_{L(ζ₅)}`, `L(ζ_ℓ)=M` | items 1–5 follow from §7.4; Check clause: R02 |
| §3.3 table | rows p, 3, p | residual iso from §1.5, irreducibility §3.1(1),(2),(3) on `G_M` | each row meets §2.2 |
| §4.1 | `L/K` abelian, totally real | hypotheses of §2.3(2) of the supplier met (`ρ|G_L` irreducible) | true |
| §4.2 | 11a1 at 11; `y²=x³−x+1` at 23 over ℚ(√5); archimedean | `a₁₁=1`; `Δ=−368=−2⁴·23`, `c₄=48`, 5 nonsquare mod 23, norm 529 split; `Γ_ℂ(s+1/2)→Γ_ℂ(s)` | correct |
| §4.3 | `y²=x³−x` at 3, 5; `y²=x³+1` at 5; `[i]^*ω`; char p | 4 points `a₃=0`; 8 points `a₅=−2`, `N(−1±2i)=5`; 6 points `a₅=0`; `d(−x)/(2iy)=iω`; `d(x²)=0`, `d(x³)=0`; Δ: −27≡1, 64≡1 | correct; notation: R04 |
| §4.4 example | `y²=x³−x+1` | `j=1728·(−4)/23=−6912/23` | non-CM |
| Layer 1 example | p=101 | `φ(303)/2=100` | correct |

## Not verifiable

- The three supplier contracts are not theorems of any roadmap yet; their truth rests on BD14
  Théorème 3.2.2 with FLHS15 §2 (read, consistent), on the weight-one to cohomological-weight
  passage (the README says the supplier must prove it), and on the differential argument of
  OpenAI26 §9.4 (read).
- Journal pagination of FLHS15, BD14, BLGG12 and BLGG13II: the preprint versions were read and the
  README cites those versions.
- The Downstream consumers paragraph on ModularityAndLanglandsExtensions ("removes degree
  restrictions") was not checked against that roadmap's sections; it cites no section.
- Ownership against open pull requests was checked through the roadmap search over the listed
  heads, not by reading every sibling in full.

## Source issues

- **Misprint** in LeHung26 at §3.1, the sentence introducing Proposition 3.1, p.6 (LeHung26 line 230): the source says the lifting proposition follows from Theorem 3 of Freitas–Le Hung–Siksek together with Breuil–Diamond; it should be Theorem 2 of that paper, the lifting theorem (Theorem 3 is the seed criterion at 3 and 5); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "00dea6abc70d74eb4f78c5ff801c11f4e4f90937", "job": "REV-PKG-EllipticCurveModularityTotallyReal", "model": "fable", "worker": "chris-x10"} -->
