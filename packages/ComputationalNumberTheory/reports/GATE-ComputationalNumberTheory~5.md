# GATE-ComputationalNumberTheory~5: answers to human review

One comment (roed-math, 2026-11-06), three points. Head before: `54990f7`. Commits:
`ef9011aa` (README citation repairs for H01 and H03) and `99719e78` (the gate's five P3
statement-hygiene notes in `Suggested.lean`, all on lines that predate this round; see below).

## H01 (roed-math) — applied differently

The LocalFieldsRamification layer citations were by number. #617's head (`893faab`) keeps the headings "Layer 0/1/2" but puts new content under them, so every citation would silently point at the wrong content; the reviewer's map of old to new content agrees with #617's own "Former layer numbers" table. Renumbering to #617's labels would be the wrong repair. Those labels (*Finite extensions*, *Valuations and `e`, `f`*, *Units*, *Unramified extensions*) are #617's lists of pinned Tau Ceti declarations, not targets. Main's copy already says each milestone *is* a named Tau Ceti declaration, and a revision PR cannot be a supplier.

So every citation now names the pinned Tau Ceti declarations directly, which reads the same against main and against #617:

- The supplier section "From TauCetiRoadmap.LocalFieldsRamification" is deleted, and one new *From Tau Ceti* bullet (`TauCetiRoadmap/ComputationalNumberTheory/README.md` lines 268–284) lists what is used, all checked at the pin:
  - `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.algebraicExtension_valuativeExtension` (AlgebraicExtension/Basic.lean:130, :147);
  - `TauCeti.finiteExtension_isNonarchimedeanLocalField` (FiniteExtension/Basic.lean:54);
  - `TauCeti.ramificationIndex` (RamificationIndex.lean:114), `TauCeti.inertiaDegree` and `TauCeti.ramificationIndex_mul_inertiaDegree` (InertiaDegree.lean:75, :113);
  - `TauCeti.normalizedNormedField` (NormedField.lean:57);
  - `TauCeti.teichmullerLift` and `TauCeti.teichmullerLift_unique` (Teichmuller.lean:68, :168).
- Each "LocalFieldsRamification Layer k" in the text and *Needs* lines is replaced by the declarations it used: §2.20 (lines 1356–1358), §2.21 (1362, 1368), §2.22 (1381), §2.23 (1403) and the Layer 2 dependencies (1415).
- §2.21 used to point at "Layer 0" for its norm. It now names `TauCeti.normalizedNormedField` and gains a Check (line 1375) showing that validity does not depend on which norm is used: in `ℚ_2(√2)`, ‖π‖ is 1/2 for the normalized norm and 2^(−1/2) for the spectral norm.
- "Layer 2" (unramified norm surjectivity) had no consumer left. Its only user was the good-odd-prime local image section, which an earlier round moved to EffectiveDiophantineMethods §3.4 (commit `e7ce9da6`). That citation is deleted from the Scope bullet and the Layer 3 dependencies (line 1910), together with the `TauCeti.map_normUnits_unitFiltration` bullet and the `range_μ_le_selmerGroupA`/`range_μ_le_ker_normM` bullet that the same move had left without a consumer.
- **Same defect elsewhere.** The README cited "TauCetiRoadmap PolynomialGaloisGroups Layer 5", but #763 and #986 each add a different `TauCetiRoadmap/PolynomialGaloisGroups` folder that has no Layer 5. Their `Completed/PolynomialGaloisGroups/README.md` is byte-identical to main's. The citation now names and links Completed PolynomialGaloisGroups, Layer 5 "Frobenius specialization" (lines 85, 390, 609, 667). Completed RealAlgebraicGeometry gets the same link and label (lines 82, 383, 667, 2671).

## H02 (roed-math) — disputed

Making #617 a dependency is neither allowed nor needed:

