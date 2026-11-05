# FIX-RT-DirectSummandsAndBigCohenMacaulay~1

The two red-team passes (a: F01–F08, b: F01–F04) are merged here. Where they overlap, the finding is settled once: a.F08 and b.F02 (§7.7) are settled together. Each still has its own section below.

## F01 (P2) — applied

§7.4: "almost split with respect to `p^{1/p^∞}`" over an arbitrary perfectoid K → almost split in the basic setup (K°, K°°), i.e. with respect to K°°A. This equals the `p^{1/p^∞}` statement for the rooted Layer 3 field. Added a Check for the completed ℚ₃(μ_{3^∞}): K°° ∋ ζ₃−1 is nonzero, but 3 has no cube root in K. The negative Check is restated on A=K°, where ε·p≠0 for ε∈K°°. *Needs* now cites P0 (root ideal basic setup).

## F02 (P2) — disputed

`completion_balanced`, `balanced_faithfullyFlat` and `complete_pure_split` are Layer 0–1 inputs (§§0.5, 0.6, 1.2). The headlines consume them; they are not end theorems or results the roadmap is built to reach. They were deleted from the acceptance test on exactly that ground (package report ~2, F08). `Suggested.lean` is not an API catalogue. The README keeps all three as prose targets with their hypotheses and Checks. The reviewer's signatures are not wrong as statements, but restoring them would turn the file back into an input catalogue. If this is raised again, a human should decide it, since it reverses an earlier accepted repair.

## F03 (P3) — applied

Checked against main: in PerfectoidSpaces the existence of roots is *exists-pseudouniformizer-with-compatible-roots* in P1.4, while P1.1 defines perfectoid Tate rings. In §3.2, "result of §P1.1 gives π" → "§P1.4 applied to g (gᵖ=pu divides p) gives π=gw, w a unit; πᵖ=p·uwᵖ". P1.4 is added to §3.2's *Needs*, to the Layer 3 dependencies and to the PerfectoidSpaces supplier contract.

## F04 (P2) — not actionable in this package: scope change (Heitmann–Ma theory belongs to a Part II)

The witness is valid. HEITMANNMA18 Corollary 4.3 (line 544; proof lines 547–556) proves Cohen–Macaulayness for every pure local map into a mixed-characteristic regular local ring, with no separability. Its proof needs their Theorem 4.1 (vanishing of maps of Tor, line 438). That theorem needs Lemma 4.2's reductions, citing Ranganathan, Hochster's notes and HH95 (4.5), and Theorem 3.1: weakly functorial big Cohen–Macaulay algebras for R→R/Q with Q of height one, with its own perfectoid construction (pp. 7–11). Adding that machinery is a scope extension, not a missing hypothesis. The stated theorem is André's Théorème 4.4.2 at exactly its source's generality. Edits made: the Scope now names the Heitmann–Ma results as belonging to a Part II of this roadmap. The inaccurate attributions in §6.2 (a former Check) and §6.4 are corrected: HM Theorem 3.1 is a height-one-quotient square, and HM remove separability for the Cohen–Macaulay conclusion. `pureSubring_cohenMacaulay` keeps `hsep`.

## F05 (P3) — applied

The relation-restatement Check (old §4.2) goes with the §4.2 rewrite. The §3.2 Check that restated the integral perfectoid conditions → a computed Frobenius test: `2^{1/4}` mod `2^{1/2}` ↦ `2^{1/2}` mod 2, both nonzero; the zero map fails. The scope or reference bullets in §§0.8, 0.10, 3.4, 3.6, 4.11, 5.1, 5.3, 5.5, 6.2, 6.4 (×2), 7.1 and 7.3 are moved into the surrounding prose. The definitional sections keep at least three discriminating Checks.

## F06 (P2) — applied

"How to read the build" now says: build §4.9 before §4.8, then §§4.10–4.11; build §§5.2–5.3 before the flat-domination proof of §5.1, while the Bhatt proof uses only earlier layers. §5.1's *Needs* is split into statement / shared reductions / Bhatt route / flat-domination route.

## F07 (P3) — applied

§2.3: "ANDRE18B line 564" → "line 551" (Corollaire 2.6.1). Repairing the pattern: §6.2 cited Remarques 2.6.1(4) at line 564, but line 564 is item (1). It now cites line 575, where item (4) begins.

## F08 (P2) — applied differently

