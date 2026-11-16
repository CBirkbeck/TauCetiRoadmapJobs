# PORT-LogicAndDefinabilityInNumberTheoryPartII

## Branch and commit

- Branch: `roadmap/logic-and-definability-in-number-theory-part-ii`, from `51d880d`.
- Head: `8eb7da89634dcf881b787553c88fcef0124f2b87`, message `LogicAndDefinabilityInNumberTheoryPartII: roadmap (README, Suggested.lean, metadata)`.
- Files: `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder changed.

## Checks

- Build: `lake build TauCetiRoadmap.LogicAndDefinabilityInNumberTheoryPartII.Suggested` ends with `Build completed successfully (18239 jobs).`
  - 9 warnings, all `declaration uses 'sorry'`, one per theorem.
  - The first build also warned that `Mathlib` "is designed for use with the module system". I added the `module` header that 94 of the 228 `Suggested.lean` files on main carry, and that warning went away.
- Gate summary line: `gate LogicAndDefinabilityInNumberTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 248 roadmaps, 2349 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.

- Citation resolver (`roadmaps resolve` on the ported README): no cross-roadmap citation and no Lean name found nowhere.
  - The five leads in the worker's list (`ModuliDescent.polarizedDescentComparison`, `ArithmeticCoefficients.valuation_prolongation_integrality`, `ArithmeticCoefficients.root_coefficient_descent`, `NaturalIntegration.properAlbanese_exists`, `SieveLangWeil.lang_weil_uniform`) are names planned by suppliers. I found each one:
    - the three AlgebraicModuliForArithmeticGeometry names on main, §3.5 and §7.5;
    - `properAlbanese_exists` at the ColemanIntegrationPartII head (its `Suggested.lean` line 106);
    - `lang_weil_uniform` on main, SieveMethodsAndPrimePatterns §5.4.
- Signature check: I appended `#check @name` for all 11 declarations of `Suggested.lean` in one copy and elaborated it once with `lake build`, then restored the file.
  - The same copy also checked 17 cited Tau Ceti declarations and 29 cited Mathlib declarations. All resolve at the pins, with 0 errors.
  - Every elaborated type agrees with its README statement: §§0.1, 0.2, 0.7(1), 0.8, 0.10(e), 0.13a, 0.14(b), 5.7, 6.9, 8.4, 8.5.
  - No binder was lost: every declaration carries its binders in its own signature and there is no `variable` block.
  - The ten declarations of the package keep exactly the types in the worker's `signatures.md`. The only new type is that of `exists_formula_valuationSubring_ne_top`.

## Draft pull request body

This roadmap develops the first-order arithmetic of finitely generated fields. It builds up to Dittmann and Pop's theorem that every finitely generated field is characterized, among all finitely generated fields, by a single sentence in the language of rings.

It starts from Rumely's uniform definitions in global fields and Poonen's uniform definitions of the prime field, the constant field and algebraic dependence. From these it constructs Dittmann–Pop's uniform formulas for the geometric prime divisors in every Kronecker dimension. Those formulas rest on:
- anisotropic "nice" Pfister forms;
- the cohomological Hasse principles of Kerz–Saito, Jannsen and Kato;
- a compactness argument in the patch topology of the valuation spectrum;
- multiplicative stabilizers of anisotropy sets;
- in dimension two, Pop's shifted-ring construction from cubic or quadratic symbols.

The divisor formulas then define finitely generated normalizations. Aschenbrenner–Khélif–Naziazeno–Scanlon's arithmetic coding makes every infinite finitely generated field bi-interpretable with ℤ, and Nies's argument turns bi-interpretability into one characterizing sentence.

The results are unconditional except in characteristic two above Kronecker dimension three, where resolution of singularities over 𝔽₂ is assumed. `Suggested.lean` states nine headline theorems at the pins: Rumely's valuation rings, Pop's dimension sentences, Poonen's four theorems, the divisor and normalization formulas, and the single sentences for domains and for fields. The module docstring says which headlines cannot be stated at the pins, and which carrier each one lacks.

## Dependencies still in pull requests

These roadmaps are named as suppliers and are still pull requests:

- LogicAndDefinabilityInNumberTheory
- QuadraticFormInvariantsPartII
- LocalFieldsRamificationPartII
- AdicCoefficientsAndComparisonsPartII
- ArithmeticGaloisDuality
- LefschetzPencilsAndVanishingCycles
- FunctionFieldArithmetic
- NeronModelsAndSemistableAbelianVarieties
- ClassicalAdicEtaleCohomology
- ColemanIntegrationPartII
- DeligneWeightsAndPurity
- KTheoryFiniteLocalFields
- PadicDifferentialEquationsAndRigidCohomology
- PurityForFlatCohomology