- **Not allowed.** #617 revises a roadmap that is already on main (`Completed/LocalFieldsRamification`). Under the merge-order rules a revision is never a supplier: the roadmap is cited as it is on main.
- **Not needed.** After H01, no citation in the README or `Suggested.lean` uses a LocalFieldsRamification layer number. Every consumed object is a pinned Tau Ceti declaration that both main's text and #617's head identify as the implementation, so the citations hold whether or not #617 merges, and the PR description has nothing to declare.

## H03 (roed-math) — applied

Line 76 said "complete discretely valued fields"; it now reads "the arithmetic of finite extensions of nonarchimedean local fields", matching main's own scope statement (Completed LocalFieldsRamification, "Scope and exported contract": "finite extensions of nonarchimedean local fields") and the `[IsNonarchimedeanLocalField K]` hypotheses of every declaration consumed. No statement here needs the general case. The one complete-DVR target, §1.26a, uses Mathlib's complete DVRs and not this supplier. So RamificationOfCompleteDiscretelyValuedFields (#1410) is not cited.

## Further repairs needed for the gate (not raised by the reviewer)

At `ef9011aa` the gate failed only on `statement-hygiene=5`, all on `Suggested.lean` lines this round had not touched. Repairs in `99719e78`:

- **`IsolatedAlgebraicRoot.value`** (line 50) picked its value with `choose`. The value is now a field, with `isRoot`, `mem_re`, `mem_im` and `unique` fields saying it is the only root in the rectangle. README §0.8 (line 506) now says the value is stored and is determined by the polynomial and rectangle. `exists_disjoint_root_presentations` is unchanged in meaning.
- **`RabinCriterion` and `rabin_iff_irreducible`** (lines 55, 64): `[Fintype F]` → `[Finite F]`, `Fintype.card F` → `Nat.card F`.
- **`exists_complete_localImage_padic` and `_real`** (lines 446, 458): the `letI` in the signature is gone. Added `import TauCeti.AlgebraicGeometry.EllipticCurve.NormalForms`, whose instance `WeierstrassCurve.isCharNeTwoNF_map` (NormalForms.lean:78) supplies the normal form `a₁ = a₃ = 0` on `W.map f`. It is now listed under *From Tau Ceti* (line 302) and in §3.20 (line 1804).

**Signature check.** I appended every `#check @name` line from the worker's `signatures/SignatureCheck.lean`, plus `IsolatedAlgebraicRoot.mk` and `.unique`, to `Suggested.lean`, ran the permitted `lake build` once (70 info lines, exit 0), and restored the file. The elaborated types match the README on every changed declaration:

- `RabinCriterion : {F} → [Field F] → [Finite F] → F[X] → Prop`.
- Both local-image theorems carry only `[IsElliptic W] [IsCharNeTwoNF W]` on `W`; the base-change instance is found by search.
- `IsolatedAlgebraicRoot.unique : ∀ self z, aeval z self.poly = 0 → … → z = self.value`.

The cast `xs.map (fun x => (x : ℚ_[p]))` elaborates as a list-monad coercion followed by `List.map id`. It is the same list of casts and the code is unchanged from earlier rounds.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.20: for a root θ, e(ℚ_p(θ)/ℚ_p)=e and f=deg φ·deg R | `X²−3`, p=3, φ=X; `X²+X+3`, p=2, φ=X²+X+1; `X²−2`, p=2, φ=X | side (0,1)–(2,0): e=2,d=1 → (e,f)=(2,1), e·f=2=deg; side (0,1)–(1,0): e=d=1 → (1,2), unramified quadratic; (2,1) for ℚ_2(√2) | holds | attribution only |
| `ramificationIndex_mul_inertiaDegree`, e·f=[L:K] | L=K; ℚ_2(√2)/ℚ_2; ℚ_2(ζ_3)/ℚ_2 | 1·1=1; 2·1=2; 1·2=2 | holds | none |
| `teichmullerLift` as the canonical digit section | ℚ_5, residue 2 and 0 | lift(2)=ω with ω⁴=1, ω≡2 (mod 5); lift(0)=0; the naive section {0..4} gives 2·3=6≠1 | the naive section is not multiplicative, so uniqueness rules it out | none |
| §2.21 norm normalization Check | ℚ_2(√2), π=√2, x=1+π, v=0, N=2 | ‖π‖=1/2 (normalized), 2^(−1/2) (spectral); digits (1,1): remainder 0; digits (1,0): remainder ‖π‖ > ‖π‖² (1/2>1/4, 2^(−1/2)>1/2) | same verdict in both norms | Check added |
| §2.21 existing Checks | zero; π⁻¹; centre 0 at v=0, N=1 | 0≤‖π‖^N; ‖π⁻¹−π⁻¹‖=0≤‖π‖⁰=1; ‖1−0‖=1>‖π‖ | hold | none |
| §2.22 Needs (finite extensions of ℚ_p via `finiteExtension_isNonarchimedeanLocalField`) | ℚ_2: 17, 5; ℚ_5: 6; ℚ_2(√2): 3+2√2 | 17≡1 (mod 8) square; odd squares mod 8 are 1, so 5 is not; 4π=20 is 5·unit, 6≡1² (mod 5); (1+√2)²=3+2√2, v(4√2)=5 | holds | none |
| §2.23 local degree formula input | X²−2 at p=7, p=2; f=X | 3²≡2 (mod 7): two primes e=f=1 → 2 roots; p=2 ramified e=2 → 0 roots; f=X: one prime → root 0 | holds | none |
| `IsolatedAlgebraicRoot` (stored value) | X, [0,0]²; X², [0,0]²; X²−1, [−2,2]×[0,0] | value 0, roots {0}; value 0, root 0 (twice); ±1 both in the rectangle, so no value satisfies `unique` | satisfies, satisfies, excluded | structure repaired |
| `RabinCriterion` with `Nat.card` | ZMod 2: X²+X+1, X², (X+1)²; ZMod 5: X²+1 | X⁴−X = X(X+1)(X²+X+1), so f ∣ it, and 1·(X²−X)+1·f = 2X²+1 = 1; X² ∤ X⁴−X; (X+1)² ∤ X⁴−X; gcd(X⁵−X, X²+1) = X²+1 | accept, reject, reject, reject | `[Finite F]` |
| `isCharNeTwoNF_map` on W.map | y²=x³−x over ℚ → ℚ_2, ℝ | a₁=a₃=0 map to 0 | holds | instance replaces `letI` |
| Layer 3 dependencies without LocalFieldsRamification Layer 2 | every *Needs* line in §§3.17–3.26 | none names the unit norm; `map_normUnits_unitFiltration` and `range_μ_le_*` occur nowhere outside the deleted bullets | no consumer | citations deleted |

## Citations and ownership

- **Overlaps.** The two "dropped id" entries for PolynomialGaloisGroups Layer 5 are resolved by the Completed link (H01). No other open PR changes this roadmap. #617 was not flagged by the overlaps tool, because its head keeps the "Layer k" headings; the H01 repair makes no citation depend on them.
- **Citation leads.** All five resolve:
  - AlgebraicModularFormsAndSerreWeights R15.2 and R15.3 are #928's own names for its Layers 2 and 3 (its Scope paragraph defines R15.1–R15.5 as Layers 1–5).
  - `IntMatrix.IsSmithDecomposition` and `ClassGroupPresentation.index_relationLattice` are in ClassicalArithmeticCompletion's README on main (lines 5341, 11171).
  - `PrattTree.validList` is declared in `Suggested.lean` (line 92).
- **Only an open revision defines:** none.
- **Ownership.** This round adds no new construction. All consumed local-field objects are pinned Tau Ceti declarations owned by Completed LocalFieldsRamification.
- **Suspicious text:** none. The comment contains no instructions beyond its review points.

## Build and gate

- `lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested`: "Build completed successfully (8988 jobs)". The only warnings are `declaration uses 'sorry'`.
- Gate summary line: `gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- No source was fetched and no text is missing; `needs-references.toml` was not written.
