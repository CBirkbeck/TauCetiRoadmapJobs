# Review of RiemannianGeometry (pull request #2226 at 530ac52)

**Verdict:** accepted

## Previous findings

- none: the review of 4788ed5 raised no finding. The repairs it recorded still hold, since this head leaves those passages untouched: the §1.1 locators at README lines 896 and 928, the consumer sentence at lines 4036–4038, and the description's "Edits to the parent README" paragraph.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| R5a's flat-ambient Gauss formula, as MS1.1 now consumes it: `Hess_Σ(x_i∘f)=⟨B,e_i⟩` | unit S² at (0,0,1); S² of radius ρ; 2ι on unit S² | Hess x₃=−g=⟨−gν,e₃⟩, Hess x₁=0; Σ\|Hess\|²=2=\|B\|²; −(ν_i/ρ)g, sum 2/ρ²; 2ι not isometric, 8≠½ | holds; sign agrees with R5a's Check B(X,Y)=−⟨X,Y⟩ν (README line 2916) |
| Downstream sentence, README lines 4036–4038 | parent ids cited in MinimalSurfaces/README.md at 530ac52 | R1 item 5:14, R3:5, R4.1:15, R4.2:3, R4.3:3, R4.5:6, R5a:25 (24 before), R5b:20, R5c:28, R7.0:9, R7.6:5, R7.9:16, R8.2:5 | exact; the change adds no new id |
| Opening paragraph, README lines 21–29 | MinimalSurfaces headings at 530ac52; the MS4 scope change | half-space theorem = MS4.2; "local compactness and ε-regularity" = the MS5 heading and the new Lean section comment; the parent never names unique continuation | every named item exists |
| Description, merge-order paragraph | heads of #2222 (90a5c6a), #2223 (a3dee99), #2224 (c6b1b05), #2225 (762bf82) | R5c at line 3392; R7.9 at 3843; R4.1 barriers at 2212; R3 free-endpoint second variation at 1570; Surfaces S6 at 779 | all four still open; every cited section resolves |
| Description, parent edits and the MS1 supplier list | `git diff origin/main...HEAD` on the parent README; the ids above | three hunks, as described; "R1 item 5, R3, R4.1–R4.3, R4.5, R5a, R5b, R5c, R7.0, R7.6, R7.9, R8.2" = the 13 counted ids | agrees with the head |

The rows for the 23 headline theorems and for the sampled targets §§1.1–2.3 stand as in the previous review, of 4788ed5. The parent README and `Suggested.lean` are byte-identical to that head.

- Scope of the change: `git diff --stat 4788ed5 HEAD` touches only `MinimalSurfaces/README.md` and `MinimalSurfaces/Suggested.lean`. Main has not changed the folder since the merge base 4294b15, and the head merges cleanly with main at 7342e8f. Nothing changed outside the roadmap folders.
- Seeded sample: §§1.1–2.3 lie outside the change. Spot-checked Bishop Theorem 6.11 at bishop-rg line 1872 (p. 41, page marker at line 1865) for §2.3.
- Library: Tau Ceti `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` at `LeviCivita/Immersion.lean:65` needs f C² at x with an isometric differential everywhere. It gives the tangential part, and R5a's B is the normal remainder.
- Cross-roadmap citations, resolved again on main: GeometricCurrents G6 at line 704 owns the strong one-sided maximum principle, as lines 23–24 say. GeneralizedCohomology G4.0b is a paragraph label at line 1082 on main. The overlap tool's lead that only #1808 defines it misses because the label is not a heading.
- Gate: my run at 530ac52 reports every check 0, OK, and the worker's run adds build=0. The dependency check prints `depcheck: 206 roadmaps, 1913 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` gives 23 warnings that a declaration uses `sorry`, and nothing else.
- Overlap check: read Surfaces (#2225), LorentzianGeometry (#2232), Yamabe (#2248), ManifoldOptimization (#1506), PositiveMass (#2247), RicciFlow, HopfRinow and GeometricCurrents. None of them owns R5a's Gauss formula or the coordinate-Hessian identity (Yamabe line 1112 uses `Hess x_i=−x_i g` only as a Check). The parent text is unchanged, so the owners recorded at 4788ed5 still hold: Bishop–Gromov is R4.1's, the stability form R5b's, B, S and submersions R5a's and R1's, and the interior tangency principle GeometricCurrents G6's.

## Not verifiable

- milnor-morse-theory, oneill-submersion, lee-irm, fulton-harris: settled as uncertified. They lie outside the change, so no text was read.

## Source issues

- none
