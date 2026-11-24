# GATE-SchrodingerOperatorsAndSpectralTypes~2: answers to the follow-up review of 2026-11-24

One comment (kim-em, AI-assisted, follow-up at head `9ffa805`, recommendation "approve"). It makes
six distinct points: five confirm that the earlier requests are settled (items 1; 2–4 and 7; 5; 6;
the boundary for Annals definitions 40 and 45), and one asks for a format fix (six over-long lines
in `Suggested.lean`). The repair is commit `df223836` on top of `9ffa805`. It changes only
`TauCetiRoadmap/SchrodingerOperatorsAndSpectralTypes/Suggested.lean`, and only its whitespace and
line breaks. The README is unchanged.

## H01 (kim-em) — answered

No change needed. At the head the README says what the comment confirms. §3.11 (README line
1347–1356) states the decomposition principle and `σ_ess(Δ_X) = [1/4, ∞)` for a compact set plus
`m ≥ 1` pairwise disjoint standard cusp ends, with finiteness of `σ(Δ_X) ∩ (−∞, c]` for each real
`c < 1/4`. The Check at line 1405–1409 records `diag(1/4 − 1/n)_{n≥4} ⊕ M_s`, whose essential
spectrum is `[1/4, ∞)` and which has infinitely many eigenvalues in `[0, 1/4)`. The Summary (line
38–41) makes the same claim with the same hypotheses.

## H02 (kim-em) — answered

No change needed. The items the comment lists are at the head. Eigenfunction smoothness is in §3.7
(from line 1053). Uniqueness of the self-adjoint extension is in §3.6 (from line 1009). The chart
comparison, the compact-support bullet and Green's formula on `H¹` are in §3.4 (from line 932).

## H03 (kim-em) — answered

No change needed. In the merge order, MaassForms is at line 170, QuantumFoundations at line 224 and
this roadmap at line 225, so both suppliers merge first. The dependency check below reports 0
problems.

## H04 (kim-em) — answered

No change needed. Each line locator sits next to its published locator (theorem, section, equation
or page). The README text is the same as at `9ffa805`.

## H05 (kim-em) — answered

No change needed. The Downstream consumers paragraph (README line 1655–1672) names the input beyond
Layer 3: presenting a finite-area surface as a compact core plus finitely many standard cusp ends.
Its three citations were re-checked on main this round:

- GeometricTopology §7.1 ("Hyperbolic space and its isometries") presents a complete hyperbolic
  manifold as a quotient of hyperbolic space by a discrete group `Γ`.
- FuchsianOrbifolds Layer 3 item 1 gives finitely many cusp orbits for a cofinite group
  (`Subgroup.IsCofinite.finite_cuspOrbit`). Item 3 gives disjoint horodisc images whose removal
  leaves a compact part (`TauCeti.UpperHalfPlane.ConvexPolygon.isCompact_compl_iUnion_image_horodisc`).
- ComplexCurveModuli D6 item 2 is that roadmap's §6.2, "Hyperbolic collars and thick-core
  compactness", by its own label convention ("item n of Dk is §k.n").

## H06 (kim-em) — applied

The six lines of `Suggested.lean` over 100 characters are re-wrapped. Nothing else changes: the
token streams before and after differ only by the inserted `open scoped` keyword pair, and the
longest line is now under 100 characters.

| Old line | New lines | Change |
|---|---|---|
| 63 | 63–64 | The `open scoped …` line is split into two lines, with `open scoped TauCeti` on the second. |
| 85 | 86–88 | The docstring of `diag_spectralType_components` is re-flowed. |
| 254 | 255–256 | The instance binders of `gaffney_isSelfAdjoint_closure` are split after `[IsRiemannianManifold I M]`. |
| 281 | 282–283 | The same split, in `exists_mem_domain_closure_eq_zero_iff`. |
| 360 | 361–362 | The same split, in `Ici_quarter_subset_essentialSpectrum`. |
| 421 | 422–423 | The `↔` in the domain clause of `schrodinger_isSelfAdjoint_closure` is broken onto the next line. |

The README has no Lean code, so there is nothing else of this kind to fix.

## Build and gate

`lake build TauCetiRoadmap.SchrodingerOperatorsAndSpectralTypes.Suggested` (committed file):
`Build completed successfully (18552 jobs)`. It gave 13 ``declaration uses `sorry` `` warnings, one
for each of the 13 theorems, no other warnings and no errors.

Gate (after the commit):

    gate SchrodingerOperatorsAndSpectralTypes: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Dependency check (`gate --depcheck … --movable --pr 2424`):

    depcheck: 130 roadmaps, 1454 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. No supplier was added and no notion was moved down from a
later roadmap.

## Elaborated signatures

`#check @name` lines for all 20 declarations were appended to `Suggested.lean` temporarily and
elaborated once with the build command above. They were then removed: the committed file has no
`#check`. With whitespace normalised and the namespace prefix stripped, each elaborated type was
compared with the type recorded before the edit. All 20 are identical, so no binder was lost or
added. The file has no section `variable`s; every binder is in its declaration's own signature.

## Ownership, citations, sources

No statement was added or changed, so ownership is unchanged since the previous round.
`roadmaps resolve` reports no cross-roadmap citation and no Lean name that cannot be found. The
three citations in H05 were also opened on main. No source was fetched and
`needs-references.toml` was not written.

## Adversarial pass (statements added or changed)

No mathematical statement was added or changed. The pass therefore checks that the six re-wraps
preserve every declaration exactly.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `open scoped` line (old 63) | Token diff before/after; elaboration of all scoped notation used (`⟪·,·⟫_ℂ`, `∞`, `Δ`, `𝓢'`, `𝓘(ℝ, ℂ)`) | One inserted pair `open scoped`. The build succeeds and the elaborated types match 20/20. | Equivalent | Wrap only |
| `diag_spectralType_components` docstring (old 85) | Token diff | 0 token changes | Equivalent | Re-flow only |
| `gaffney_isSelfAdjoint_closure` binders (old 254) | `#check` before vs after; binders `[CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]` present | Elaborated types identical | Equivalent | Wrap only |
| `exists_mem_domain_closure_eq_zero_iff` binders (old 281) | As above | Elaborated types identical | Equivalent | Wrap only |
| `Ici_quarter_subset_essentialSpectrum` binders (old 360) | As above | Elaborated types identical | Equivalent | Wrap only |
| `schrodinger_isSelfAdjoint_closure` domain clause (old 421) | `#check`: the clause elaborates as `u ∈ T.closure.domain ↔ TemperedDistribution.MemSobolev 2 2 (Lp.toTemperedDistribution u)` before and after | Elaborated types identical. Precedence is unchanged because the line break falls after `↔`, inside the binder's parentheses. | Equivalent | Wrap only |

No passage of the comment asked for a command, a change outside the job, or a credential.
