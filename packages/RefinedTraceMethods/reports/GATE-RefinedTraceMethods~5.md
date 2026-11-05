# GATE-RefinedTraceMethods~5: answers to human review of head f39dc40

One review was posted since the last reply (CBirkbeck, 2026-10-26T18:55:44Z). It makes two points: numbered finding 1, and the carried-over status note on the description. Its "Checked and found sound" list asks for nothing and so has no H-number. Repair commit: `8f4cead4` (README only; `Suggested.lean` unchanged).

## H01 (CBirkbeck) — applied

§2.2 (`TauCetiRoadmap/RefinedTraceMethods/README.md` line 541) used to set `Q=Fun(BC_p,Perf(R))/Perf(R[C_p])` and assert an exact symmetric monoidal `Perf(R^{tC_p})→Q`. It now names the uncompleted quotient `Q₀` and sets `Q=Idem(Q₀)`, the quotient in `Cat^perf_∞`. It records that `Q₀→Q` is fully faithful and symmetric monoidal, that `End(1)=R^{tC_p}` in both, and that the functor lands in Q and need not factor through `Q₀`. The route now builds the functor as `Mod_{R^{tC_p}}→Ind(Q₀)` restricted to compact objects, which are `Idem(Q₀)` by EnhancedDerivedSheaves E5:presentability.3. The reviewer's p=2 counterexample, `A=ℤ[s]/(s²−s−4)`, is now a negative-control Check, and the two former prose examples became Checks. §4.10 (line 1912) now uses `Q=Idem(Q₀)`, makes Q a `Perf(R^{tC_p})`-module in `Cat^perf_∞`, and identifies IK(Q) with the cofibre of `IK(R[C_p])→IK(Fun(BC_p,Perf(R)))` and with `IK(Q₀)` by §4.9 Morita invariance.

Verification:
- LMMT works only with idempotent-complete categories: `lmmt` lines 418–419 (§2.3, p. 10) and lines 551–552 (§3.3, p. 13). Its Remark 3.9 (`lmmt` lines 639–646) therefore takes Q in `Cat^perf_∞`.
- NS Theorem I.3.3 (`ns` lines 835–865) builds only the Dwyer–Kan quotient.
- EnhancedDerivedSheaves on main (546d9e4), line 1568, says the stable quotient comes from BordismFormalGroups F6.5 and that idempotent completion is a separate target (`idemCompletion`, E5:abstract.4, line 1544). Line 1700 (`indVerdierLocalization`, E5:presentability.3) identifies the compact objects of `Ind(C/D)` with `Idem(C/D)`.
- BordismFormalGroups F6.5 on main builds the uncompleted quotient C/D with its filtered mapping formula and monoidal version.

The same pass also corrected the supplier attribution, which was misplaced. The old §2.2 text and the EnhancedDerivedSheaves supplier row (line 55) credited the stable quotient to EDS E5. The quotient is now credited to BordismFormalGroups §F6.5 (row at line 63, marked "not idempotent completed"), and the EDS row now names E5:abstract.4 and E5:presentability.3. The NS locators were moved to the cached Acta text: Theorem I.3.3 on pp. 225–226, Proposition I.3.5 on pp. 228–229, Theorem I.3.6 on p. 230 and Lemma I.3.8 on pp. 231–232 (`ns` lines 835, 953, 1010, 1075).

Pattern search: no other place in the README has the defect.
- Every other categorical quotient was checked: §4.9 `Σ_κ` (already idempotent-completed), the §4.9 exact-sequence definition (uses `Idem(B/A)`), §4.4 Calkin (compact objects / `^Kar`), §2.10 THH of a Verdier sequence (Morita invariant, so completion does not matter) and §4.20 (presentable categories).
- No other functor out of perfect modules over a unit endomorphism ring appears.

## H02 (CBirkbeck) — answered

The status note concerns the pull-request description, which says two supplier pull requests are still awaiting merge. That text is outside the roadmap folder this job may change, so it is left for the worker to update when replying.