MotivesAndAlgebraicCycles, also a pull request, is cited only to mark a boundary (§0.5b, in the scope and in a 1.1a Check), never as a supplier.

These suppliers are on main: AlgebraicModuliForArithmeticGeometry, AbelianSchemesAndArithmeticModuli, SieveMethodsAndPrimePatterns, SchemeAndStackFoundations, CrystallineCohomology, EtaleCohomologyFoundations, JacobianChallenge, AnalyticNumberTheoryPartI, AlgebraicCurves, ClassFieldTheory, GlobalQuadraticForms and EllipticCurves; Chebotarev, GlobalNumberFields and RealAlgebraicGeometry are under `Completed/`. WeilConjectures is no longer a dependency (see below).

No cited id depends on an open revision. I rechecked every cited section against the current heads and main, including §1.3 and §5.2 of LocalFieldsRamificationPartII, which are bold paragraph headings there. The four gap slugs are unchanged: biinterpretation-homotopy, embedded-resolution-dimension-two, function-field-cyclic-hasse-norm, snc-bertini-over-base / finite-field-divisor-adapted-fibration. Each still names a statement that its supplier's head does not make.

## Lean ↔ README

- **Nothing moved from the Lean file to the README.** The package file already had the right form: headline theorems and the two definitions they need, no sorry'd data, no padding. I kept all ten of its declarations unchanged in statement.
- **Added:** `exists_formula_valuationSubring_ne_top`, Rumely's uniform valuation rings of global fields (README §0.7(1)). It is a headline result this roadmap owns and it can be stated at the pins:
  - in a finitely generated field of Kronecker dimension one, the valuation rings of the nonarchimedean places are exactly the valuation subrings other than the field;
  - §0.7 now proves that equivalence in one sentence, names the theorem, and has a new Check: the place at infinity of `𝔽_q(t)` occurs, and the trivial valuation ring never does.
- **Docstring:** it now also names, as not statable at the pins, the cohomological local–global principles of Layer 1. The pins have continuous group cohomology but no twisted coefficients `ℤ/n(d)`, no Kato groups and no residue maps.
- **Docstring correction:** the carrier `RS(𝔽₂)` lacks is the normal crossings divisor. Tau Ceti has birational modifications at the pin (`TauCeti/AlgebraicGeometry/Morphisms/Modification/`), so the old wording, "has no carrier", was too broad.
- **Header:** `module` added (see Checks).

## Supplier replacements and duplication removals

1. **Weil bound.** SchemeAndStackFoundations §5.11 `weil_bound` (on main) states the Weil bound for smooth projective geometrically irreducible curves over `𝔽_q`. The package took it from WeilConjectures WC.5 §5.29 (open). A roadmap on main takes precedence, so 0.11, the Layer 0 Dependencies, the scope and the contracts now cite SchemeAndStackFoundations §5.11, and WeilConjectures is no longer cited.
2. **Resolution of surfaces.** Lipman's theorem (Stacks 0BGP) was used as a bare citation in 1.4 (model for `d = 2`), 1.5 (regular arithmetic model) and 5.4 (adapted surface). AdicCoefficientsAndComparisonsPartII §PA.0.11, already a supplier, states it: quasi-excellent schemes of dimension at most two are resolved by projective modifications. All three routes now take it from there; Stacks remains the source locator. The extra steps are written out:
   - 1.5: a proper birational morphism of regular integral curves is an isomorphism, so the generic fibre is unchanged;
   - 5.4: the centre of `v` on the resolution has local ring `O_v`.
3. **Height-one intersection (6.3).** I found no Mathlib or Tau Ceti statement at the pins, and no other roadmap states it, so the target stays here. Its route now takes Hartogs for `(S_2)` from SchemeAndStackFoundations §0.17 (`satisfiesSerreS_two_iff_hartogs`) and Serre's criterion from §4.13, instead of a bare Stacks citation.
4. **0.6(e).** The commutative algebra of the route now cites pinned declarations:
   - Tau Ceti `TauCeti.AlgebraicGeometry.isRegularLocalRing_stalk_of_smooth` (Stacks 00TT);
   - `TauCeti.IsRegularLocalRing.quotient_span_singleton` (00NQ, one parameter at a time);
   - `TauCeti.IsRegularLocalRing.isDomain` (00NP);
   - Mathlib `IsDiscreteValuationRing.TFAE` (00PD).

   The contracts list them.