The witness holds. KOVACS00 Theorem 5 (line 148) fails for ℙ¹→ℙ¹ of degree 2 (ranks 2 and 1), and Lemma 2 and the deduction of Theorem 2 (line 193) go through it. The suggested repair (resolve, normalization factorization, Grauert–Riemenschneider) is replaced by a simpler argument, because here the base is regular. §7.7 now owns a trace lemma, stated after this list:

- f is lci (DeformationAndDerivedPatchingAlgebra §3.4).
- f^!O_X is a line bundle L in degree 0 (SchemeAndStackFoundations §2.19 `upperShriek_lci`, `upperShriek_flat_baseChange`, `upperShriek_etale`).
- The Jacobian section of L is regular and is generically the field trace.
- Global duality turns this section into τ with τ∘unit = e.

The lemma concerns a proper, surjective, generically finite and generically étale map f: Y→X of degree e between integral regular schemes. Kovács is now cited only for the attribution and the source error. No GR vanishing is needed.

## F01 (P1) — applied

The witness holds: the pointed-to-full finite-witness comparison had no construction, and HOCHSTER02 line 232 is false (T/Rt keeps t²). Layer 4 now runs through algebra modifications only:

- §4.2 defines algebra modifications T[X]/(F) with sequences, double sequences, badness and finite witnesses (HOCHSTER02 Definition 3.1, line 172).
- §4.3 is Hochster's criterion for algebra modifications (lines 180, 192), proved by the direct limit plus §0.5.
- §4.4 is the key lemma for R-algebra maps into D[1/π], with exponent bound e′+δ(e+1/pᵐ).
- §4.5 tracks exponents C/pᵐ, with C=δ(1+⋯+δ^{ℓ−1}).

§§4.10 and 4.12 are updated to match, and so are the Examples, the worked example, the Scope, "How to read the build" and the Suggested.lean docstring. The pointed partial construction and the comparison target are deleted.

## F02 (P2) — applied

The witness holds: a retraction over a smooth stage A_i maps to a retraction of R→RΓ(X_i)⊗^L R, which points the wrong way along a nonflat A_i→R. The reviewer's equational alternative has the same defect: nonvanishing of α does not descend to α_i, since that is again the splitting-over-A_i ⇒ splitting-over-R direction. The Popescu limit passage, the comparison target and the Chow/Kovács descent to ℂ are deleted. §7.7 now works directly over A₀ complete regular local ⊇ ℚ, reached through §7.3. It resolves Z with ResolutionOfSingularitiesCharacteristicZero §7.5 `qeResolution` (Z is quasi-excellent), applies the trace lemma (see a.F08), and divides by e. The gap `grauert-riemenschneider` is no longer used. It is removed from the README contracts and from the plan's `gaps`, and the ResolutionOfSingularitiesCharacteristicZero contract now cites §7.5 rather than §5.5.

## F03 (P3) — applied differently

The claim that only the flattening chapter is cached is wrong. The STACKS manifest entry records `additional_texts` for the algebra, more-algebra and coherent chapters, and their sha256 files are in the cache. Line 4671 of the algebra text is Definition 42.1 (030O). In the coherent text, line 290 is Lemma 4.2 (01XI), line 2350 is Proposition 19.1 (02O5) and line 2413 is Lemma 19.2 (02O6). What was wrong is that the README did not say which text a line refers to. It now says so ("in the commutative-algebra text", "in the cohomology-of-schemes text"), as was already done for 081T. 02O6 line 2413 is added to the README and to the manifest `line_locator`.

## F04 (P3) — applied

The flat-local transport is in neither the gap nor Mathlib at the pin (no flat-local dimension formula under `Mathlib/RingTheory/KrullDimension`). A fourth clause is added to gap:parameter-systems in the README and the plan: a flat local R→R′ with m_R R′=m_{R′} carries parameter systems to parameter systems. §4.7(4) now cites it, and so does its *Needs*. §§4.8 and 6.2 reach it through §4.7.

## Checks