Nothing in the roadmap folder depends on that note. The README carries no pull-request numbers (gate `prnum=0`) and cites every supplier by roadmap name and section.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Q₀`, `Q=Idem(Q₀)`, `Q₀→Q` fully faithful symmetric monoidal | R=0; R=Hℚ; R=H𝔽_p | R=0: `Fun(BC_p,Perf 0)=0`, so `Q₀=Q=0`. R=Hℚ: the composite X→`R[C_p]⊗X`→X is multiplication by p, which is invertible, so every X is a retract of an induced object and `Q₀=Q=0` | holds | none |
| `End_Q(1)=End_{Q₀}(1)=R^{tC_p}` | R=H𝔽_p, p odd and p=2; R=Hℤ, p=2 | p odd: `π_*=𝔽_p[t^{±1}]⊗Λ(e)`, \|t\|=−2, \|e\|=−1. p=2: `𝔽₂[e^{±1}]`. Hℤ, p=2: π₀=`Ĥ⁰(C₂;ℤ)`=ℤ/2. Idem is fully faithful, so the ring is unchanged | holds | none |
| Exact symmetric monoidal `Perf(R^{tC_p})→Q` sending `R^{tC_p}` to the unit | R=0; R=Hℚ; R=H𝔽_p | R=0 and R=Hℚ: `R^{tC_p}=0`, so `Perf(0)=0→0`. H𝔽_p: unit ↦ trivial 𝔽_p. Compact objects are preserved because the right adjoint map(1,−) commutes with filtered colimits (1 is compact) | holds | functor built through `Ind(Q₀)` |
| "need not factor through `Q₀`" | p=2, A=`ℤ[s]/(s²−s−4)`; control A=ℤ×ℤ | Disc 17. A/2=`𝔽₂[s]/(s(s+1))`≅𝔽₂×𝔽₂. s̄²=s+4≡s̄, and s̄ is neither 0 nor 1. Under the two residue maps, s̄ goes to 0 and to 1, so the images of a splitting object would be ≅0 (parity 0) and ≅1 (parity 1). But χ is the same at both points because Spec A is connected, and perfect `𝔽₂[C₂]`-complexes have even χ. Contradiction, so s̄ does not split in `Q₀`. Control A=ℤ×ℤ: e=(1,0) splits already in `Fun(BC₂,Perf A)` as ℤ×0, with χ equal to 1 and 0 at the two components. So connectedness is what the argument uses | claim true; the uncompleted statement was false | new negative-control Check |
| Check "rational R ⇒ Q=0" | R=Hℚ, p=2 and 3 | `Ĥ^*(C_p;ℚ)=0`. Composite X→Ind X→X is ·p, a unit | holds | turned into a Check bullet |
| Check "HF_p unit not killed" | wrong ideal = all R-perfect objects | Quotient by everything is 0, which contradicts `End=𝔽_p^{tC_p}≠0` | holds | turned into a Check bullet |
| §4.10: IK(Q) is a module over `IK(Perf(R^{tC_p}))`; equals cofib(`IK(R[C_p])→IK(Fun(BC_p,Perf R))`) and `IK(Q₀)` | R=Hℚ; R=HA as above | Hℚ: Maschke gives `Fun(BC_p,Perf ℚ)≃Perf(ℚ[C_p])`, so the cofibre is 0=IK(0). HA: `[M]`∉ image of `K₀(Q₀)→K₀(Q)`, but `IK₀(Q₀)=IK₀(Q)` by §4.9 | holds | statement rewritten for `Q=Idem(Q₀)` |
| Supplier rows (BordismFormalGroups §F6.5 quotient; EDS E5:abstract.2, .4, presentability.3) | read at main 546d9e4 | BordismFormalGroups F6.5: "construct the quotient C/D at maps whose cofibers belong to D" with the filtered mapping formula and the monoidal DK quotient. EDS lines 1544, 1568, 1700 as quoted above | matches | rows corrected |

Context and generality: §2.2 and §4.10 keep R an E∞ ring spectrum and p any prime. Nothing was narrowed, and no hypothesis on R was added.

## Suggested.lean, imports and signatures

`Suggested.lean` declares nothing: an empty namespace and a module docstring naming the missing carriers. This repair changes no carrier at the pins, so it is unchanged. With no declarations there was nothing to `#check`, so the mechanical signature comparison had nothing to compare (the worker's `signatures.md` likewise reports no named declaration).

## Ownership and citations

- **Ownership.** Searching the open roadmap heads and main for the object (`R^{tC_p}`, `Fun(BC_p`, "finite-action") finds this roadmap only, so it owns the finite-action specialization. Generic Verdier quotients come from BordismFormalGroups §F6.5, and idempotent completion and Ind compact objects from EnhancedDerivedSheaves E5; both are cited, not replanned.
- **Citation leads.** The four Lean-name leads in `citations.md` resolve:
  - `AInf.Trace.tateOrbit`, `AInf.Trace.tateFinite` and `AInf.Trace.completedTateComparison` are at the open head of AInfCohomology, README lines 3833, 407 and 3834.
  - `Prismatic.Trace.rationalBeilinson` is at the open head of PrismaticCohomologyPartIII, README line 918.
  - Both roadmaps are earlier in the merge order. These are roadmap target names, not pinned library declarations.

## Build and gate

- `lake build TauCetiRoadmap.RefinedTraceMethods.Suggested`: `Build completed successfully (8976 jobs).`
- Gate after commit: `gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`--depcheck … --movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- No source was missing, so no `needs-references.toml` was written.