5. **Kronecker dimension.** QuadraticFormInvariantsPartII §5.7 owns invariance under algebraic extensions, relative closedness of `κ`, `δ(κ) ∈ {0, 1}` and the strict drop. The 0.1 API restated part of that list; it now cites §5.7 and keeps only what this roadmap adds:
   - the comparison with the Krull dimension of finitely generated subrings;
   - the constant field of a finitely generated field;
   - the `H_d` equivalences.

   The Lean `kroneckerDimension` stays because no roadmap module can be imported. Its fully qualified name differs from QuadraticFormInvariantsPartII's.
6. **Shape.** The contracts grouped suppliers under "From the other earlier roadmaps" and "From the roadmaps on main", which is merge-order wording that goes stale. They now have one `### From TauCetiRoadmap.<X>` section per supplier. "On main" was removed from the scope and from seven Dependencies lines. The 19 "API:" labels became "The API gives the following facts." `AbelianVariety.IsAlbanese` is now written out in full as `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese`.
7. **Ownership boundary made explicit.** The `d = 3` model in 1.4 uses Cossart–Piltant's projective resolution of a projective threefold over `𝔽₂`. AdicCoefficientsAndComparisonsPartII §PA.0.12 states resolution of threefolds only in the proper sense and explicitly leaves out projectivity. The scope now says this, and the Layer 1 Dependencies name Cossart–Piltant.

Duplication sweep, searched by object on main and at the open heads with `roadmaps grep`:
- No other owner was found for:
  - Kato complexes and Kato homology;
  - the Kerz–Saito, Jannsen-in-characteristic-two and Kato principles;
  - étale duality for `W_nΩ^d_log` (CrystallineCohomologyPartII §4.1 is coherent Ekedahl duality, a different object);
  - Rumely's and Poonen's definability results, prime divisors, nice Pfister forms;
  - the Merkurjev–Suslin reduced-norm criterion;
  - the cyclic Hasse norm theorem for function fields;
  - the Albanese torsor over an arbitrary field;
  - bi-interpretation.
- Poonen's Bertini theorem over finite fields has no owner either. LefschetzPencilsAndVanishingCyclesPartII (on main) explicitly excludes it.
- AbelianSchemesAndArithmeticModuliPartII §F3.2 (Honda–Tate) would imply 0.11(c), the existence of an ordinary elliptic curve over every finite field. 0.11(c) is a target here with its own locator (Waterhouse), so I made no change.
- Ownership against the open pull requests was checked through the roadmap tool's index of 460 heads.

## Upstream-reviewer fixes

Items 1–7 above, plus:
- the Conventions' resolution citation for `d ≤ 2` now names the supplier;
- the §PA.0.11 contract assumes only that section's statement, not the shape of its route;
- the *How to read the build* paragraph names the nine headline theorems, the two definitions and the carriers that are missing at the pins.