- **Elaboration:** `lake env lean packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean` exits 0 with 10 `declaration uses sorry` warnings and no errors.
- **Mechanical `#check`:** I put `#check @name` for all 19 declarations in one scratch file and elaborated it with no errors. All 19 types match the stored signatures. Only the module docstring changed, and no binder was lost.
- **Depcheck:** `depcheck: 56 roadmaps, 650 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Citation resolver:** the only lead is PerfectoidSpacesPartII §RA.5. That is the design-stage board package (`packages/PerfectoidSpacesPartII/design`), earlier in the merge order. It is not a defect.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §4.2 algebra modification | T=k⟦x⟧[t]/(xt), x·t=0 | T/tT=R; t²↦0; 1∉mR; module quotient T/kt keeps t²≠0 | ideal quotient needed; Check |
| §4.2 | R=K⟦X,Y⟧/(XY,Y²), X·Y=0 | R/YR kills Y≠0 | not injective; Check |
| §4.2 | T=R/(X) over k⟦X⟧, X·1=0 | T/T=0, 1∈m·0 | bad; Check |
| §4.3 criterion | T=R CM; T=k⟦x⟧[t]/(xt) | identity square; t↦0 into R | consistent both directions |
| §4.4 key lemma | π unit; p=2, e=0, m=1; k=0 | colon=ideal; exponents 1/2, 1, 3/2; α(u₁)=0 | holds; D=k⟦X,Y⟧/(XY,Y²), π=1 fails the hypothesis |
| §4.5 exponent | δ=2, ℓ=2, p=2, h=1 | C=6; m=4: 6/16≤1/2; m=3: 6/8>1/2 | m depends on the witness |
| §4.12 transport | π=2, π′=4 | δ(2^{1/2ⁿ})⁻¹=2^{1/2ⁿ}·4^{−1/2ⁿ} ∈ π′^{−1/2ⁿ}D′ | direction correct |
| §7.4 almost ideal | K=ℚ₃(μ_{3^∞})^; A=K°, Y=Spec K°/p | ζ₃−1∈K°°; X³−3 has group S₃; εp≠0 | root-free ideal needed; Checks |
| §7.7 trace lemma | K⟦x⟧⊂K⟦x^{1/2}⟧ | 2y·c: 1↦2, y↦0 = Tr; ½Tr(1)=1 | holds |
| §7.7 | blow-up of K⟦x,y⟧ | L=O(E), Jacobian vanishes once on E, τ=id | holds; O(−E) has no generic-identity section |
| §7.7 | field, L/K degree e | Tr(1)=e | equals §0.9 |
| §7.7 | ℙ¹→ℙ¹, z↦z² | ranks 2 vs 1; Tr∘pullback=2 | Kovács Thm 5 fails; lemma holds |
| §3.2 P1.4 step | p=2, g²=2u | π=gw, π²=2uw² | v=uw² is a unit |
| §4.7(4) transport | ℤ₂→completion of ℤ₂[t]_(2) | m_B B′=m_{B′}=(2); dim 1=1 | new gap clause covers it |
| §3.2 Frobenius Check | O_K, p=2 | v(2^{1/4})=1/4<1/2, v(2^{1/2})=1/2<1 | nonzero both sides; the zero map fails |

## Ownership and sources

- **Ownership:** a `roadmaps grep` finds no other owner of algebra modifications or of a generically finite trace lemma. EndoscopicTransferAndUnitaryTraceComparison uses a unit/trace composite for ℓ-adic constant sheaves, which is a different object. ResolutionOfSingularitiesCharacteristicZero §7.5 `qeResolution` was checked at that roadmap's open head. SchemeAndStackFoundations §2.19 (`globalDuality`, `upperShriek_*`, `pushforwardRightAdjoint_affine_finite`) was checked on main.
- **Sources:** no new source was fetched and no `needs-references.toml` was written. The manifest locators were updated for HOCHSTER02 §3, HEITMANNMA18 Theorem 3.1 and Corollary 4.3, KOVACS00 Theorems 2 and 5, and STACKS 02O6.

## Notes for the maintainer

- **Removed gap:** the plan's `gaps` list and the README drop `grauert-riemenschneider`. ResolutionOfSingularitiesCharacteristicZero no longer owes this roadmap GR vanishing, and the cited section changes from §5.5 to §7.5.
- **New consumer contract:** §7.7 now consumes SchemeAndStackFoundations §2.19 `upperShriek_lci`.
- **Extended gap:** gap:parameter-systems gains a flat-local clause for DeformationAndDerivedPatchingAlgebraPartII §K0.3.
- **No Lean renames:** no Lean name changed; only the module docstring of `Suggested.lean` changed.
- **Intake records:** the supplier-less intake records in the plan (G2 `char-zero-derived-splitting-bridges`, G4 `pointed-modification-finite-witness`) now describe routes this roadmap no longer uses. Retiring them is for the intake.
- **Re-raises go to a human:** a.F02 reverses an earlier accepted repair, and a.F04 is a scope decision about a Part II. If either comes back, a human should decide it.