I found no mathematical error in the package text. Every Check below was recomputed and holds.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `kroneckerDimension` | `ℚ`, `ℚ(t)`, `𝔽₃(t)`, `𝔽₉`, `ℚ̄` | `0+1=1`, `1+1=2`, `1+0=1`, `0`, `0+1=1` | as README; `ℚ̄` shows finite `δ` without `Field.FG` | none |
| `IsGeometricPrimeDivisor` | `t`-adic on `ℚ(t)`; `ℤ_(3)[t]_{(3)}` on `ℚ(t)`; `O = K`; arc valuation `ord_s f(s, eˢ−1)` on `ℚ(s,t)` | `δ(ℚ)+1=2=δ`, chars `0=0`; residue `𝔽₃(t)`, `δ+1=2` but char `3≠0`; a field is not a DVR; residue `ℚ`, `1+1=2≠3` | geometric; prime divisor, not geometric; excluded; excluded | none |
| `exists_formula_valuationSubring_ne_top` | `ℚ`; `𝔽₂(t)`; `𝔽_q` (`δ=0`); `ℚ(t)` (`δ=2`) | fibres `ℤ_(p)`; `𝔽₂[1/t]_{(1/t)}` included; hypothesis fails; there are uncountably many valuation rings but only countably many fibres | holds; `δ=1` is needed (negative control) | added, with Check |
| `exists_sentence_kroneckerDimension_eq` | `n=0`: `𝔽_q`; `n=1`: `ℚ`, `𝔽_p(t)`, not `ℚ(t)`; `𝔽₄` in char 2 | for finitely generated fields `δ=0` means finite; `⟨1,−b⟩₂` is isotropic over `𝔽₄` for every `b`, but `𝔽₄ˣ` is cyclic of order 3, so a non-cube `b` exists | cubic test needed in char 2 | none |
| 0.8 route, char 3 | `𝔽₉(t)`, `π=t²−(1+i)`, `b=t` | `(1+i)²=2i`, `(1+i)⁴=−1`, order 8; `𝔽₉ˣ` = tenth powers in `𝔽₈₁ˣ`; `t̄⁴⁰=(1+i)²⁰=−1` | constants fail, `t` works | none |
| `exists_sentence_charZero` | `ℚ`; odd `p`; `p=2`; `Z=∅` | `ℤ≠2ℤ`; `s=2·((p+1)/2)s`, so `Z=2Z`; `2=0`; `∅=2∅` | false in every field of positive characteristic | none |
| `exists_formula_mem_primeField` | `ℚ(√2,t)`; `𝔽₉(t)`; `𝔽₂(t)`; `𝔽₉` | `ℚ`; `𝔽₃`; `𝔽₂[t]∩𝔽₂[1/t]=𝔽₂`; excluded by `Infinite` | holds | none |
| `exists_formula_not_algebraicIndependent` | `n=0`; `n=1`, `x=0` and `x=t` in `ℚ(t)`; finite `K` | empty family independent, so formula false; `0` dependent, `t` independent; every nonempty tuple dependent | holds | none |
| `exists_formula_isGeometricPrimeDivisor` | `d=0`; `ℚ`; `𝔽_q(t)`; `ℚ(t)` | no DVR; residue char `p≠0`; every place; `t`-adic and `∞` occur, `ℤ_(p)[t]_{(p)}` does not | holds | none |
| `exists_formula_arithmeticNormalization` | `(1,0)`: `ℚ`; `(1,1)`: `𝔽₂(t)`, `T=(t²)`; `(0,0)`: `𝔽₄`; wrong `e`; char 2, `d=4` | `ℤ`; `X²−t²`, ring `𝔽₂[t]`, `v_t(1/t)=−1`; all of `𝔽₄`; no basis; hypothesis false | holds | none |
| `…_of_isDomain` | `B=𝔽₄` vs `ℤ/4`, `𝔽₂×𝔽₂`, zero ring; `B=ℤ` vs `ℤ[i]` | `2·2=0`; not a field; `0=1`; non-isomorphic | holds | none |
| `exists_sentence_realize_iff_nonempty_ringEquiv` | `𝔽₄`; `ℚ` vs `ℚ(i)`, `ℚ(t)` | `θ₄`; not isomorphic | holds | none |
| Conventions, `q_a ≅ ⟨⟨…⟩⟩_b⊗[1,c]` | `2≠0`, `c=(1−a₀)/4` | `x²+xy+cy²=(x+y/2)²+(c−1/4)y²`, and `1−4c=a₀` gives `⟨1,−a₀⟩` | correct | none |
| 0.6(a) Check | `q=X³+sY²Z`, `P=(r,1,r)`, `r²=s` | `r³+sr=2sr=0`; `f=Y(Y²+sX²)` | correct | none |
| 0.6(c) Checks | `𝔽_q(t)`, `n=r=1`; `ℚ`, `8⟨1⟩` | `⟨1,−c,t,−ct⟩` anisotropic by (d); positive definite | sharp; `√−1` needed | none |
| 0.6(e) Check | `k=𝔽₂(s)`, `π=u²+s`, `q=X³+sY³` | residue `X³+r²Y³`, `ord_r(r²)=2≢0 (mod 3)`; blocks `0,1,2 (mod 3)` | correct | route now cites pinned declarations |
| 0.11 Checks | `y²+xy=x³+1`, `y²+y=x³` over `𝔽₂` | `1+2+1=4`, trace `−1`; `2+0+1=3`, trace `0`; `2·4=8`, `3·4=12` | correct | Weil bound supplier replaced |
| 0.12 Check | `𝔽₅`, `y²=x³+x+1`, `P₀=(2,1)`, `c=2` | values `1,3,1,1,4`, so `2+0+2+2+2+1=9`, trace `−3`; `z(P₀)=1/2=3`, `b=6=1`, `∂(s²−b)/∂s=2` | correct | none |
| 1.1 Check | `(−1,−1)` over `ℚ(√5)` | real invariants `1/2,1/2`; 2 inert (`X²+X+1` irreducible), so `2·(1/2)=0` | not detected at finite places | none |
| 1.1a Check | `ℤ[i][t]_{(t,3)}`, `α=(t)∪(3)∪(1+i)` | `(1+i)⁴=−4≡−1`, a nonsquare in `𝔽₉`; residues at `(t)`, `(3)` give `[1+i]+[1+i]=0`; at `(t−3)` all slots are units | complex holds | none |
| 1.3 Check | `F=𝔽₃(t,b³)`, henselization `R` | `[F(b):F]=3`, purely inseparable; `𝔽₃((t))[X]/(X−b)³` is nonreduced | henselian, not excellent | none |
| 1.5 regular model | generic fibre of the `§PA.0.11` modification | proper birational map of regular integral curves → finite birational onto a normal curve → isomorphism | generic fibre preserved | route rewritten |
| 2.1 Check | `(21,−1)`, `(7/3,−1)` | `21=9·7/3`; `ε(21)=10≡0`, so `(21,−1)₂=1`; `v₃(7/3)=−1`, odd, over unramified `ℚ₃(i)` | nice; not nice | none |
| 2.4 example | `a₀=3`, `a₁=145` | `145=5·29=2·72+1`; `145≡1 (mod 9)` and `≡1 (mod 8)`; `3` nonsquare mod `5` | nice, anisotropic over `ℚ₅⊇ℚ(i)` | none |
| 3.7 example | lexicographic `w(y)=(1,0)`, `w(x)=(0,1)` | `N·(1,−5)=(N,−5N)≥(1,0)` for `N≥2`; `N·(0,n)<(1,0)` | `𝔭` = positive first coordinate | none |
| 4.7 Check | `ℤ∪ℤ√2⊂ℚ(√2)` | `√2·ℤ=ℤ√2`, `√2·ℤ√2=2ℤ` | `√2` stabilizes the union and not `ℤ` | none |
| 5.1 Check | `⟨1,−3,−5,15⟩` | `(5,3)₂=1`; `(5,3)₃=(2/3)=−1` | isotropic at 2, anisotropic at 3 | none |
| 5.4 centre | resolution `X→Z`, `O_v=O_{Z,u}` | `O_v⊆O_{X,x}⊆O_v` | `O_v` is the local ring of a curve | route rewritten |
| 5.6 Checks | `p=5`, `u=x⁵−a`; product identity in `𝔽₅(s)` | `w²=2y⁴+2y²+2`, gradient `(−5x⁴,2y,0)=0` at `y=0`; `(2(z⁴+z²+1))⁵=2(z²⁰+z¹⁰+1)`; `b′=2s` gives `a(Q)=−1/3=3` | correct | none |
| 6.3 route | `S` a field; `k[x,y]`, `f=1/x`; `k[t²,t³]` | `I=S`; `1/x∉S_(x)`; DVR localizations intersect to `k[t,t⁻¹]` | holds; normality needed only for the DVR claim | route via SchemeAndStackFoundations §§0.17, 4.13 |
| 6.7 Check | `f=(s+2)/3`, `s↦−1` | `ḡ(2)=1≠0`, `g(−1)=1`, `v₃(f)=−1` | excluded | none |
| 6.8 Checks | `ℚ(√5)`; `ℚ(i)`, `5=(2+i)(2−i)` | `ℤ[(1+√5)/2]`; `v_{2+i}((2+i)/5)=0`, `v_{2−i}=−1` | all prolongations needed | none |
| 7.2 Check | `𝔽₂[t,t⁻¹]`, `s=t+t⁻¹` | `t²−(t+t⁻¹)t+1=0` | free of rank 2 over `𝔽₂[s]` | none |
| 8.2 Check | `ℤ/4` | `2y=1` has no solution | elimination only on fields | none |

## Unresolved, for the worker and the maintainers

- **Cossart–Piltant inside 1.4.** For Kronecker dimension three in characteristic two, the model in 1.4 rests on Cossart–Piltant's projective resolution of projective threefolds over `𝔽₂`. 1.4 cites it as a theorem; no roadmap states it, since AdicCoefficientsAndComparisonsPartII §PA.0.12 deliberately states only the proper form. The scope now records the boundary. Two ways to remove the remaining unsupplied input:
  - a gap request to AdicCoefficientsAndComparisonsPartII;
  - a separate target here.

  Either is a design decision, so I did not make it.
- **Poonen's Bertini theorem.** It enters the route of gap:finite-field-divisor-adapted-fibration and has no owner; this is the review's open scope question.
- **Venue of `achter_casalaina_vial`.** Annales de l'Institut Fourier 76 (2026) is still unconfirmed; the README cites the arXiv v3 numbering.
- **Consumer named in AdicCoefficientsAndComparisonsPartII.** That roadmap (line 1754 at its head) names "LogicAndDefinabilityInNumberTheoryPartII §2.1" as the consumer of its §PA.6.10. The consumer is §3.1. That file is outside this job.
- **Suspicious text.** None found in the package, the reports or the cited roadmaps.


Pull request: #2438 (roadmap/logic-and-definability-in-number-theory-part-ii at 8eb7da8)
